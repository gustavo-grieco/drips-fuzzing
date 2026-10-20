// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Splits, SplitsReceiver} from "src/Splits.sol";
import {IERC20} from "openzeppelin-contracts/token/ERC20/IERC20.sol";

/*
    The EchidnaSplitsTests properties for the case the other split proofs leave out: an account
    that splits part of its funds to itself. Two receivers, the account itself and RECV, both with
    symbolic weights, in either order (the account id is 7 or 99, RECV is 42, and the list must be
    sorted). The state before the split is symbolic: the account's splittable and collectable
    amounts and RECV's splittable amount.

    prove_self_split_exact pins every amount the split moves: with b the splittable amount, the
    first receiver in the list gets b*w1/T, the second b*(w1+w2)/T - b*w1/T, and the account's
    collectable grows by b - b*(w1+w2)/T, which is the returned collectable amount. From it:

      testCollectableAfterSplit    collectable grows by the returned collectable amount (asserted)
      value conservation           the three amounts add up to b, and the account's splittable
                                   was emptied before its own share came back
      testSplittableAfterSplit     the account's splittable is its own share, which is b*w/T or
      testReceiversReceivedSplit   b*w/T + 1, inside SPLIT_ROUNDING_TOLERANCE = 1, because
                                   floor(x) + floor(y) <= floor(x + y) <= floor(x) + floor(y) + 1

    and prove_self_split_view_eq_actual is testSplitViewVsActual. Stated directly on the harness,
    the +-1 and conservation properties come back unknown from both bitwuzla and z3: the floors of
    symbolic products have to cancel across the packed balances. The floor inequality itself is
    prove_split_rounding, which is fuzzed but not in the Makefile: on 256-bit words neither solver
    settles it, with or without the divisions (15 minutes in hevm).
*/
contract SplitsSelfHarness is Splits {
    uint256 public immutable ACC;
    uint256 public constant RECV = 42;
    IERC20 constant ERC20 = IERC20(address(0xE12C20));

    constructor(uint256 acc) Splits(keccak256("drips.splits.self.fv")) {
        ACC = acc;
    }

    function cfg(uint32 wSelf, uint32 wRecv) public view returns (SplitsReceiver[] memory r) {
        r = new SplitsReceiver[](2);
        SplitsReceiver memory self = SplitsReceiver(ACC, wSelf);
        SplitsReceiver memory recv = SplitsReceiver(RECV, wRecv);
        (r[0], r[1]) = ACC < RECV ? (self, recv) : (recv, self);
    }

    // the symbolic state: col collectable and amt splittable for the account, recvBal for RECV
    function init(uint32 wSelf, uint32 wRecv, uint128 amt, uint128 col, uint128 recvBal) external {
        SplitsReceiver[] memory none = new SplitsReceiver[](0);
        _addSplittable(ACC, ERC20, col);
        _split(ACC, ERC20, none);
        _setSplits(ACC, cfg(wSelf, wRecv));
        _addSplittable(ACC, ERC20, amt);
        _addSplittable(RECV, ERC20, recvBal);
    }

    function split(uint32 wSelf, uint32 wRecv) external returns (uint128 c, uint128 s) {
        return _split(ACC, ERC20, cfg(wSelf, wRecv));
    }

    function splitResult(uint32 wSelf, uint32 wRecv, uint128 amt) external view returns (uint128, uint128) {
        return _splitResult(ACC, cfg(wSelf, wRecv), amt);
    }

    function splittable(uint256 acc) external view returns (uint128) {
        return _splittable(acc, ERC20);
    }

    function collectable(uint256 acc) external view returns (uint128) {
        return _collectable(acc, ERC20);
    }
}

contract ProveSplitsSelf is Test {
    uint256 constant TOTAL = 1_000_000;

    SplitsSelfHarness selfFirst;
    SplitsSelfHarness selfLast;
    SplitsSelfHarness h;
    uint256 acc;
    uint256 recv;

    function setUp() public {
        selfFirst = new SplitsSelfHarness(7);
        selfLast = new SplitsSelfHarness(99);
    }

    function _init(bool last, uint32 wSelf, uint32 wRecv, uint128 amt, uint128 col, uint128 recvBal) internal {
        require(wSelf >= 1 && wRecv >= 1 && uint256(wSelf) + wRecv <= TOTAL);
        // Drips never holds more than _MAX_SPLITS_BALANCE = 2^127 - 1 of a token
        require(uint256(amt) + col + recvBal <= uint128(type(int128).max));
        h = last ? selfLast : selfFirst;
        acc = h.ACC();
        recv = h.RECV();
        h.init(wSelf, wRecv, amt, col, recvBal);
    }

    // the exact amounts _split hands out: cumulative shares in list order, the account's own included
    function prove_self_split_exact(bool last, uint32 wSelf, uint32 wRecv, uint128 amt, uint128 col, uint128 recvBal)
        public
    {
        _init(last, wSelf, wRecv, amt, col, recvBal);
        uint256 before = h.splittable(acc);
        uint256 recvBefore = h.splittable(recv);
        uint256 colBefore = h.collectable(acc);
        (uint128 c, uint128 s) = h.split(wSelf, wRecv);
        uint256 together = before * (uint256(wSelf) + wRecv) / TOTAL;
        uint256 firstAmt = before * (last ? wRecv : wSelf) / TOTAL;
        uint256 secondAmt = together - firstAmt;
        (uint256 selfAmt, uint256 recvAmt) = last ? (secondAmt, firstAmt) : (firstAmt, secondAmt);
        assert(s == together && c == before - together);
        assert(h.collectable(acc) == colBefore + c);
        assert(h.splittable(acc) == selfAmt);
        assert(h.splittable(recv) == recvBefore + recvAmt);
    }

    // not verified (see above); with prove_self_split_exact, this gives the +-1 of
    // testSplittableAfterSplit and testReceiversReceivedSplit: the second receiver's amount, a(x+y)/T - ax/T, is ay/T or ay/T + 1.
    // Stated for p = ax and q = ay, as a(x+y) = ax + ay never overflows (a < 2^128, x + y <= T),
    // and with each quotient given by its definition, kT <= n < kT + T, which is what DIV returns:
    // 256-bit division itself makes bitwuzla give up and z3 run out of memory.
    function prove_split_rounding(uint256 p, uint256 q, uint256 kp, uint256 kq, uint256 k) public pure {
        require(p < 2 ** 160 && q < 2 ** 160 && kp < 2 ** 160 && kq < 2 ** 160 && k < 2 ** 160);
        require(kp * TOTAL <= p && p < kp * TOTAL + TOTAL);
        require(kq * TOTAL <= q && q < kq * TOTAL + TOTAL);
        require(k * TOTAL <= p + q && p + q < k * TOTAL + TOTAL);
        assert(k >= kp + kq && k <= kp + kq + 1);
    }

    // testSplitViewVsActual with a split to self
    function prove_self_split_view_eq_actual(bool last, uint32 wSelf, uint32 wRecv, uint128 amt, uint128 col, uint128 recvBal)
        public
    {
        _init(last, wSelf, wRecv, amt, col, recvBal);
        (uint128 cv, uint128 sv) = h.splitResult(wSelf, wRecv, h.splittable(acc));
        (uint128 ca, uint128 sa) = h.split(wSelf, wRecv);
        assert(cv == ca && sv == sa);
    }
}
