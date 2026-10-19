// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Splits, SplitsReceiver} from "src/Splits.sol";
import {IERC20} from "openzeppelin-contracts/token/ERC20/IERC20.sol";

/*
    Closes the multi-receiver gap: TWO receivers, BOTH weights symbolic (w1,w2), symbolic amount.
    If view==actual + conservation + receiver-sum hold here, arbitrary-N symbolic weight follows from
    the same Sigma(weights) structure. Real _setSplits/_splitResult/_split.
*/
contract SplitsMultiSymHarness is Splits {
    uint256 constant ACC = 7;
    IERC20 constant ERC20 = IERC20(address(0xE12C20));
    constructor() Splits(keccak256("drips.splits.multisym.fv")) {}

    function _cfg(uint32 w1, uint32 w2) internal pure returns (SplitsReceiver[] memory r) {
        r = new SplitsReceiver[](2);
        r[0] = SplitsReceiver({accountId: 42, weight: w1});
        r[1] = SplitsReceiver({accountId: 43, weight: w2});
    }
    function viewVsActual(uint32 w1, uint32 w2, uint128 amt)
        external returns (uint128 cv, uint128 sv, uint128 ca, uint128 sa)
    {
        SplitsReceiver[] memory r = _cfg(w1, w2);
        _setSplits(ACC, r);
        _addSplittable(ACC, ERC20, amt);
        (cv, sv) = _splitResult(ACC, r, _splittable(ACC, ERC20));
        (ca, sa) = _split(ACC, ERC20, r);
    }
    function splitResultOnly(uint32 w1, uint32 w2, uint128 amt) external returns (uint128 c, uint128 s) {
        SplitsReceiver[] memory r = _cfg(w1, w2);
        _setSplits(ACC, r);
        return _splitResult(ACC, r, amt);
    }
    function receiversSum(uint32 w1, uint32 w2, uint128 amt)
        external returns (uint128 r42, uint128 r43, uint128 s)
    {
        SplitsReceiver[] memory r = _cfg(w1, w2);
        _setSplits(ACC, r);
        _addSplittable(ACC, ERC20, amt);
        (, s) = _split(ACC, ERC20, r);
        r42 = _splittable(42, ERC20);
        r43 = _splittable(43, ERC20);
    }
}

contract ProveSplitsMultiSym is Test {
    SplitsMultiSymHarness h;
    function setUp() public { h = new SplitsMultiSymHarness(); }

    function _valid(uint32 w1, uint32 w2) internal pure returns (bool) {
        return w1 >= 1 && w2 >= 1 && uint256(w1) + uint256(w2) <= 1_000_000;
    }
    // testSplitViewVsActual, N=2, both weights symbolic
    function prove_view_eq_actual_2sym(uint32 w1, uint32 w2, uint128 amt) public {
        require(_valid(w1, w2));
        (uint128 cv, uint128 sv, uint128 ca, uint128 sa) = h.viewVsActual(w1, w2, amt);
        assert(cv == ca && sv == sa);
    }
    // conservation, N=2
    function prove_conservation_2sym(uint32 w1, uint32 w2, uint128 amt) public {
        require(_valid(w1, w2));
        (uint128 cv, uint128 sv,,) = h.viewVsActual(w1, w2, amt);
        assert(uint256(cv) + uint256(sv) == uint256(amt));
    }
    // testReceiversReceivedSplit, N=2: both receivers together get exactly splitAmt
    function prove_receivers_sum_2sym(uint32 w1, uint32 w2, uint128 amt) public {
        require(_valid(w1, w2));
        (uint128 r42, uint128 r43, uint128 s) = h.receiversSum(w1, w2, amt);
        assert(uint256(r42) + uint256(r43) == uint256(s));
    }

    // LEAN conservation (view-only _splitResult), N=2 symbolic weights
    function prove_conservation_2sym_lean(uint32 w1, uint32 w2, uint128 amt) public {
        require(_valid(w1, w2));
        (uint128 c, uint128 s) = h.splitResultOnly(w1, w2, amt);
        assert(uint256(c) + uint256(s) == uint256(amt));
    }
}
