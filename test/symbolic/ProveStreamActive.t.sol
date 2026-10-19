// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Streams, StreamReceiver, StreamConfigImpl} from "src/Streams.sol";
import {IERC20} from "openzeppelin-contracts/token/ERC20/IERC20.sol";

/*
    STRONG version of the stream-balance proof: a single ACTIVE stream draining over time
    (not empty receivers). One receiver, 1 token/sec, funded for far beyond the window.
    Symbolic query time bounded to ONE cycle from updateTime so div(t,cycleSecs) is constant.

    Proves _balanceAt for an active stream EXACTLY:  balanceAt(t) == DEPOSIT - (t - BASE)
    and monotone non-increasing in t. This is the real streaming accounting, and is the sound
    part of drips' (buggy) testBalanceAtInFuture (its balance-monotonicity sanity checks hold;
    only its continuous-vs-cycle-quantized conservation equality fails).
*/
contract StreamActiveHarness is Streams {
    IERC20 constant ERC20 = IERC20(address(0xE12C20));
    uint256 constant ACC = 100;
    uint256 constant RECV = 42;
    uint32 constant CYCLE = 604800;
    uint32 public constant BASE = 1524785992;        // = updateTime (echidna initialTimestamp)
    uint160 constant RATE = 1e9;                      // 1 token/sec after the 1e9 multiplier
    uint128 public constant DEPOSIT = 500_000_000;    // >> one-cycle window, stream never exhausts in-window

    constructor() Streams(CYCLE, keccak256("drips.streams.active.fv")) {}

    function _cfg() internal pure returns (StreamReceiver[] memory r) {
        r = new StreamReceiver[](1);
        r[0] = StreamReceiver({accountId: RECV, config: StreamConfigImpl.create(0, RATE, BASE, 0)});
    }
    function initCfg() external {
        StreamReceiver[] memory empty = new StreamReceiver[](0);
        _setStreams(ACC, ERC20, empty, int128(uint128(DEPOSIT)), _cfg(), 0, 0);
    }
    function balAt(uint32 t) external view returns (uint128) {
        return _balanceAt(ACC, ERC20, _cfg(), t);
    }
}

contract ProveStreamActive is Test {
    StreamActiveHarness h;
    uint32 constant BASE = 1524785992;
    function setUp() public { h = new StreamActiveHarness(); h.initCfg(); }

    // SIMPLEST active-stream property: balance never exceeds the deposit (a stream only drains)
    function prove_active_balance_le_deposit(uint32 t) public view {
        require(t >= BASE);
        require(t <= BASE + 300000);
        assert(h.balAt(t) <= uint128(h.DEPOSIT()));
    }

    // EXACT projection: within one cycle, balance is deposit minus elapsed*rate (rate = 1 token/sec)
    function prove_active_balance_exact(uint32 t) public view {
        require(t >= BASE);
        require(t <= BASE + 300000);            // stay inside one cycle (room to boundary = 519608)
        assert(h.balAt(t) == uint128(h.DEPOSIT()) - (t - BASE));
    }
    // MULTI-CYCLE: same exact projection, but t spans ~2.5 cycles so div(t,cycleSecs) VARIES.
    // (balanceAt is continuous, so deposit - elapsed*rate holds across cycle boundaries while active.)
    function prove_active_exact_multicycle(uint32 t) public view {
        require(t >= BASE);
        require(t <= BASE + 1500000);           // ~2.5 * 604800
        assert(h.balAt(t) == uint128(h.DEPOSIT()) - (t - BASE));
    }

    // MONOTONE non-increasing: a stream only drains
    function prove_active_balance_monotonic(uint32 t1, uint32 t2) public view {
        require(t1 >= BASE && t2 >= t1);
        require(t2 <= BASE + 300000);
        assert(h.balAt(t1) >= h.balAt(t2));
    }
}
