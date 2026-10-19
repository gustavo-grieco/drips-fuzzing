// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Splits, SplitsReceiver} from "src/Splits.sol";

/*
    Splits value conservation / no-oversplit with a CONCRETE MULTI-receiver list (N=3).
    Extends the single-receiver ProveSplits: the concrete list keeps `_assertCurrSplits`'s
    keccak concrete and unrolls the weight-sum loop, so splitsWeight is the concrete constant
    450_000. The only symbolic input is `amount`, and `splitAmt = amount * 450000 / 1e6`.

      make prove_split_multi_conservation
*/
contract SplitsMultiHarness is Splits {
    uint256 constant ACC = 7;

    constructor() Splits(keccak256("drips.splits.multi.fv")) {}

    // three receivers, weights sum to 450_000 (< 1_000_000 total) => 45% split, 55% collectable
    function _cfg() internal pure returns (SplitsReceiver[] memory r) {
        r = new SplitsReceiver[](3);
        r[0] = SplitsReceiver({accountId: 10, weight: 200_000});
        r[1] = SplitsReceiver({accountId: 20, weight: 150_000});
        r[2] = SplitsReceiver({accountId: 30, weight: 100_000});
    }

    function initCfg() external {
        _setSplits(ACC, _cfg());
    }

    function splitResultAmt(uint128 amount) external view returns (uint128 collectableAmt, uint128 splitAmt) {
        return _splitResult(ACC, _cfg(), amount);
    }
}

contract ProveSplitsMulti is Test {
    SplitsMultiHarness h;

    function setUp() public {
        h = new SplitsMultiHarness();
        h.initCfg();
    }

    // collectable + split == amount, across the multi-weight accumulation
    function prove_split_multi_conservation(uint128 amount) public view {
        (uint128 c, uint128 s) = h.splitResultAmt(amount);
        assert(uint256(c) + uint256(s) == uint256(amount));
    }
}
