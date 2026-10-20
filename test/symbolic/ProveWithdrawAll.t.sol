// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {EchidnaStart} from "./EchidnaStart.sol";
import {StreamsHistory} from "src/Streams.sol";
import {SqueezeHistoryHarness} from "./ProveSqueezeHistory.t.sol";

/*
    The streams side of EchidnaInvariantTests.invariantWithdrawAllTokens and its no-revert variant:
    the receiver squeezes the sender's full history, receives every cycle, and the sender withdraws
    everything (the order of the fuzzing invariant). From a stream SENDER -> RECV running since
    START_TIMESTAMP, at any time dt in the window:

      none of the three steps reverts, the amounts they move out of the stream add up to exactly
      the deposit, and afterwards nothing is left: the sender's balance is 0, nothing is
      squeezable, nothing is receivable now or after the current cycle ends.

    prove_drain_streams_first_cycle takes dt inside the first cycle, where everything streamed is
    squeezed; prove_drain_streams_later takes dt in the next cycle, where the first cycle is received
    and the current one squeezed. The splits side (no receivers, split, collect) is covered by
    ProveSplitsMutating's prove_split_zeroes_splittable and prove_collect_zeroes, and the token
    transfers by ProveAccounting.
*/
contract WithdrawAllHarness is SqueezeHistoryHarness {
    function withdrawAllAmt() external returns (int128 delta) {
        uint128 before = balance();
        _set(cfgIds[cfgIds.length - 1], type(int128).min);
        delta = -int128(before - balance());
    }

    // the sender's balance now (the stored one is as of the last update)
    function balance() public view returns (uint128) {
        return _balanceAt(SENDER, ERC20, _cfg(cfgIds[cfgIds.length - 1]), uint32(block.timestamp));
    }

    function receiveAll() external returns (uint128) {
        return _receiveStreams(RECV, ERC20, type(uint32).max);
    }
}

contract ProveWithdrawAll is EchidnaStart, Test {
    uint32 constant FIRST_CYCLE_LEFT = 519607; // START_TIMESTAMP + this is the first cycle's last second
    uint32 constant CYCLE = 604800;
    uint32 constant CYCLE_END = 1525305600; // end of the first cycle: 2522 * 604800
    uint128 constant DEPOSIT = 10_000_000_000;

    WithdrawAllHarness h;

    function setUp() public {
        h = new WithdrawAllHarness();
        h.start();
    }

    function _drain() internal {
        uint128 squeezed;
        uint128 received;
        int128 withdrawn;
        try h.squeeze(h.history()) returns (uint128 s) { squeezed = s; } catch { assert(false); }
        try h.receiveAll() returns (uint128 r) { received = r; } catch { assert(false); }
        try h.withdrawAllAmt() returns (int128 w) { withdrawn = w; } catch { assert(false); }
        assert(uint256(squeezed) + received + uint128(-withdrawn) == DEPOSIT);
        assert(h.balance() == 0);
        assert(h.squeezable(h.history()) == 0);
        assert(h.receivable() == 0);
        vm.warp(block.timestamp + CYCLE);
        assert(h.receivable() == 0);
    }

    function prove_drain_streams_first_cycle(uint32 dt) public {
        warpBy(dt, FIRST_CYCLE_LEFT);
        _drain();
    }

    function prove_drain_streams_later(uint32 dt) public {
        require(dt < CYCLE);
        vm.warp(CYCLE_END + dt);
        _drain();
    }
}
