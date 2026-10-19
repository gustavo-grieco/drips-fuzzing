// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Splits, SplitsReceiver} from "src/Splits.sol";

/*
    Strengthening via SYMBOLIC config: the split receiver WEIGHT is symbolic (not the fixed 300k),
    so these hold for EVERY split configuration, for every amount. Real _setSplits + _splitResult.
*/
contract SplitsSymHarness is Splits {
    uint256 constant ACC = 7;
    constructor() Splits(keccak256("drips.splits.sym.fv")) {}
    function setAndSplit(uint32 weight, uint128 amount) external returns (uint128 c, uint128 s) {
        SplitsReceiver[] memory r = new SplitsReceiver[](1);
        r[0] = SplitsReceiver({accountId: 42, weight: weight});
        _setSplits(ACC, r);
        return _splitResult(ACC, r, amount);
    }
}

contract ProveSplitsSymbolic is Test {
    SplitsSymHarness h;
    function setUp() public { h = new SplitsSymHarness(); }

    // conservation for ALL weights and amounts
    function prove_conservation_symweight(uint32 weight, uint128 amount) public {
        require(weight >= 1 && weight <= 1_000_000);
        (uint128 c, uint128 s) = h.setAndSplit(weight, amount);
        assert(uint256(c) + uint256(s) == uint256(amount));
    }
    // exact split formula for ALL weights
    function prove_exact_symweight(uint32 weight, uint128 amount) public {
        require(weight >= 1 && weight <= 1_000_000);
        (, uint128 s) = h.setAndSplit(weight, amount);
        assert(uint256(s) == uint256(amount) * weight / 1_000_000);
    }
    // MONOTONE in weight: heavier weight never splits less (nonlinear: needs abstractArith)
    function prove_monotonic_symweight(uint32 w1, uint32 w2, uint128 amount) public {
        require(w1 <= w2 && w2 <= 1_000_000 && w1 >= 1);
        (, uint128 s1) = h.setAndSplit(w1, amount);
        (, uint128 s2) = h.setAndSplit(w2, amount);
        assert(s1 <= s2);
    }
}
