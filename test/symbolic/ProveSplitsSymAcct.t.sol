// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Splits, SplitsReceiver} from "src/Splits.sol";
import {IERC20} from "openzeppelin-contracts/token/ERC20/IERC20.sol";

// Symbolize the splitsStates[] KEY (accountId): prove view==actual for EVERY account, which puts
// the #1083 symbolic-key SLOAD of splitsStates[symbolic acc] on the proof's critical path.
contract SplitsSymAcctHarness is Splits {
    uint256 constant RECV = 42;
    IERC20 constant ERC20 = IERC20(address(0xE12C20));
    constructor() Splits(keccak256("drips.splits.symacct.fv")) {}

    function _cfg(uint32 w) internal pure returns (SplitsReceiver[] memory r) {
        r = new SplitsReceiver[](1);
        r[0] = SplitsReceiver(RECV, w);
    }
    function viewVsActual(uint256 acc, uint32 w, uint128 amt)
        external returns (uint128 cv, uint128 sv, uint128 ca, uint128 sa)
    {
        SplitsReceiver[] memory r = _cfg(w);
        _setSplits(acc, r);                     // WRITE splitsStates[symbolic acc]
        _addSplittable(acc, ERC20, amt);        // WRITE splitsStates[symbolic acc].balances...
        (cv, sv) = _splitResult(acc, r, _splittable(acc, ERC20));  // READ symbolic-key slot
        (ca, sa) = _split(acc, ERC20, r);       // READ+WRITE symbolic-key slot
    }
}

contract ProveSplitsSymAcct is Test {
    SplitsSymAcctHarness h;
    function setUp() public { h = new SplitsSymAcctHarness(); }

    // testSplitViewVsActual for ALL accounts (symbolic accountId) and all weights.
    function prove_view_eq_actual_symacct(uint256 acc, uint32 w, uint128 amt) public {
        require(w >= 1 && w <= 1_000_000);
        require(acc != 42);                     // receiver, avoid self-split rounding case
        (uint128 cv, uint128 sv, uint128 ca, uint128 sa) = h.viewVsActual(acc, w, amt);
        assert(cv == ca && sv == sa);
    }
}
