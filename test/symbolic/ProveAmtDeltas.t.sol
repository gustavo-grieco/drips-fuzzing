// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {EchidnaStart} from "./EchidnaStart.sol";
import {Streams, StreamReceiver, StreamConfigImpl} from "src/Streams.sol";
import {IERC20} from "openzeppelin-contracts/token/ERC20/IERC20.sol";

/*
    EchidnaInvariantTests.invariantSumAmtDeltaIsZero: summed over every cycle, a receiver's
    amtDeltas (thisCycle + nextCycle) are zero. Each _addDeltaRange books +rate at the start and
    -rate at the end, so what can break the sum is a sender's later update (which takes back the rest
    of the range) and _receiveStreams (which deletes the received cycles and folds the running
    amount into the next one). The harness uses the fuzzing suite's settings: 10-second cycles,
    streams of 1 to 100 seconds starting within 100 seconds of the update (or at the update), at
    1 token per second or at a fractional rate that makes _addDelta round. The deposit covers the
    whole stream.

    Instead of looping over cycles, each proof names the cycles the operation can touch (the
    stream's start and end, the stop time, the receiving cycle), asserts that their deltas sum to
    zero, and that any other cycle holds no delta, which together give the sum over all cycles.
    Scope: one sender, one receiver; the stream start and duration are symbolic, the first update
    is at START_TIMESTAMP, and the stop and the receive happen at a few concrete times after it.
    Only the _set proof verifies so far: _stop and _receive get no verdict within 20 minutes, even
    with the stop at a single concrete time.
*/
contract AmtDeltaHarness is Streams {
    bytes32 constant SLOT = keccak256("drips.amtdelta.fv");
    IERC20 constant ERC20 = IERC20(address(0xE12C20));
    uint256 constant SENDER = 100;
    uint256 constant RECV = 42;

    constructor() Streams(10, SLOT) {}

    function _cfg(uint160 rate, uint32 start, uint32 duration) internal pure returns (StreamReceiver[] memory r) {
        r = new StreamReceiver[](1);
        r[0] = StreamReceiver(RECV, StreamConfigImpl.create(0, rate, start, duration));
    }

    function start(uint160 rate, uint32 start_, uint32 duration, uint128 deposit) external {
        _setStreams(SENDER, ERC20, new StreamReceiver[](0), int128(deposit), _cfg(rate, start_, duration), 0, 0);
    }

    // the sender removes its stream, keeping its balance
    function stop(uint160 rate, uint32 start_, uint32 duration) external {
        _setStreams(SENDER, ERC20, _cfg(rate, start_, duration), 0, new StreamReceiver[](0), 0, 0);
    }

    function receive_() external returns (uint128) {
        return _receiveStreams(RECV, ERC20, type(uint32).max);
    }

    function _deltas() internal view returns (mapping(uint32 => AmtDelta) storage) {
        StreamsStorage storage s;
        bytes32 slot = SLOT;
        assembly {
            s.slot := slot
        }
        return s.states[ERC20][RECV].amtDeltas;
    }

    function delta(uint32 cycle) external view returns (int128, int128) {
        AmtDelta storage d = _deltas()[cycle];
        return (d.thisCycle, d.nextCycle);
    }
}

contract ProveAmtDeltas is EchidnaStart, Test {
    uint32 constant CYCLE = 10;
    uint32 constant BUFFER = 100; // CYCLE_FUZZING_BUFFER_SECONDS and MAX_STREAM_DURATION

    AmtDeltaHarness h;

    function setUp() public {
        h = new AmtDeltaHarness();
    }

    function _rate(bool fractional) internal pure returns (uint160) {
        return fractional ? 1_234_567_891 : 1e9;
    }

    function _cycleOf(uint256 t) internal pure returns (uint32) {
        return uint32(t / CYCLE + 1);
    }

    // a stream as clampStartTime and clampDuration produce it, funded for its whole duration;
    // returns the start and end of what it streams (start == 0 means at the update)
    function _start(bool fractional, uint32 s, uint32 d, uint128 extra) internal returns (uint32, uint32) {
        require(s == 0 || (s >= START_TIMESTAMP - BUFFER && s <= START_TIMESTAMP + BUFFER));
        require(d >= 1 && d <= BUFFER);
        require(extra <= 1e30); // anything above what the stream needs only stays in the balance
        vm.warp(START_TIMESTAMP); // echidna's symbolic transaction may come later than setUp
        h.start(_rate(fractional), s, d, uint128(uint256(d) * _rate(fractional) / 1e9 + 1) + extra);
        uint32 start = s == 0 ? START_TIMESTAMP : s;
        return (start, start + d);
    }

    // the deltas of the distinct cycles in a, b, c add up to zero, and cycle `other` holds none
    function _assertOnly(uint32 a, uint32 b, uint32 c, uint32 other) internal view {
        int256 sum = _deltaOf(a);
        if (b != a) sum += _deltaOf(b);
        if (c != a && c != b) sum += _deltaOf(c);
        assert(sum == 0);
        require(other != a && other != b && other != c);
        (int128 thisCycle, int128 nextCycle) = h.delta(other);
        assert(thisCycle == 0 && nextCycle == 0);
    }

    function _deltaOf(uint32 cycle) internal view returns (int256) {
        (int128 thisCycle, int128 nextCycle) = h.delta(cycle);
        return int256(thisCycle) + nextCycle;
    }

    // what starting the stream books: the range from its (capped) start to its end
    function prove_amt_delta_sum_zero_set(bool fractional, uint32 s, uint32 d, uint128 extra, uint32 other) public {
        (uint32 start, uint32 end) = _start(fractional, s, d, extra);
        if (start < START_TIMESTAMP) start = START_TIMESTAMP;
        _assertOnly(_cycleOf(start), _cycleOf(end), _cycleOf(end), other);
    }

    // the sender removes the stream 0, 5, 37, 104 or 199 seconds later: with the stream's start and
    // duration symbolic, that is before it starts, while it runs or after it ended, in the same or a
    // later cycle (a symbolic stop time did not finish exploring in 20 minutes)
    function prove_amt_delta_sum_zero_stop(bool fractional, uint32 s, uint32 d, uint8 when, uint32 other)
        public
    {
        (uint32 start, uint32 end) = _start(fractional, s, d, 0);
        if (start < START_TIMESTAMP) start = START_TIMESTAMP;
        _warpTo(when, [uint32(0), 5, 37, 104, 199]);
        h.stop(_rate(fractional), s, d);
        _assertOnly(_cycleOf(start), _cycleOf(end), _cycleOf(block.timestamp), other);
    }

    // the receiver receives everything up to the current cycle 0, 9, 46 or 100 seconds later
    function prove_amt_delta_sum_zero_receive(bool fractional, uint32 s, uint32 d, uint8 when, uint32 other)
        public
    {
        (uint32 start, uint32 end) = _start(fractional, s, d, 0);
        if (start < START_TIMESTAMP) start = START_TIMESTAMP;
        _warpTo(when, [uint32(0), 9, 46, 100, 100]);
        h.receive_();
        _assertOnly(_cycleOf(start), _cycleOf(end), _cycleOf(block.timestamp), other);
    }

    // one of the concrete offsets, each on its own path so the timestamp stays concrete
    function _warpTo(uint8 when, uint32[5] memory offsets) internal {
        if (when == 0) vm.warp(START_TIMESTAMP + offsets[0]);
        else if (when == 1) vm.warp(START_TIMESTAMP + offsets[1]);
        else if (when == 2) vm.warp(START_TIMESTAMP + offsets[2]);
        else if (when == 3) vm.warp(START_TIMESTAMP + offsets[3]);
        else vm.warp(START_TIMESTAMP + offsets[4]);
    }
}
