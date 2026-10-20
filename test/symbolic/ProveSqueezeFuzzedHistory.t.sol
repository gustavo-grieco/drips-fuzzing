// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {EchidnaStart} from "./EchidnaStart.sol";
import {StreamsHistory, StreamReceiver} from "src/Streams.sol";
import {SqueezeHistoryHarness} from "./ProveSqueezeHistory.t.sol";

/*
    EchidnaSqueezeTests.testSqueezeWithFuzzedHistoryShouldNotRevert. The sender's history has three
    entries in the current cycle: streaming to RECV from START_TIMESTAMP, to OTHER 100 s later, and
    back to RECV 100 s after that. Like getFuzzedStreamsHistory, a squeeze passes the hash of the
    first `skip` + 1 entries (skip is 0 or 1, never the last entry) and the remaining entries, each
    with its receivers either listed or replaced by their hash. The fuzzing helper picks those
    with a keccak chain over a seed; here each choice is a free symbolic bool, which covers every
    seed. At any later time in the cycle, such a squeeze never reverts and squeezes no more than
    the full history does.
*/
contract FuzzedHistoryHarness is SqueezeHistoryHarness {
    function moveStreamBack() external {
        _set(0, 0);
    }

    // the hash of the history up to and including entry `last`
    function prefixHash(uint256 last) public view returns (bytes32 hash) {
        for (uint256 i = 0; i <= last; i++) {
            hash = _hashStreamsHistory(hash, _hashStreams(_cfg(cfgIds[i])), updateTimes[i], maxEnds[i]);
        }
    }

    // the entries after `skip` + 1, the receivers of entry i hashed when hashed[i] is set
    function fuzzedHistory(uint256 skip, bool[2] memory hashed)
        public
        view
        returns (bytes32 historyHash, StreamsHistory[] memory h)
    {
        StreamsHistory[] memory full = history();
        historyHash = prefixHash(skip);
        h = new StreamsHistory[](full.length - 1 - skip);
        for (uint256 i = 0; i < h.length; i++) {
            h[i] = full[skip + 1 + i];
            if (hashed[i]) {
                h[i].streamsHash = _hashStreams(h[i].receivers);
                h[i].receivers = new StreamReceiver[](0);
            }
        }
    }

    function squeezeFuzzed(uint256 skip, bool[2] memory hashed) external returns (uint128) {
        (bytes32 historyHash, StreamsHistory[] memory h) = fuzzedHistory(skip, hashed);
        return _squeezeStreams(RECV, ERC20, SENDER, historyHash, h);
    }
}

contract ProveSqueezeFuzzedHistory is EchidnaStart, Test {
    uint32 constant WINDOW = 400000; // inside the cycle that holds START_TIMESTAMP

    FuzzedHistoryHarness h;

    function setUp() public {
        h = new FuzzedHistoryHarness();
        h.start();
        vm.warp(START_TIMESTAMP + 100);
        h.moveStreamToOther();
        vm.warp(START_TIMESTAMP + 200);
        h.moveStreamBack();
    }

    function prove_squeeze_fuzzed_history_no_revert(uint32 dt, bool skipTwo, bool[2] memory hashed) public {
        require(dt >= 200);
        warpBy(dt, WINDOW);
        uint128 full = h.squeezable(h.history());
        try h.squeezeFuzzed(skipTwo ? 1 : 0, hashed) returns (uint128 amt) {
            assert(amt <= full);
        } catch {
            assert(false);
        }
    }
}
