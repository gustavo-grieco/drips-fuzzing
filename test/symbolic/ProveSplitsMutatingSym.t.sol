// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Splits, SplitsReceiver} from "src/Splits.sol";
import {IERC20} from "openzeppelin-contracts/token/ERC20/IERC20.sol";

/*
    Tier-2 generalization: the mutating Splits echidna properties, but with SYMBOLIC WEIGHT and
    SYMBOLIC amount — so they hold for EVERY single-receiver split config, not just the fixed 300k.
    Real _setSplits/_split/_collect. If all verify, these can leave the fuzzer.
*/
contract SplitsMutSymHarness is Splits {
    uint256 constant ACC = 7;
    uint256 constant RECV = 42;
    IERC20 constant ERC20 = IERC20(address(0xE12C20));
    constructor() Splits(keccak256("drips.splits.mutsym.fv")) {}

    function _cfg(uint32 w) internal pure returns (SplitsReceiver[] memory r) {
        r = new SplitsReceiver[](1);
        r[0] = SplitsReceiver({accountId: RECV, weight: w});
    }
    // testSplitViewVsActual
    function viewVsActual(uint32 w, uint128 amt) external returns (uint128 cv, uint128 sv, uint128 ca, uint128 sa) {
        SplitsReceiver[] memory r = _cfg(w);
        _setSplits(ACC, r);
        _addSplittable(ACC, ERC20, amt);
        (cv, sv) = _splitResult(ACC, r, _splittable(ACC, ERC20));
        (ca, sa) = _split(ACC, ERC20, r);
    }
    // testSplittableAfterSplit
    function splittableAfter(uint32 w, uint128 amt) external returns (uint128 bef, uint128 c, uint128 s, uint128 aft) {
        SplitsReceiver[] memory r = _cfg(w);
        _setSplits(ACC, r);
        _addSplittable(ACC, ERC20, amt);
        bef = _splittable(ACC, ERC20);
        (c, s) = _split(ACC, ERC20, r);
        aft = _splittable(ACC, ERC20);
    }
    // testCollectableAfterSplit
    function collectableAfter(uint32 w, uint128 amt) external returns (uint128 b, uint128 c, uint128 a) {
        SplitsReceiver[] memory r = _cfg(w);
        _setSplits(ACC, r);
        b = _collectable(ACC, ERC20);
        _addSplittable(ACC, ERC20, amt);
        (c,) = _split(ACC, ERC20, r);
        a = _collectable(ACC, ERC20);
    }
    // testReceiversReceivedSplit
    function receiverGot(uint32 w, uint128 amt) external returns (uint128 rb, uint128 s, uint128 ra) {
        SplitsReceiver[] memory r = _cfg(w);
        _setSplits(ACC, r);
        rb = _splittable(RECV, ERC20);
        _addSplittable(ACC, ERC20, amt);
        (, s) = _split(ACC, ERC20, r);
        ra = _splittable(RECV, ERC20);
    }
    // testCollect (module part)
    function collectZeroes(uint32 w, uint128 amt) external returns (uint128 cb, uint128 got, uint128 ca) {
        SplitsReceiver[] memory r = _cfg(w);
        _setSplits(ACC, r);
        _addSplittable(ACC, ERC20, amt);
        _split(ACC, ERC20, r);
        cb = _collectable(ACC, ERC20);
        got = _collect(ACC, ERC20);
        ca = _collectable(ACC, ERC20);
    }
}

contract ProveSplitsMutatingSym is Test {
    SplitsMutSymHarness h;
    function setUp() public { h = new SplitsMutSymHarness(); }

    function prove_view_eq_actual_symweight(uint32 w, uint128 amt) public {
        require(w >= 1 && w <= 1_000_000);
        (uint128 cv, uint128 sv, uint128 ca, uint128 sa) = h.viewVsActual(w, amt);
        assert(cv == ca && sv == sa);
    }
    function prove_splittable_after_symweight(uint32 w, uint128 amt) public {
        require(w >= 1 && w <= 1_000_000);
        (uint128 bef, uint128 c, uint128 s, uint128 aft) = h.splittableAfter(w, amt);
        assert(aft == bef - s - c);
    }
    function prove_collectable_after_symweight(uint32 w, uint128 amt) public {
        require(w >= 1 && w <= 1_000_000);
        (uint128 b, uint128 c, uint128 a) = h.collectableAfter(w, amt);
        assert(a == b + c);
    }
    function prove_receiver_got_symweight(uint32 w, uint128 amt) public {
        require(w >= 1 && w <= 1_000_000);
        (uint128 rb, uint128 s, uint128 ra) = h.receiverGot(w, amt);
        assert(ra == rb + s);
    }
    function prove_collect_zeroes_symweight(uint32 w, uint128 amt) public {
        require(w >= 1 && w <= 1_000_000);
        (uint128 cb, uint128 got, uint128 ca) = h.collectZeroes(w, amt);
        assert(got == cb && ca == 0);
    }
}
