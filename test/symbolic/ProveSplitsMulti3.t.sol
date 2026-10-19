// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Splits, SplitsReceiver} from "src/Splits.sol";
import {IERC20} from "openzeppelin-contracts/token/ERC20/IERC20.sol";

// N=3 receivers, ALL THREE weights symbolic. Re-checks the N=2-verified properties at the "magic" 3.
contract SplitsMulti3Harness is Splits {
    uint256 constant ACC = 7;
    IERC20 constant ERC20 = IERC20(address(0xE12C20));
    constructor() Splits(keccak256("drips.splits.multi3.fv")) {}

    function _cfg(uint32 w1, uint32 w2, uint32 w3) internal pure returns (SplitsReceiver[] memory r) {
        r = new SplitsReceiver[](3);
        r[0] = SplitsReceiver(42, w1);
        r[1] = SplitsReceiver(43, w2);
        r[2] = SplitsReceiver(44, w3);
    }
    function viewVsActual(uint32 w1, uint32 w2, uint32 w3, uint128 amt)
        external returns (uint128 cv, uint128 sv, uint128 ca, uint128 sa)
    {
        SplitsReceiver[] memory r = _cfg(w1, w2, w3);
        _setSplits(ACC, r);
        _addSplittable(ACC, ERC20, amt);
        (cv, sv) = _splitResult(ACC, r, _splittable(ACC, ERC20));
        (ca, sa) = _split(ACC, ERC20, r);
    }
    function splitResultOnly(uint32 w1, uint32 w2, uint32 w3, uint128 amt) external returns (uint128 c, uint128 s) {
        _setSplits(ACC, _cfg(w1, w2, w3));
        return _splitResult(ACC, _cfg(w1, w2, w3), amt);
    }
    function receiversSum(uint32 w1, uint32 w2, uint32 w3, uint128 amt)
        external returns (uint128 sum, uint128 s)
    {
        SplitsReceiver[] memory r = _cfg(w1, w2, w3);
        _setSplits(ACC, r);
        _addSplittable(ACC, ERC20, amt);
        (, s) = _split(ACC, ERC20, r);
        sum = _splittable(42, ERC20) + _splittable(43, ERC20) + _splittable(44, ERC20);
    }
}

contract ProveSplitsMulti3 is Test {
    SplitsMulti3Harness h;
    function setUp() public { h = new SplitsMulti3Harness(); }
    function _valid(uint32 w1, uint32 w2, uint32 w3) internal pure returns (bool) {
        return w1 >= 1 && w2 >= 1 && w3 >= 1 &&
               uint256(w1) + uint256(w2) + uint256(w3) <= 1_000_000;
    }
    function prove_view_eq_actual_3sym(uint32 w1, uint32 w2, uint32 w3, uint128 amt) public {
        require(_valid(w1, w2, w3));
        (uint128 cv, uint128 sv, uint128 ca, uint128 sa) = h.viewVsActual(w1, w2, w3, amt);
        assert(cv == ca && sv == sa);
    }
    function prove_conservation_3sym(uint32 w1, uint32 w2, uint32 w3, uint128 amt) public {
        require(_valid(w1, w2, w3));
        (uint128 c, uint128 s) = h.splitResultOnly(w1, w2, w3, amt);
        assert(uint256(c) + uint256(s) == uint256(amt));
    }
    function prove_receivers_sum_3sym(uint32 w1, uint32 w2, uint32 w3, uint128 amt) public {
        require(_valid(w1, w2, w3));
        (uint128 sum, uint128 s) = h.receiversSum(w1, w2, w3, amt);
        assert(sum == s);
    }
}
