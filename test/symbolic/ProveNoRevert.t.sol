// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {EchidnaStart} from "./EchidnaStart.sol";
import {Splits, SplitsReceiver} from "src/Splits.sol";
import {Streams, StreamReceiver, StreamConfigImpl} from "src/Streams.sol";
import {IERC20} from "openzeppelin-contracts/token/ERC20/IERC20.sol";

/*
    Module-level no-revert properties (mirroring Echidna's test*ShouldNotRevert family):
    with the suite's clamps as preconditions, the operation must NEVER revert — for ALL inputs.
    Pattern: try h.op(...) {} catch { assert(false); }
*/
contract NoRevSplitsHarness is Splits {
    uint256 constant ACC = 7;
    uint256 constant RECV = 42;
    IERC20 constant ERC20 = IERC20(address(0xE12C20));
    constructor() Splits(keccak256("drips.norev.splits.fv")) {}

    function _cfg(uint32 w) internal pure returns (SplitsReceiver[] memory r) {
        r = new SplitsReceiver[](1);
        r[0] = SplitsReceiver(RECV, w);
    }
    function doSetSplits(uint32 w) external { _setSplits(ACC, _cfg(w)); }
    function doSplit(uint32 w, uint128 amt) external {
        _setSplits(ACC, _cfg(w));
        _addSplittable(ACC, ERC20, amt);
        _split(ACC, ERC20, _cfg(w));
    }
    function doCollect(uint32 w, uint128 amt) external {
        _setSplits(ACC, _cfg(w));
        _addSplittable(ACC, ERC20, amt);
        _split(ACC, ERC20, _cfg(w));
        _collect(ACC, ERC20);
    }
    function doGive(uint128 amt) external { _addSplittable(RECV, ERC20, amt); }
    // append a second receiver (testAddSplitsShouldNotRevert)
    function doAddSplits(uint32 w1, uint32 w2) external {
        _setSplits(ACC, _cfg(w1));
        SplitsReceiver[] memory r2 = new SplitsReceiver[](2);
        r2[0] = SplitsReceiver(RECV, w1);
        r2[1] = SplitsReceiver(RECV + 1, w2);
        _setSplits(ACC, r2);
    }
}

contract NoRevStreamsHarness is Streams {
    uint256 constant ACC = 100;
    IERC20 constant ERC20 = IERC20(address(0xE12C20));
    constructor() Streams(604800, keccak256("drips.norev.streams.fv")) {}
    function maxBal() external pure returns (uint128) { return _MAX_STREAMS_BALANCE; }
    function minAmt() external view returns (uint160) { return _minAmtPerSec; }
    // zero balance => _calcMaxEnd shortcircuits concretely; tests the receiver-validation path
    function doSetStreamsZeroBal(uint160 aps) external {
        StreamReceiver[] memory empty = new StreamReceiver[](0);
        StreamReceiver[] memory r = new StreamReceiver[](1);
        r[0] = StreamReceiver(42, StreamConfigImpl.create(0, aps, 0, 0));
        _setStreams(ACC, ERC20, empty, 0, r, 0, 0);
    }
    // add a 2nd stream receiver at zero balance (validation path, _calcMaxEnd shortcircuits)
    function doAddStream(uint160 aps1, uint160 aps2) external {
        StreamReceiver[] memory e = new StreamReceiver[](0);
        StreamReceiver[] memory r1 = new StreamReceiver[](1);
        r1[0] = StreamReceiver(42, StreamConfigImpl.create(0, aps1, 0, 0));
        _setStreams(ACC, ERC20, e, 0, r1, 0, 0);
        StreamReceiver[] memory r2 = new StreamReceiver[](2);
        r2[0] = r1[0];
        r2[1] = StreamReceiver(43, StreamConfigImpl.create(0, aps2, 0, 0));
        _setStreams(ACC, ERC20, r1, 0, r2, 0, 0);
    }
    // remove a stream receiver at zero balance
    function doRemoveStream(uint160 aps1, uint160 aps2) external {
        StreamReceiver[] memory e = new StreamReceiver[](0);
        StreamReceiver[] memory r2 = new StreamReceiver[](2);
        r2[0] = StreamReceiver(42, StreamConfigImpl.create(0, aps1, 0, 0));
        r2[1] = StreamReceiver(43, StreamConfigImpl.create(0, aps2, 0, 0));
        _setStreams(ACC, ERC20, e, 0, r2, 0, 0);
        StreamReceiver[] memory r1 = new StreamReceiver[](1);
        r1[0] = r2[0];
        _setStreams(ACC, ERC20, r2, 0, r1, 0, 0);
    }
    // empty receivers => _calcMaxEnd shortcircuits concretely
    function doSetBalance(int128 delta) external {
        StreamReceiver[] memory empty = new StreamReceiver[](0);
        _setStreams(ACC, ERC20, empty, delta, empty, 0, 0);
    }
}

contract ProveNoRevert is EchidnaStart, Test {
    NoRevSplitsHarness hs;
    NoRevStreamsHarness hst;
    function setUp() public { hs = new NoRevSplitsHarness(); hst = new NoRevStreamsHarness(); }

    // testSetSplitsShouldNotRevert: any valid single-receiver config
    function prove_setsplits_no_revert(uint32 w) public {
        require(w >= 1 && w <= 1_000_000);
        try hs.doSetSplits(w) {} catch { assert(false); }
    }
    // testSplitShouldNotRevert: split never reverts, any valid config, any amount
    function prove_split_no_revert(uint32 w, uint128 amt) public {
        require(w >= 1 && w <= 1_000_000);
        try hs.doSplit(w, amt) {} catch { assert(false); }
    }
    // testCollectShouldNotRevert
    function prove_collect_no_revert(uint32 w, uint128 amt) public {
        require(w >= 1 && w <= 1_000_000);
        try hs.doCollect(w, amt) {} catch { assert(false); }
    }
    // testGiveShouldNotRevert (single give from zero balance)
    function prove_give_no_revert(uint128 amt) public {
        try hs.doGive(amt) {} catch { assert(false); }
    }
    // testSetStreamBalanceShouldNotRevert (module, empty receivers, clamped deposit)
    function prove_setbalance_no_revert(int128 delta, uint32 dt) public {
        warpBy(dt, 604800);
        require(delta >= 0 && uint128(delta) <= hst.maxBal());
        try hst.doSetBalance(delta) {} catch { assert(false); }
    }
    // withdraw-all variant: withdrawing everything never reverts
    function prove_withdrawall_no_revert(int128 deposit, uint32 dt) public {
        warpBy(dt, 604800);
        require(deposit >= 0 && uint128(deposit) <= hst.maxBal());
        hst.doSetBalance(deposit);
        try hst.doSetBalance(type(int128).min) {} catch { assert(false); }
    }

    // testAddSplitsShouldNotRevert: appending a valid receiver never reverts
    function prove_addsplits_no_revert(uint32 w1, uint32 w2) public {
        require(w1 >= 1 && w2 >= 1 && uint256(w1) + uint256(w2) <= 1_000_000);
        try hs.doAddSplits(w1, w2) {} catch { assert(false); }
    }
    // testSetStreamsShouldNotRevert (zero balance): valid receiver config never reverts, ∀ amtPerSec
    function prove_setstreams_no_revert_zerobal(uint160 aps, uint32 dt) public {
        warpBy(dt, 604800);
        require(aps >= hst.minAmt());
        try hst.doSetStreamsZeroBal(aps) {} catch { assert(false); }
    }

    // = testAddStreamShouldNotRevert (zero-balance scope)
    function prove_addstream_no_revert_zerobal(uint160 aps1, uint160 aps2, uint32 dt) public {
        warpBy(dt, 604800);
        require(aps1 >= hst.minAmt() && aps2 >= hst.minAmt());
        try hst.doAddStream(aps1, aps2) {} catch { assert(false); }
    }
    // = testRemoveStreamShouldNotRevert (zero-balance scope)
    function prove_removestream_no_revert_zerobal(uint160 aps1, uint160 aps2, uint32 dt) public {
        warpBy(dt, 604800);
        require(aps1 >= hst.minAmt() && aps2 >= hst.minAmt());
        try hst.doRemoveStream(aps1, aps2) {} catch { assert(false); }
    }
}
