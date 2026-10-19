// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {EchidnaStart} from "./EchidnaStart.sol";
import {Streams, StreamReceiver, StreamConfigImpl} from "src/Streams.sol";
import {Splits, SplitsReceiver} from "src/Splits.sol";
import {IERC20} from "openzeppelin-contracts/token/ERC20/IERC20.sol";

/*
    The receive-streams quartet (EchidnaBasicTests), module-level but with the SAME glue Drips uses:
    receiveStreams = Streams._receiveStreams + Splits._addSplittable. setUp starts a real stream at
    BASE; the property runs at a symbolic time BASE + dt, dt <= 604800 (one cycle length), so at most
    one cycle completes and the receive-cycles loop is small. Assertions are verbatim from the suite.
*/
contract MiniDrips is Streams, Splits {
    IERC20 constant ERC20 = IERC20(address(0xE12C20));
    uint256 constant SENDER = 100;
    uint256 public constant RECV = 42;
    uint32 constant CYCLE = 604800;
    uint32 public constant BASE = 1524785992;
    uint160 constant RATE = 1e9;

    constructor()
        Streams(CYCLE, keccak256("drips.minidrips.streams"))
        Splits(keccak256("drips.minidrips.splits")) {}

    function initStream() external {
        StreamReceiver[] memory e = new StreamReceiver[](0);
        StreamReceiver[] memory r = new StreamReceiver[](1);
        r[0] = StreamReceiver(RECV, StreamConfigImpl.create(0, RATE, BASE, 0));
        _setStreams(SENDER, ERC20, e, int128(10_000_000_000), r, 0, 0);
    }
    // == Drips.receiveStreams glue
    function receiveStreams(uint256 acc, uint32 maxCycles) public returns (uint128 amt) {
        amt = _receiveStreams(acc, ERC20, maxCycles);
        if (amt != 0) _addSplittable(acc, ERC20, amt);
    }
    function receiveStreamsResult(uint256 acc, uint32 maxCycles) public view returns (uint128 amt) {
        (amt,,,,) = _receiveStreamsResult(acc, ERC20, maxCycles);
    }
    function receivableStreamsCycles(uint256 acc) public view returns (uint32) {
        return _receivableStreamsCycles(acc, ERC20);
    }
    function splittable(uint256 acc) public view returns (uint128) {
        return _splittable(acc, ERC20);
    }
}

contract ProveReceive is EchidnaStart, Test {
    MiniDrips h;
    function setUp() public { h = new MiniDrips(); h.initStream(); }

    // = testReceiveStreams: splittable rises by exactly receivedAmt
    function prove_receive_accounting(uint32 maxCycles, uint32 dt) public {
        warpBy(dt, 604800);
        require(maxCycles <= 2);
        uint128 before = h.splittable(h.RECV());
        uint128 received = h.receiveStreams(h.RECV(), maxCycles);
        uint128 afterS = h.splittable(h.RECV());
        assert(afterS == before + received);
        if (received > 0) { assert(afterS > before); } else { assert(afterS == before); }
    }
    // = testReceiveStreamsShouldNotRevert
    function prove_receive_no_revert(uint32 dt) public {
        warpBy(dt, 604800);
        try h.receiveStreams(h.RECV(), 2) {} catch { assert(false); }  // bound loop: <=2 cycles
    }
    // = testReceiveStreamsViewConsistency
    function prove_receive_view_consistency(uint32 maxCycles, uint32 dt) public {
        warpBy(dt, 604800);
        require(maxCycles > 0);
        uint128 receivable = h.receiveStreamsResult(h.RECV(), maxCycles);
        uint32 cycles = h.receivableStreamsCycles(h.RECV());
        if (receivable > 0) assert(cycles > 0);
    }
    // = testReceiveStreamsViewVsActual
    function prove_receive_view_eq_actual(uint32 maxCycles, uint32 dt) public {
        warpBy(dt, 604800);
        require(maxCycles <= 2);
        uint128 receivable = h.receiveStreamsResult(h.RECV(), maxCycles);
        uint128 received = h.receiveStreams(h.RECV(), maxCycles);
        assert(receivable == received);
    }
}
