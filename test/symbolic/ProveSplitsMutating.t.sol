// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Splits, SplitsReceiver} from "src/Splits.sol";
import {IERC20} from "openzeppelin-contracts/token/ERC20/IERC20.sol";

// Mutating Splits accounting properties — real _split/_collect/_addSplittable, minimal state.
// These mirror EchidnaSplitsTests {testCollectableAfterSplit, testReceiversReceivedSplit} and
// EchidnaBasicTests testCollect (Splits-module portion), which the full deployment can't verify.
contract SplitsMutHarness is Splits {
    uint256 constant ACC = 7;
    uint256 constant RECV = 42;
    IERC20 constant ERC20 = IERC20(address(0xE12C20));
    constructor() Splits(keccak256("drips.splits.mut.fv")) {}
    function _cfg() internal pure returns (SplitsReceiver[] memory r) {
        r = new SplitsReceiver[](1);
        r[0] = SplitsReceiver({accountId: RECV, weight: 300_000});
    }
    function initCfg() external { _setSplits(ACC, _cfg()); }

    // testCollectableAfterSplit: split raises collectable by exactly collectableAmt
    function collectableAfterSplit(uint128 amt) external returns (uint128 b, uint128 c, uint128 a) {
        b = _collectable(ACC, ERC20);
        _addSplittable(ACC, ERC20, amt);
        (c,) = _split(ACC, ERC20, _cfg());
        a = _collectable(ACC, ERC20);
    }
    // testReceiversReceivedSplit (1 receiver): receiver's splittable rises by exactly splitAmt
    function receiverGotSplit(uint128 amt) external returns (uint128 rb, uint128 s, uint128 ra) {
        rb = _splittable(RECV, ERC20);
        _addSplittable(ACC, ERC20, amt);
        (, s) = _split(ACC, ERC20, _cfg());
        ra = _splittable(RECV, ERC20);
    }
    // testCollect (Splits module): _collect returns full collectable and zeroes it
    function collectZeroes(uint128 amt) external returns (uint128 cb, uint128 got, uint128 ca) {
        _addSplittable(ACC, ERC20, amt);
        _split(ACC, ERC20, _cfg());
        cb = _collectable(ACC, ERC20);
        got = _collect(ACC, ERC20);
        ca = _collectable(ACC, ERC20);
    }
    // splittable is additive across _addSplittable calls
    function splittableAdditivity(uint128 x, uint128 y) external returns (uint128 s) {
        _addSplittable(ACC, ERC20, x);
        _addSplittable(ACC, ERC20, y);
        s = _splittable(ACC, ERC20);
    }
    // split consumes all splittable
    function splitZeroesSplittable(uint128 amt) external returns (uint128 s) {
        _addSplittable(ACC, ERC20, amt);
        _split(ACC, ERC20, _cfg());
        s = _splittable(ACC, ERC20);
    }
}

contract ProveSplitsMutating is Test {
    SplitsMutHarness h;
    function setUp() public { h = new SplitsMutHarness(); h.initCfg(); }

    function prove_collectable_after_split(uint128 amt) public {
        (uint128 b, uint128 c, uint128 a) = h.collectableAfterSplit(amt);
        assert(a == b + c);
    }
    function prove_receiver_got_split(uint128 amt) public {
        (uint128 rb, uint128 s, uint128 ra) = h.receiverGotSplit(amt);
        assert(ra == rb + s);
    }
    function prove_collect_zeroes(uint128 amt) public {
        (uint128 cb, uint128 got, uint128 ca) = h.collectZeroes(amt);
        assert(got == cb && ca == 0);
    }
    function prove_splittable_additivity(uint128 x, uint128 y) public {
        assert(h.splittableAdditivity(x, y) == uint128(uint256(x) + uint256(y)));
    }
    function prove_split_zeroes_splittable(uint128 amt) public {
        assert(h.splitZeroesSplittable(amt) == 0);
    }
}
