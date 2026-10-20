// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {EchidnaStart} from "./EchidnaStart.sol";
import {Streams, StreamReceiver, StreamConfigImpl} from "src/Streams.sol";
import {IERC20} from "openzeppelin-contracts/token/ERC20/IERC20.sol";

/*
    EchidnaStreamsTests.testSetStreamBalance and the stream-balance no-revert tests, with a stream
    running (ProveStreamBalance covers an account with no receivers). setUp starts a stream to RECV
    funded for far longer than a cycle, time passes, and the sender changes its balance by a
    symbolic delta, keeping its receivers:

      a deposit is applied exactly, a withdrawal takes min(balance, amount), the balance moves by
      exactly the returned delta, withdrawing everything empties it, and none of these revert.

    The rate is 1 token per second, so the stream spends exactly end - start and the exact maxEnd is
    now + balance. The harness passes that as hint1 and the next second as hint2, which is what keeps
    _calcMaxEnd's binary search from looping over a symbolic balance. Wrong hints would only cost
    time, never change the result. Deposits stay below 1e9 so maxEnd fits in a uint32 (the token
    side, tokens in and out of the sender, is ProveAccounting's prove_accounting_stream_balance).
    Withdrawing everything holds at any time in the first cycle. The other properties hold for
    any delta at two times, 1000 seconds in and 700000 seconds in (in the next cycle): with the time
    symbolic as well, a positive new balance makes _setStreams book the stream at a symbolic time
    and exploration did not finish in 20 minutes, with or without abstract arithmetic; neither did
    a symbolic first deposit.
*/
contract StreamLiveHarness is Streams {
    IERC20 constant ERC20 = IERC20(address(0xE12C20));
    uint256 constant SENDER = 100;
    uint256 constant RECV = 42;
    uint160 constant RATE = 1e9; // 1 token per second

    constructor() Streams(604800, keccak256("drips.streamlive.fv")) {}

    function _cfg() internal pure returns (StreamReceiver[] memory r) {
        r = new StreamReceiver[](1);
        r[0] = StreamReceiver(RECV, StreamConfigImpl.create(0, RATE, 0, 0));
    }

    function _setHinted(StreamReceiver[] memory curr, int128 delta) internal returns (int128) {
        uint256 bal = curr.length == 0 ? 0 : _balanceAt(SENDER, ERC20, curr, uint32(block.timestamp));
        uint256 newBal;
        if (delta >= 0) newBal = bal + uint128(delta);
        else if (uint256(-int256(delta)) < bal) newBal = bal - uint256(-int256(delta));
        uint256 end = block.timestamp + newBal;
        uint32 hint = end < type(uint32).max ? uint32(end) : type(uint32).max - 1;
        return _setStreams(SENDER, ERC20, curr, delta, _cfg(), hint, hint + 1);
    }

    function start(uint128 deposit) external {
        _setHinted(new StreamReceiver[](0), int128(deposit));
    }

    function setBal(int128 delta) external returns (int128) {
        return _setHinted(_cfg(), delta);
    }

    function balNow() external view returns (uint128) {
        return _balanceAt(SENDER, ERC20, _cfg(), uint32(block.timestamp));
    }
}

contract ProveStreamBalanceLive is EchidnaStart, Test {
    uint32 constant WINDOW = 604800;
    uint128 constant MAX_DEPOSIT = 1e9; // keeps maxEnd inside uint32 from any time in the window

    StreamLiveHarness h;

    function setUp() public {
        h = new StreamLiveHarness();
        h.start(MAX_DEPOSIT);
    }

    // dt after the stream started at START_TIMESTAMP, still streaming
    function _live(uint32 dt) internal returns (uint128) {
        warpBy(dt, WINDOW);
        return h.balNow();
    }

    // 1000 seconds in, or 700000 seconds in, past the end of the first cycle
    function _live(bool late) internal returns (uint128) {
        vm.warp(START_TIMESTAMP + (late ? 700000 : 1000));
        return h.balNow();
    }

    // testSetStreamBalance, balanceDelta >= 0
    function prove_live_deposit_exact(bool late, int128 delta) public {
        uint128 before = _live(late);
        require(delta >= 0 && uint128(delta) <= MAX_DEPOSIT);
        int128 rbd = h.setBal(delta);
        assert(rbd == delta);
        assert(uint256(h.balNow()) == uint256(before) + uint128(delta));
    }

    // testSetStreamBalance, balanceDelta < 0: min(balance, amount) leaves, the rest stays
    function prove_live_withdraw_clamped(bool late, int128 delta) public {
        uint128 before = _live(late);
        require(delta < 0 && delta > type(int128).min);
        int128 rbd = h.setBal(delta);
        uint128 asked = uint128(-delta);
        uint128 taken = asked < before ? asked : before;
        assert(rbd <= 0 && rbd >= delta);
        assert(rbd == -int128(taken));
        assert(uint256(h.balNow()) + taken == before);
    }

    // setStreamBalanceWithdrawAll: empties the balance, and never reverts
    function prove_live_withdraw_all(uint32 dt) public {
        uint128 before = _live(dt);
        try h.setBal(type(int128).min) returns (int128 rbd) {
            assert(rbd == -int128(before));
            assert(h.balNow() == 0);
        } catch {
            assert(false);
        }
    }

    // testSetStreamBalanceShouldNotRevert with the suite's clamp on withdrawals (STARTING_BALANCE)
    function prove_live_setbalance_no_revert(bool late, int128 delta) public {
        _live(late);
        require(delta <= int128(MAX_DEPOSIT) && delta > -1_000_000_000e18);
        try h.setBal(delta) {} catch { assert(false); }
    }
}
