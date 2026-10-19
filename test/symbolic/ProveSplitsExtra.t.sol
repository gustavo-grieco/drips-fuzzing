// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Splits, SplitsReceiver} from "src/Splits.sol";

// Additional Splits view/arithmetic properties (real _splitResult, concrete config, symbolic amount).
contract SplitsExtraHarness is Splits {
    uint256 constant ACC = 7;
    constructor() Splits(keccak256("drips.splits.extra.fv")) {}

    function _cfg300k() internal pure returns (SplitsReceiver[] memory r) {
        r = new SplitsReceiver[](1);
        r[0] = SplitsReceiver({accountId: 42, weight: 300_000});
    }
    function initCfg300k() external { _setSplits(ACC, _cfg300k()); }
    function splitAmt300k(uint128 a) external view returns (uint128 s) { (, s) = _splitResult(ACC, _cfg300k(), a); }
    function splitRes300k(uint128 a) external view returns (uint128 c, uint128 s) { return _splitResult(ACC, _cfg300k(), a); }
}

// full weight = TOTAL_SPLITS_WEIGHT (1_000_000) => everything split
contract SplitsFullHarness is Splits {
    uint256 constant ACC = 7;
    constructor() Splits(keccak256("drips.splits.full.fv")) {}
    function _cfgFull() internal pure returns (SplitsReceiver[] memory r) {
        r = new SplitsReceiver[](1);
        r[0] = SplitsReceiver({accountId: 42, weight: 1_000_000});
    }
    function initCfg() external { _setSplits(ACC, _cfgFull()); }
    function splitRes(uint128 a) external view returns (uint128 c, uint128 s) { return _splitResult(ACC, _cfgFull(), a); }
}

contract ProveSplitsExtra is Test {
    SplitsExtraHarness h;
    SplitsFullHarness hf;
    function setUp() public { h = new SplitsExtraHarness(); h.initCfg300k(); hf = new SplitsFullHarness(); hf.initCfg(); }

    // EXACT formula: splitAmt == amount * 300000 / 1_000_000
    function prove_split_exact_formula(uint128 amount) public view {
        uint128 s = h.splitAmt300k(amount);
        assert(uint256(s) == uint256(amount) * 300_000 / 1_000_000);
    }
    // ZERO amount => (0,0)
    function prove_split_zero(uint128 dummy) public view {
        dummy;
        (uint128 c, uint128 s) = h.splitRes300k(0);
        assert(c == 0 && s == 0);
    }
    // FULL weight => everything split, nothing collectable
    function prove_split_full_weight(uint128 amount) public view {
        (uint128 c, uint128 s) = hf.splitRes(amount);
        assert(s == amount && c == 0);
    }

    // NEGATIVE CONTROL: deliberately false for amount>0 at 30% weight. MUST falsify.
    // If this "verifies", the assertion is unreachable => all nearby proofs are vacuous.
    function prove_neg_control(uint128 amount) public view {
        uint128 s = h.splitAmt300k(amount);
        assert(s == amount);
    }
}
