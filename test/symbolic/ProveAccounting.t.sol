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
    invariantAccountingVsTokenBalance (EchidnaInvariantTests), split into the two layers it checks
    and proved one entrypoint at a time:

      (1) tokens vs Drips totals:     token.balanceOf(drips) == streams + splits   (Drips.balances)
      (2) Drips totals vs accounts:   splits  == sum of splittable + collectable
                                      streams == sum of stream balances, as long as nothing has
                                                 streamed yet; receive and squeeze move exactly the
                                                 received amount from streams to splits

    Only the driver moves tokens (transfer in before give/setStreams, Drips.withdraw after collect
    or a negative setStreams), so layer (1) holds iff every driver entrypoint moves the token
    balance and the Drips totals by the same amount. AccountingDriver calls the production
    DriverTransferUtils functions that AddressDriver uses, so the token movements are the real ones.

    Each property starts from an empty deployment and asserts both layers after every step. With
    only the accounts the property touches holding anything, the sums in (2) are over those
    accounts. Not covered: the streams side of (2) while time passes (sender balance drained vs
    receivable + squeezable), which is the continuous vs cycle-quantized question of
    testBalanceAtInFuture.
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
    uint160 constant RATE = 1e9; // 1 token per second
    uint128 constant DEPOSIT = 10_000_000_000; // the stream stays active for the whole window

    ERC20PresetFixedSupply token;
    DripsEchidna drips;
    AccountingDriver driver;
    uint256 me; // this contract's account, the one that gives, splits, streams and collects
    uint256 other; // a second account, splits and stream receiver

    function setUp() public {
        token = new ERC20PresetFixedSupply("Test", "TEST", type(uint128).max, address(this));
        drips = new DripsEchidna(CYCLE);
        drips.unpause_noModifiers();
        driver = new AccountingDriver(drips);
        token.approve(address(driver), type(uint256).max);
        me = driver.accountId(address(this));
        other = driver.accountId(address(0xB0B));
    }

    // layer (1)
    function _assertTokensMatchTotals() internal view {
        (uint128 streams, uint128 splits) = drips.balances(token);
        assert(token.balanceOf(address(drips)) == uint256(streams) + uint256(splits));
    }

    // layer (2), splits side, over the two accounts that can hold anything
    function _assertSplitsMatchAccounts() internal view {
        (, uint128 splits) = drips.balances(token);
        uint256 held = uint256(drips.splittable(me, token)) + drips.collectable(me, token)
            + drips.splittable(other, token) + drips.collectable(other, token);
        assert(splits == held);
    }

    // layer (2), streams side, while nothing has streamed yet (no receivers, or time not moved)
    function _assertStreamsMatchBalance(StreamReceiver[] memory receivers) internal view {
        (uint128 streams,) = drips.balances(token);
        assert(streams == drips.balanceAt(me, token, receivers, uint32(block.timestamp)));
    }

    function _oneReceiver(uint32 weight) internal view returns (SplitsReceiver[] memory r) {
        r = new SplitsReceiver[](1);
        r[0] = SplitsReceiver({accountId: other, weight: weight});
    }

    function _stream() internal view returns (StreamReceiver[] memory r) {
        r = new StreamReceiver[](1);
        r[0] = StreamReceiver(other, StreamConfigImpl.create(0, RATE, 0, 0));
    }

    // give: tokens come in, the receiver's splittable and the splits total rise by amt
    function prove_accounting_give(uint128 amt) public {
        uint256 userBefore = token.balanceOf(address(this));
        driver.give(other, token, amt);
        _assertTokensMatchTotals();
        _assertSplitsMatchAccounts();
        assert(drips.splittable(other, token) == amt);
        assert(token.balanceOf(address(this)) == userBefore - amt);
    }

    // Split into two properties to keep the number of calls into Drips on one path below
    // symExecMaxIters: the loop heuristic counts each repeated call dispatch as a loop iteration.

    // give to self -> split (any single-receiver weight): no tokens move, splittable becomes
    // collectable + the receiver's splittable
    function prove_accounting_split(uint128 amt, uint32 weight) public {
        require(weight >= 1 && weight <= 1_000_000);
        driver.setSplits(_oneReceiver(weight));
        driver.give(me, token, amt);
        drips.split(me, token, _oneReceiver(weight));
        _assertTokensMatchTotals();
        _assertSplitsMatchAccounts();
    }

    // give to self -> split -> collect: the whole collectable amount leaves Drips to the user
    function prove_accounting_collect(uint128 amt, uint32 weight) public {
        require(weight >= 1 && weight <= 1_000_000);
        driver.setSplits(_oneReceiver(weight));
        driver.give(me, token, amt);
        drips.split(me, token, _oneReceiver(weight));
        uint128 collectable = drips.collectable(me, token);
        uint256 userBefore = token.balanceOf(address(this));
        uint128 collected = driver.collect(token, address(this));
        _assertTokensMatchTotals();
        _assertSplitsMatchAccounts();
        assert(collected == collectable);
        assert(token.balanceOf(address(this)) == userBefore + collected);
    }

    // setStreams with no receivers: deposit, then change the balance by any delta (withdrawals are
    // capped at the balance and sent back by Drips.withdraw)
    function prove_accounting_stream_balance(uint128 deposit, int128 delta) public {
        require(deposit <= uint128(type(int128).max));
        StreamReceiver[] memory none = new StreamReceiver[](0);
        driver.setStreams(token, none, int128(deposit), none, 0, 0, address(this));
        _assertTokensMatchTotals();
        _assertStreamsMatchBalance(none);

        uint256 userBefore = token.balanceOf(address(this));
        int128 real = driver.setStreams(token, none, delta, none, 0, 0, address(this));
        _assertTokensMatchTotals();
        _assertStreamsMatchBalance(none);
        assert(int256(token.balanceOf(address(this))) == int256(userBefore) - real);
    }

    function _startStream() internal {
        StreamReceiver[] memory none = new StreamReceiver[](0);
        driver.setStreams(token, none, int128(DEPOSIT), _stream(), 0, 0, address(this));
        _assertTokensMatchTotals();
        _assertStreamsMatchBalance(_stream());
    }

    // receiveStreams at any time within one cycle length: streams -> splits by exactly the received
    // amount, no tokens move
    function prove_accounting_receive(uint32 dt, uint32 maxCycles) public {
        _startStream();
        warpBy(dt, CYCLE);
        (uint128 streamsBefore, uint128 splitsBefore) = drips.balances(token);
        uint128 received = drips.receiveStreams(other, token, maxCycles);
        (uint128 streamsAfter, uint128 splitsAfter) = drips.balances(token);
        _assertTokensMatchTotals();
        _assertSplitsMatchAccounts();
        assert(streamsAfter == streamsBefore - received);
        assert(splitsAfter == splitsBefore + received);
    }

    // squeezeStreams with the one-entry history at any time within one cycle length: the same
    function prove_accounting_squeeze(uint32 dt) public {
        _startStream();
        (,, uint32 updateTime,, uint32 maxEnd) = drips.streamsState(me, token);
        warpBy(dt, CYCLE);
        StreamsHistory[] memory history = new StreamsHistory[](1);
        history[0] = StreamsHistory(bytes32(0), _stream(), updateTime, maxEnd);
        (uint128 streamsBefore, uint128 splitsBefore) = drips.balances(token);
        uint128 squeezed = drips.squeezeStreams(other, token, me, bytes32(0), history);
        (uint128 streamsAfter, uint128 splitsAfter) = drips.balances(token);
        _assertTokensMatchTotals();
        _assertSplitsMatchAccounts();
        assert(streamsAfter == streamsBefore - squeezed);
        assert(splitsAfter == splitsBefore + squeezed);
    }

    // invariantWithdrawShouldAlwaysFail: with tokens matching the totals there is nothing to
    // withdraw directly from Drips
    function prove_accounting_withdraw_fails(uint128 given, uint256 amt) public {
        require(amt > 0);
        driver.give(other, token, given);
        _assertTokensMatchTotals();
        try drips.withdraw(token, address(this), amt) {
            assert(false);
        } catch {}
    }
}
