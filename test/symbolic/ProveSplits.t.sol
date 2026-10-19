// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Splits, SplitsReceiver} from "src/Splits.sol";
import {IERC20} from "openzeppelin-contracts/token/ERC20/IERC20.sol";

/*
    Exploratory FV probe on Drips' split arithmetic, post1 style.

    `Splits` is abstract but self-contained (constructor just takes a storage slot), so we
    instantiate it DIRECTLY -- no Drips proxy, no drivers, no ERC20. That keeps the symbolic
    surface tiny.

    The two structural blockers we identified both dissolve with a CONCRETE receivers config:
      - `_assertCurrSplits` keccak-hashes the receivers -> concrete array => concrete hash,
        matched against the hash `setUp` stored. No symbolic keccak.
      - the weight-sum loop unrolls at a concrete length (1 receiver).
    So the ONLY symbolic input is `amount`, and splitAmt reduces to `amount * 300000 / 1e6`
    (const mul, const div) -- exactly the shape post1's abstract-arith lemmas target.

      make prove_split_value_conservation
*/
contract SplitsHarness is Splits {
    uint256 constant ACC = 7;

    constructor() Splits(keccak256("drips.splits.fv.test")) {}

    // one concrete receiver, weight 300_000 => 30% split, 70% collectable
    function _cfg() internal pure returns (SplitsReceiver[] memory r) {
        r = new SplitsReceiver[](1);
        r[0] = SplitsReceiver({accountId: 42, weight: 300_000});
    }

    function initCfg() external {
        _setSplits(ACC, _cfg());
    }

    function splitResultAmt(uint128 amount) external view returns (uint128 collectableAmt, uint128 splitAmt) {
        return _splitResult(ACC, _cfg(), amount);
    }

    IERC20 constant ERC20 = IERC20(address(0xE12C20));

    // scenario setup: seed the splittable balance SYMBOLICALLY by calling the real
    // _addSplittable first, then run the real mutating _split over it.
    function seedSplittable(uint128 amt) external {
        _addSplittable(ACC, ERC20, amt);
    }

    function doSplit() external returns (uint128 collectableAmt, uint128 splitAmt) {
        return _split(ACC, ERC20, _cfg());
    }
}

contract ProveSplits is Test {
    SplitsHarness h;

    function setUp() public {
        h = new SplitsHarness();
        h.initCfg(); // store the concrete splits hash
    }

    // NO VALUE CREATION: collectable + split == amount (the split conserves value exactly)
    function prove_split_value_conservation(uint128 amount) public view {
        (uint128 c, uint128 s) = h.splitResultAmt(amount);
        assert(uint256(c) + uint256(s) == uint256(amount));
    }

    // MONOTONIC: more collected never splits fewer funds
    function prove_split_monotonic(uint128 a1, uint128 a2) public view {
        require(a1 <= a2);
        (, uint128 s1) = h.splitResultAmt(a1);
        (, uint128 s2) = h.splitResultAmt(a2);
        assert(s1 <= s2);
    }

    // MUTATING _split (real state change + the per-receiver division loop): conserves value
    function prove_split_mutating_conservation(uint128 amount) public {
        h.seedSplittable(amount);
        (uint128 c, uint128 s) = h.doSplit();
        assert(uint256(c) + uint256(s) == uint256(amount));
    }

    // VIEW == ACTUAL: _splitResult exactly predicts the mutating _split
    function prove_split_view_eq_actual(uint128 amount) public {
        h.seedSplittable(amount);
        (uint128 cv, uint128 sv) = h.splitResultAmt(amount);
        (uint128 ca, uint128 sa) = h.doSplit();
        assert(ca == cv && sa == sv);
    }
}
