// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Streams, StreamReceiver} from "src/Streams.sol";
import {IERC20} from "openzeppelin-contracts/token/ERC20/IERC20.sol";

/*
    Module-level portion of EchidnaStreamsTests.testSetStreamBalance, with NO stream receivers
    (so the cycle/time math collapses and only the balance-delta clamping remains):
      - deposit (delta>=0) is applied exactly: realBalanceDelta == delta
      - withdrawal (delta<0) on a zero balance is clamped to 0
      - the tracked balance moves by exactly realBalanceDelta
      - a withdrawal from a funded balance is capped at that balance
*/
contract StreamBalHarness is Streams {
    IERC20 constant ERC20 = IERC20(address(0xE12C20));
    uint256 constant ACC = 100;
    uint32 constant CYCLE = 604800;
    constructor() Streams(CYCLE, keccak256("drips.streambal.fv")) {}

    function _empty() internal pure returns (StreamReceiver[] memory e) { e = new StreamReceiver[](0); }
    function setBal(int128 delta) external returns (int128 rbd) {
        rbd = _setStreams(ACC, ERC20, _empty(), delta, _empty(), 0, 0);
    }
    function balNow() external view returns (uint128) {
        return _balanceAt(ACC, ERC20, _empty(), uint32(block.timestamp));
    }
}

contract ProveStreamBalance is Test {
    StreamBalHarness h;
    function setUp() public { h = new StreamBalHarness(); }

    function prove_deposit_exact(int128 delta) public {
        require(delta >= 0);
        assert(h.setBal(delta) == delta);
    }
    function prove_withdraw_clamped_empty(int128 delta) public {
        require(delta < 0);
        assert(h.setBal(delta) == 0);
    }
    function prove_balance_tracks_delta(int128 delta) public {
        require(delta >= 0);
        uint128 before = h.balNow();
        int128 rbd = h.setBal(delta);
        uint128 aft = h.balNow();
        assert(int128(aft) == int128(before) + rbd);
    }
    // deposit, then withdraw any amount: exactly min(deposit, withdrawal) leaves, the rest stays
    function prove_withdraw_clamped(int128 deposit, int128 withdrawal) public {
        require(deposit >= 0 && withdrawal > 0);
        h.setBal(deposit);
        int128 rbd = h.setBal(-withdrawal);
        int128 taken = withdrawal < deposit ? withdrawal : deposit;
        assert(rbd == -taken);
        assert(h.balNow() == uint128(deposit - taken));
    }
}
