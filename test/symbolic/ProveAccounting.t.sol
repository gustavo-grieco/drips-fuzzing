// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {EchidnaStart} from "./EchidnaStart.sol";
import {DriverTransferUtils} from "src/DriverTransferUtils.sol";
import {DripsEchidna} from "src/echidna/tools/DripsEchidna.sol";
import {SplitsReceiver} from "src/Splits.sol";
import {StreamReceiver, StreamsHistory, StreamConfigImpl} from "src/Streams.sol";
import {
    IERC20,
    ERC20PresetFixedSupply
} from "openzeppelin-contracts/token/ERC20/presets/ERC20PresetFixedSupply.sol";

/*
    invariantAccountingVsTokenBalance (EchidnaInvariantTests), proved inductively, one entrypoint
    at a time. The invariant has two layers:

      (1) tokens vs Drips totals:   token.balanceOf(drips) == streams + splits   (Drips.balances)
      (2) totals vs accounts:       splits  == sum over all accounts of splittable + collectable
                                    streams == sum of stream balances + receivable + squeezable

    Each property starts from a symbolic state that satisfies the invariant, written with vm.store:
    symbolic totals S and P with token.balanceOf(drips) == S + P <= MAX_TOTAL_BALANCE, a symbolic
    token balance for the user, and symbolic balances for every account the entrypoint touches plus
    one bystander account. All other accounts are folded into the rest, R = P - (touched + bystander)
    >= 0 (and S - stream balance >= 0 for setStreams). It then calls the entrypoint and checks that
    (1) still holds, that R is unchanged (so (2) still holds for whatever R stood for), and that the
    bystander did not change.

    Only the driver moves tokens (transfer in before give/setStreams, Drips.withdraw after collect
    or a negative setStreams). AccountingDriver calls the production DriverTransferUtils functions
    that AddressDriver uses, so the token movements are the real ones.

    For receive and squeeze the streams state is symbolic too: any amtDeltas over two receivable
    cycles, and a sender history entry with any rate and maxEnd, at a fixed time. The streams side of (2)
    while time passes (sender balance drained vs receivable + squeezable) is not covered; it is the
    continuous vs cycle-quantized question of testBalanceAtInFuture.
*/
contract AccountingDriver is DriverTransferUtils {
    DripsEchidna public immutable drips;
    uint32 public immutable driverId;

    constructor(DripsEchidna drips_) DriverTransferUtils(address(0)) {
        drips = drips_;
        driverId = drips_.registerDriver(address(this));
    }

    function accountId(address user) public view returns (uint256) {
        return (uint256(driverId) << drips.DRIVER_ID_OFFSET()) | uint160(user);
    }

    function give(uint256 receiver, IERC20 erc20, uint128 amt) external {
        _giveAndTransfer(drips, accountId(msg.sender), receiver, erc20, amt);
    }

    function collect(IERC20 erc20, address transferTo) external returns (uint128) {
        return _collectAndTransfer(drips, accountId(msg.sender), erc20, transferTo);
    }

    function setStreams(
        IERC20 erc20,
        StreamReceiver[] calldata currReceivers,
        int128 balanceDelta,
        StreamReceiver[] calldata newReceivers,
        uint32 maxEndHint1,
        uint32 maxEndHint2,
        address transferTo
    ) external returns (int128) {
        return _setStreamsAndTransfer(
            drips,
            accountId(msg.sender),
            erc20,
            currReceivers,
            balanceDelta,
            newReceivers,
            maxEndHint1,
            maxEndHint2,
            transferTo
        );
    }

    function setSplits(SplitsReceiver[] calldata receivers) external {
        drips.setSplits(accountId(msg.sender), receivers);
    }
}

contract ProveAccounting is EchidnaStart, Test {
    uint32 constant CYCLE = 604800;

    // Managed._erc1967Slot: keccak256(name) - 1024
    uint256 constant DRIPS_SLOT = uint256(keccak256("eip1967.drips.storage")) - 1024;
    uint256 constant SPLITS_SLOT = uint256(keccak256("eip1967.splits.storage")) - 1024;
    uint256 constant STREAMS_SLOT = uint256(keccak256("eip1967.streams.storage")) - 1024;

    ERC20PresetFixedSupply token;
    DripsEchidna drips;
    AccountingDriver driver;
    uint256 me; // this contract's account: gives, splits, streams and collects
    uint256 other; // splits and stream receiver
    uint256 bystander; // holds balances, must not be touched

    function setUp() public {
        // supply far above any balance the properties store, so OZ's unchecked balance additions
        // cannot wrap
        token = new ERC20PresetFixedSupply("Test", "TEST", 2 ** 255, address(this));
        drips = new DripsEchidna(CYCLE);
        drips.unpause_noModifiers();
        driver = new AccountingDriver(drips);
        token.approve(address(driver), type(uint256).max);
        me = driver.accountId(address(this));
        other = driver.accountId(address(0xB0B));
        bystander = driver.accountId(address(0xCAFE));
    }

    // ---- symbolic valid state ----

    // Drips totals S (streams) and P (splits), backed by exactly S + P tokens: layer (1)
    function _totals(uint128 streams, uint128 splits) internal {
        require(uint256(streams) + splits <= drips.MAX_TOTAL_BALANCE());
        bytes32 slot = keccak256(abi.encode(address(token), DRIPS_SLOT + 2)); // balances[token]
        vm.store(address(drips), slot, bytes32(uint256(streams) | (uint256(splits) << 128)));
        _tokenBalance(address(drips), uint256(streams) + splits);
    }

    function _tokenBalance(address holder, uint256 amt) internal {
        vm.store(address(token), keccak256(abi.encode(holder, uint256(0))), bytes32(amt)); // _balances
    }

    // splitsStates[acc].balances[token] = (splittable, collectable)
    function _splitsBalance(uint256 acc, uint128 splittable, uint128 collectable) internal {
        bytes32 state = keccak256(abi.encode(acc, SPLITS_SLOT));
        bytes32 slot = keccak256(abi.encode(address(token), uint256(state) + 1));
        vm.store(address(drips), slot, bytes32(uint256(splittable) | (uint256(collectable) << 128)));
    }

    // states[token][acc] with no receivers: only the balance (bits 96..223 of the packed word at
    // +3) and updateTime (bits 32..63) matter
    function _streamBalance(uint256 acc, uint128 balance) internal {
        bytes32 byToken = keccak256(abi.encode(address(token), STREAMS_SLOT));
        uint256 slot = uint256(keccak256(abi.encode(acc, byToken))) + 3;
        vm.store(
            address(drips),
            bytes32(slot),
            bytes32((uint256(START_TIMESTAMP) << 32) | (uint256(balance) << 96))
        );
    }

    function _held(uint256 acc) internal view returns (uint256) {
        return uint256(drips.splittable(acc, token)) + drips.collectable(acc, token);
    }

    // ---- invariant checks ----

    // layer (1)
    function _assertTokensMatchTotals() internal view {
        (uint128 streams, uint128 splits) = drips.balances(token);
        assert(token.balanceOf(address(drips)) == uint256(streams) + splits);
    }

    // layer (2), splits side: P is still the unchanged rest plus what the listed accounts hold.
    // Written as a sum, so a broken invariant fails the assertion instead of reverting (a revert
    // counts as a pass).
    function _assertSplitsRest(uint256 rest, uint256 heldByListed) internal view {
        (, uint128 splits) = drips.balances(token);
        assert(splits == rest + heldByListed);
    }

    function _assertBystander(uint128 splittable, uint128 collectable) internal view {
        assert(drips.splittable(bystander, token) == splittable);
        assert(drips.collectable(bystander, token) == collectable);
    }

    function _oneReceiver(uint32 weight) internal view returns (SplitsReceiver[] memory r) {
        r = new SplitsReceiver[](1);
        r[0] = SplitsReceiver({accountId: other, weight: weight});
    }

    // ---- entrypoints ----

    // give: amt tokens come in, the receiver's splittable and P rise by amt
    function prove_accounting_give(
        uint128 streams,
        uint128 splits,
        uint128 user,
        uint128 otherSplittable,
        uint128 otherCollectable,
        uint128 bySplittable,
        uint128 byCollectable,
        uint128 amt
    ) public {
        _totals(streams, splits);
        _tokenBalance(address(this), user);
        _splitsBalance(other, otherSplittable, otherCollectable);
        _splitsBalance(bystander, bySplittable, byCollectable);
        uint256 held = uint256(otherSplittable) + otherCollectable + bySplittable + byCollectable;
        require(held <= splits);

        driver.give(other, token, amt);

        _assertTokensMatchTotals();
        _assertSplitsRest(splits - held, _held(other) + _held(bystander));
        assert(drips.splittable(other, token) == uint256(otherSplittable) + amt);
        assert(token.balanceOf(address(this)) + amt == user);
        _assertBystander(bySplittable, byCollectable);
    }

    // split, any single-receiver weight: no tokens move; my splittable becomes my collectable plus
    // the receiver's splittable
    function prove_accounting_split(
        uint128 streams,
        uint128 splits,
        uint128 mySplittable,
        uint128 myCollectable,
        uint128 otherSplittable,
        uint128 otherCollectable,
        uint128 bySplittable,
        uint128 byCollectable,
        uint32 weight
    ) public {
        require(weight >= 1 && weight <= 1_000_000);
        _totals(streams, splits);
        _splitsBalance(me, mySplittable, myCollectable);
        _splitsBalance(other, otherSplittable, otherCollectable);
        _splitsBalance(bystander, bySplittable, byCollectable);
        uint256 held = uint256(mySplittable) + myCollectable + otherSplittable + otherCollectable
            + bySplittable + byCollectable;
        require(held <= splits);
        driver.setSplits(_oneReceiver(weight));

        drips.split(me, token, _oneReceiver(weight));

        _assertTokensMatchTotals();
        _assertSplitsRest(splits - held, _held(me) + _held(other) + _held(bystander));
        assert(drips.splittable(me, token) == 0);
        _assertBystander(bySplittable, byCollectable);
    }

    // collect: my whole collectable amount leaves Drips to the user, P drops by it
    function prove_accounting_collect(
        uint128 streams,
        uint128 splits,
        uint128 user,
        uint128 mySplittable,
        uint128 myCollectable,
        uint128 bySplittable,
        uint128 byCollectable
    ) public {
        _totals(streams, splits);
        _tokenBalance(address(this), user);
        _splitsBalance(me, mySplittable, myCollectable);
        _splitsBalance(bystander, bySplittable, byCollectable);
        uint256 held = uint256(mySplittable) + myCollectable + bySplittable + byCollectable;
        require(held <= splits);

        uint128 collected = driver.collect(token, address(this));

        _assertTokensMatchTotals();
        _assertSplitsRest(splits - held, _held(me) + _held(bystander));
        assert(collected == myCollectable);
        assert(drips.collectable(me, token) == 0);
        assert(token.balanceOf(address(this)) == uint256(user) + collected);
        _assertBystander(bySplittable, byCollectable);
    }

    // setStreams with no receivers, from any stream balance, by any delta (withdrawals are capped
    // at the balance and sent back by Drips.withdraw): S moves with my stream balance
    function prove_accounting_stream_balance(
        uint128 streams,
        uint128 splits,
        uint128 user,
        uint128 myBalance,
        int128 delta
    ) public {
        _totals(streams, splits);
        _tokenBalance(address(this), user);
        _streamBalance(me, myBalance);
        require(myBalance <= streams);
        StreamReceiver[] memory none = new StreamReceiver[](0);

        int128 real = driver.setStreams(token, none, delta, none, 0, 0, address(this));

        _assertTokensMatchTotals();
        (uint128 streamsAfter,) = drips.balances(token);
        uint128 balanceAfter = drips.balanceAt(me, token, none, uint32(block.timestamp));
        assert(streamsAfter == uint256(streams - myBalance) + balanceAfter);
        assert(int256(uint256(balanceAfter)) == int256(uint256(myBalance)) + real);
        assert(int256(token.balanceOf(address(this))) == int256(uint256(user)) - real);
    }

    // states[token][acc], the base slot of the account's StreamsState
    function _streamsState(uint256 acc) internal view returns (uint256) {
        bytes32 byToken = keccak256(abi.encode(address(token), STREAMS_SLOT));
        return uint256(keccak256(abi.encode(acc, byToken)));
    }

    // amtDeltas[cycle] (at +4) = (thisCycle, nextCycle)
    function _amtDelta(uint256 acc, uint32 cycle, int128 thisCycle, int128 nextCycle) internal {
        bytes32 slot = keccak256(abi.encode(uint256(cycle), _streamsState(acc) + 4));
        vm.store(
            address(drips),
            slot,
            bytes32(uint256(uint128(thisCycle)) | (uint256(uint128(nextCycle)) << 128))
        );
    }

    // receiveStreams: any receiver state with two finished cycles to receive (any amtDeltas whose
    // running amounts are non-negative and whose total is backed by S) and any maxCycles. Exactly
    // the received amount moves from S to P and to the receiver's splittable, no tokens move.
    function prove_accounting_receive(
        uint128 streams,
        uint128 splits,
        uint128 otherSplittable,
        uint128 otherCollectable,
        uint128 bySplittable,
        uint128 byCollectable,
        int128[4] memory deltas,
        uint32 maxCycles
    ) public {
        vm.warp(START_TIMESTAMP); // echidna's symbolic transaction may come later than setUp
        _totals(streams, splits);
        _splitsBalance(other, otherSplittable, otherCollectable);
        _splitsBalance(bystander, bySplittable, byCollectable);
        uint256 held = uint256(otherSplittable) + otherCollectable + bySplittable + byCollectable;
        require(held <= splits);
        // cycles C and C + 1 are finished, C + 2 is the current one
        uint32 c = START_TIMESTAMP / CYCLE - 1;
        vm.store(address(drips), bytes32(_streamsState(other) + 3), bytes32(uint256(c))); // nextReceivableCycle
        _amtDelta(other, c, deltas[0], deltas[1]);
        _amtDelta(other, c + 1, deltas[2], deltas[3]);
        int256 first = deltas[0];
        int256 second = first + deltas[1] + deltas[2];
        require(first >= 0 && second >= 0 && first + second <= int256(uint256(streams)));

        uint128 received = drips.receiveStreams(other, token, maxCycles);

        _assertTokensMatchTotals();
        (uint128 streamsAfter,) = drips.balances(token);
        assert(uint256(streamsAfter) + received == streams);
        _assertSplitsRest(splits - held, _held(other) + _held(bystander));
        assert(drips.splittable(other, token) == uint256(otherSplittable) + received);
        _assertBystander(bySplittable, byCollectable);
    }

    // squeezeStreams: a sender whose history is one entry streaming to `other` at any rate, set
    // in the current cycle with any maxEnd, and any squeezable amount backed by S. The same
    // movement as receive.
    function prove_accounting_squeeze(
        uint128 streams,
        uint128 splits,
        uint128 otherSplittable,
        uint128 otherCollectable,
        uint128 bySplittable,
        uint128 byCollectable,
        uint160 rate,
        uint32 maxEnd
    ) public {
        vm.warp(START_TIMESTAMP);
        _totals(streams, splits);
        _splitsBalance(other, otherSplittable, otherCollectable);
        _splitsBalance(bystander, bySplittable, byCollectable);
        uint256 held = uint256(otherSplittable) + otherCollectable + bySplittable + byCollectable;
        require(held <= splits);
        require(rate >= drips.minAmtPerSec() && rate <= 2 ** 100);
        uint32 updateTime = START_TIMESTAMP / CYCLE * CYCLE + 1000; // in the current cycle
        StreamsHistory[] memory history = new StreamsHistory[](1);
        StreamReceiver[] memory receivers = new StreamReceiver[](1);
        receivers[0] = StreamReceiver(other, StreamConfigImpl.create(0, rate, 0, 0));
        history[0] = StreamsHistory(bytes32(0), receivers, updateTime, maxEnd);
        bytes32 historyHash = drips.hashStreamsHistory(0, drips.hashStreams(receivers), updateTime, maxEnd);
        vm.store(address(drips), bytes32(_streamsState(me)), historyHash); // streamsHistoryHash
        vm.store( // updateTime, maxEnd, lastUpdatedCycleConfigs = 1
            address(drips),
            bytes32(_streamsState(me) + 3),
            bytes32((uint256(updateTime) << 32) | (uint256(maxEnd) << 64) | (uint256(1) << 224))
        );
        require(drips.squeezeStreamsResult(other, token, me, bytes32(0), history) <= streams);

        uint128 squeezed = drips.squeezeStreams(other, token, me, bytes32(0), history);

        _assertTokensMatchTotals();
        (uint128 streamsAfter,) = drips.balances(token);
        assert(uint256(streamsAfter) + squeezed == streams);
        _assertSplitsRest(splits - held, _held(other) + _held(bystander));
        assert(drips.splittable(other, token) == uint256(otherSplittable) + squeezed);
        _assertBystander(bySplittable, byCollectable);
    }

    // invariantWithdrawShouldAlwaysFail: when tokens match the totals there is nothing to withdraw
    function prove_accounting_withdraw_fails(uint128 streams, uint128 splits, uint256 amt) public {
        require(amt > 0);
        _totals(streams, splits);
        try drips.withdraw(token, address(this), amt) {
            assert(false);
        } catch {}
    }
}
