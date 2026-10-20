// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {EchidnaStart} from "./EchidnaStart.sol";
import {Streams, StreamReceiver, StreamsHistory, StreamConfigImpl} from "src/Streams.sol";
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

    function _state(uint256 acc) internal view returns (StreamsState storage) {
        StreamsStorage storage s;
        bytes32 slot = SLOT;
        assembly {
            s.slot := slot
        }
        return s.states[ERC20][acc];
    }

    function _deltas() internal view returns (mapping(uint32 => AmtDelta) storage) {
        return _state(RECV).amtDeltas;
    }

    // ---- writing a symbolic state, for the inductive proofs ----

    function setDelta(uint32 cycle, int128 thisCycle, int128 nextCycle) external {
        _deltas()[cycle] = AmtDelta(thisCycle, nextCycle);
    }

    function setNextReceivableCycle(uint32 cycle) external {
        _state(RECV).nextReceivableCycle = cycle;
    }

    // the deltas of `d.length / 2` cycles from `first` on, and the next cycle to receive, in one
    // call: hevm counts every call into the same contract as a loop iteration
    function setReceiver(uint32 nextReceivable, uint32 first, int128[10] memory d) external {
        _state(RECV).nextReceivableCycle = nextReceivable;
        for (uint32 i = 0; i < 5; i++) {
            _deltas()[first + i] = AmtDelta(d[2 * i], d[2 * i + 1]);
        }
    }

    function deltaSum(uint32 first, uint32 last) external view returns (int256 sum) {
        // unchecked: the deltas are int128, so the sum of a few of them cannot overflow, and the
        // overflow checks would only burden the solver
        unchecked {
            for (uint32 c = first; c <= last; c++) {
                AmtDelta storage d = _deltas()[c];
                sum += int256(d.thisCycle) + d.nextCycle;
            }
        }
    }

    // the sender's history is the single entry `streams`, set at updateTime in the current cycle
    function setSenderHistory(StreamReceiver[] memory streams, uint32 updateTime, uint32 maxEnd) external {
        StreamsState storage sender = _state(SENDER);
        sender.streamsHistoryHash = _hashStreamsHistory(0, _hashStreams(streams), updateTime, maxEnd);
        sender.updateTime = updateTime;
        sender.maxEnd = maxEnd;
        sender.lastUpdatedCycleConfigs = 1;
    }

    function receiveSome(uint32 maxCycles) external returns (uint128) {
        return _receiveStreams(RECV, ERC20, maxCycles);
    }

    function squeeze(StreamsHistory[] memory history) external returns (uint128) {
        return _squeezeStreams(RECV, ERC20, SENDER, 0, history);
    }

    // the deltas of five cycles from `first` on and the next cycle to receive, in one call
    function receiverState(uint32 first) external view returns (uint32 nextReceivable, int128[10] memory d) {
        nextReceivable = _state(RECV).nextReceivableCycle;
        for (uint32 i = 0; i < 5; i++) {
            AmtDelta storage a = _deltas()[first + i];
            (d[2 * i], d[2 * i + 1]) = (a.thisCycle, a.nextCycle);
        }
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

/*
    invariantSumAmtDeltaIsZero as an inductive step, from any receiver state where it holds: the
    receiver's amtDeltas are symbolic in the five cycles around now (three finished cycles still to
    receive, the current one and the next), sum to zero, are zero everywhere else, and the running
    amount of every finished cycle is non-negative. One receive (any maxCycles) or one squeeze (any
    rate and maxEnd of the sender's only history entry, set in the current cycle) keeps the sum at
    zero and touches no other cycle. Time is fixed at START_TIMESTAMP; the deltas bound everything
    else, so the cycles involved are concrete.
*/
contract ProveAmtDeltasInductive is EchidnaStart, Test {
    uint32 constant CYCLE = 10;
    uint32 constant NOW_CYCLE = START_TIMESTAMP / CYCLE + 1; // _cycleOf(START_TIMESTAMP)
    uint32 constant FIRST = NOW_CYCLE - 3;
    uint32 constant LAST = NOW_CYCLE + 1;

    AmtDeltaHarness h;

    function setUp() public {
        h = new AmtDeltaHarness();
    }

    function _state(int128[10] memory d) internal {
        vm.warp(START_TIMESTAMP); // echidna's symbolic transaction may come later than setUp
        int256 sum;
        int256 running;
        // unchecked: the values are int96, so the sums cannot overflow
        unchecked {
            for (uint32 i = 0; i < 5; i++) {
                // bounded by truncation, not require: every require is a branch, and 20 of them
                // use up the exploration depth before the receive runs
                d[2 * i] = int96(d[2 * i]);
                d[2 * i + 1] = int96(d[2 * i + 1]);
                sum += int256(d[2 * i]) + d[2 * i + 1];
                if (i < 3) {
                    running += d[2 * i];
                    require(running >= 0);
                    running += d[2 * i + 1];
                }
            }
        }
        require(sum == 0);
        h.setReceiver(FIRST, FIRST, d);
    }

    function _assertSumZero(uint32 other) internal view {
        assert(h.deltaSum(FIRST, LAST) == 0);
        require(other < FIRST || other > LAST);
        (int128 t, int128 n) = h.delta(other);
        assert(t == 0 && n == 0);
    }

    function prove_amt_delta_inductive_receive(int128[10] memory d, uint32 maxCycles, uint32 other) public {
        _state(d);
        h.receiveSome(maxCycles);
        _assertSumZero(other);
    }

    function prove_amt_delta_inductive_squeeze(int128[10] memory d, uint160 rate, uint32 maxEnd, uint32 other) public {
        _state(d);
        require(rate >= 1e8 && rate <= 2 ** 100); // _minAmtPerSec for 10-second cycles
        StreamReceiver[] memory streams = new StreamReceiver[](1);
        streams[0] = StreamReceiver(42, StreamConfigImpl.create(0, rate, 0, 0));
        uint32 updateTime = START_TIMESTAMP / CYCLE * CYCLE; // the start of the current cycle
        h.setSenderHistory(streams, updateTime, maxEnd);
        StreamsHistory[] memory history = new StreamsHistory[](1);
        history[0] = StreamsHistory(bytes32(0), streams, updateTime, maxEnd);
        h.squeeze(history);
        _assertSumZero(other);
    }
}

/*
    The exact effect of a receive on the receiver's amtDeltas, from any state: the deltas of the
    five cycles around now are arbitrary int128 values. A receive of up to maxCycles of the three
    finished cycles zeroes the k = min(maxCycles, 3) received cycles, adds their running total to
    thisCycle of the first cycle not received, moves nextReceivableCycle by k and changes nothing
    else. The total is computed here in the same order and with the same wrapping as Drips, so
    the solver compares equal terms instead of regrouped sums. invariantSumAmtDeltaIsZero follows:
    the received deltas are removed and their total is added back in one cycle.
*/
contract ProveAmtDeltasReceive is EchidnaStart, Test {
    uint32 constant CYCLE = 10;
    uint32 constant NOW_CYCLE = START_TIMESTAMP / CYCLE + 1; // _cycleOf(START_TIMESTAMP)
    uint32 constant FIRST = NOW_CYCLE - 3;

    AmtDeltaHarness h;

    function setUp() public {
        h = new AmtDeltaHarness();
    }

    function prove_amt_delta_receive_effect(int128[10] memory d, uint32 maxCycles, uint32 other) public {
        vm.warp(START_TIMESTAMP); // echidna's symbolic transaction may come later than setUp
        h.setReceiver(FIRST, FIRST, d);
        h.receiveSome(maxCycles);

        // the expected deltas, written out without loops: hevm stops at loops over symbolic bounds
        int128[10] memory e = [d[0], d[1], d[2], d[3], d[4], d[5], d[6], d[7], d[8], d[9]];
        uint32 k = maxCycles < 3 ? maxCycles : 3;
        unchecked {
            int128 total = d[0];
            total += d[1];
            if (k >= 1) {
                (e[0], e[1]) = (0, 0);
                if (k == 1) e[2] = d[2] + total;
            }
            total += d[2];
            total += d[3];
            if (k >= 2) {
                (e[2], e[3]) = (0, 0);
                if (k == 2) e[4] = d[4] + total;
            }
            total += d[4];
            total += d[5];
            if (k == 3) {
                (e[4], e[5]) = (0, 0);
                e[6] = d[6] + total;
            }
        }
        (uint32 next, int128[10] memory got) = h.receiverState(FIRST);
        assert(next == FIRST + k);
        assert(got[0] == e[0] && got[1] == e[1] && got[2] == e[2] && got[3] == e[3] && got[4] == e[4]);
        assert(got[5] == e[5] && got[6] == e[6] && got[7] == e[7] && got[8] == e[8] && got[9] == e[9]);
        require(other < FIRST || other > FIRST + 4);
        (int128 t, int128 n) = h.delta(other);
        assert(t == 0 && n == 0);
    }
}
