// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {EchidnaStart} from "./EchidnaStart.sol";
import {Streams, StreamReceiver, StreamsHistory, StreamConfigImpl} from "src/Streams.sol";
import {IERC20} from "openzeppelin-contracts/token/ERC20/IERC20.sol";

/*
    The squeeze-history properties of EchidnaSqueezeTests, module-level on the real Streams code:

      testSqueezeTwice                      squeezing the same history twice: the second gives 0
      testSqueezeWithFullyHashedHistory     a history with every entry hashed squeezes nothing
      testSqueezableAmountCantBeWithdrawn   the sender withdrawing everything keeps what is squeezable
      testSqueezableAmountCantBeUndone      the sender changing its receivers keeps what is squeezable
                                            (the fuzzing version passes the accounts in the wrong order
                                            and changes the receiver's streams instead)
      testSqueezableVsReceived              what is squeezable now becomes exactly the receivable amount
                                            once the cycle ends, after the sender stops streaming

    setUp starts a stream SENDER -> RECV at START_TIMESTAMP. Each property moves to START_TIMESTAMP + dt,
    dt <= 400000, which stays inside the cycle holding START_TIMESTAMP (it ends 519608 s later), so
    everything streamed so far is squeezable. The harness records every streams update as a history
    entry, the way the fuzzing helpers build getStreamsHistory. Scope: one sender, one stream at a
    fixed rate, at most two history entries.
*/
contract SqueezeHistoryHarness is Streams {
    IERC20 constant ERC20 = IERC20(address(0xE12C20));
    uint256 public constant SENDER = 100;
    uint256 public constant RECV = 42;
    uint256 constant OTHER = 43;
    uint160 constant RATE = 1e9; // 1 token per second
    int128 constant DEPOSIT = 10_000_000_000; // the stream stays active far beyond the cycle

    // the sender's history: receivers list id per entry (0 = to RECV, 1 = to OTHER, 2 = none)
    uint8[] cfgIds;
    uint32[] updateTimes;
    uint32[] maxEnds;

    constructor() Streams(604800, keccak256("drips.squeezehistory.fv")) {}

    function _cfg(uint8 id) internal pure returns (StreamReceiver[] memory r) {
        if (id == 2) return new StreamReceiver[](0);
        r = new StreamReceiver[](1);
        r[0] = StreamReceiver(id == 0 ? RECV : OTHER, StreamConfigImpl.create(0, RATE, 0, 0));
    }

    function _set(uint8 id, int128 delta) internal {
        uint8 curr = cfgIds.length == 0 ? 2 : cfgIds[cfgIds.length - 1];
        _setStreams(SENDER, ERC20, _cfg(curr), delta, _cfg(id), 0, 0);
        (,, uint32 updateTime,, uint32 maxEnd) = _streamsState(SENDER, ERC20);
        cfgIds.push(id);
        updateTimes.push(updateTime);
        maxEnds.push(maxEnd);
    }

    function start() external { _set(0, DEPOSIT); }
    function withdrawAll() external { _set(cfgIds[cfgIds.length - 1], type(int128).min); }
    function moveStreamToOther() external { _set(1, 0); }

    function history() public view returns (StreamsHistory[] memory h) {
        h = new StreamsHistory[](cfgIds.length);
        for (uint256 i = 0; i < h.length; i++) {
            h[i] = StreamsHistory(bytes32(0), _cfg(cfgIds[i]), updateTimes[i], maxEnds[i]);
        }
    }

    // the same history with every entry's receivers replaced by their hash
    function hashedHistory() public view returns (StreamsHistory[] memory h) {
        h = history();
        for (uint256 i = 0; i < h.length; i++) {
            h[i].streamsHash = _hashStreams(h[i].receivers);
            h[i].receivers = new StreamReceiver[](0);
        }
    }

    function squeezable(StreamsHistory[] memory h) public view returns (uint128 amt) {
        (amt,,,,) = _squeezeStreamsResult(RECV, ERC20, SENDER, bytes32(0), h);
    }

    function squeeze(StreamsHistory[] memory h) external returns (uint128) {
        return _squeezeStreams(RECV, ERC20, SENDER, bytes32(0), h);
    }

    function receivable() external view returns (uint128 amt) {
        (amt,,,,) = _receiveStreamsResult(RECV, ERC20, type(uint32).max);
    }
}

contract ProveSqueezeHistory is EchidnaStart, Test {
    uint32 constant WINDOW = 400000; // inside the cycle that holds START_TIMESTAMP
    uint32 constant CYCLE_END = 1525305600; // end of that cycle: 2522 * 604800

    SqueezeHistoryHarness h;

    function setUp() public {
        h = new SqueezeHistoryHarness();
        h.start();
    }

    // testSqueezeTwice
    function prove_squeeze_twice(uint32 dt) public {
        warpBy(dt, WINDOW);
        StreamsHistory[] memory history = h.history();
        h.squeeze(history);
        assert(h.squeeze(history) == 0);
    }

    // testSqueezeWithFullyHashedHistory
    function prove_squeeze_fully_hashed_history(uint32 dt) public {
        warpBy(dt, WINDOW);
        uint128 before = h.squeezable(h.history());
        assert(h.squeeze(h.hashedHistory()) == 0);
        assert(h.squeezable(h.history()) == before);
    }

    // testSqueezableAmountCantBeWithdrawn
    function prove_squeezable_cant_be_withdrawn(uint32 dt) public {
        warpBy(dt, WINDOW);
        uint128 before = h.squeezable(h.history());
        h.withdrawAll();
        assert(h.squeezable(h.history()) == before);
    }

    // testSqueezableAmountCantBeUndone, with the sender (not the receiver) changing its receivers
    function prove_squeezable_cant_be_undone(uint32 dt) public {
        warpBy(dt, WINDOW);
        uint128 before = h.squeezable(h.history());
        h.moveStreamToOther();
        assert(h.squeezable(h.history()) == before);
    }

    // testSqueezableVsReceived: after the sender stops, the squeezable amount is what the receiver
    // can receive once the cycle has ended (nothing was receivable before, the cycle had not ended)
    function prove_squeezable_vs_received(uint32 dt) public {
        warpBy(dt, WINDOW);
        uint128 squeezableNow = h.squeezable(h.history());
        uint128 receivableNow = h.receivable();
        h.withdrawAll();
        vm.warp(CYCLE_END + 1);
        uint128 receivableLater = h.receivable();
        assert(receivableLater >= receivableNow);
        assert(receivableLater - receivableNow == squeezableNow);
    }
}
