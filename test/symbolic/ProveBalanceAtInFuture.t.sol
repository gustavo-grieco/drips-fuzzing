// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Echidna} from "src/echidna/Echidna.sol";
import {EchidnaStart} from "./EchidnaStart.sol";

/*
    testBalanceAtInFuture (EchidnaStreamsTests), VERBATIM, on the real Echidna deployment of the
    current (squeeze-fixed) code. It fails there: Medusa broke it in scfuzzbench run 1784151960
    (target f3748e16, the audited revision).

    Cause: a receiver with start == 0 starts "when the streams are set". Every setStreams call
    restarts it, so a sender holding a start-0, duration-limited stream that already ran gets it
    re-armed when testBalanceAtInFuture adds a stream. If what is left of the balance cannot pay
    that restarted stream, _calcMaxEnd returns maxEnd == now and ALL the sender's streams stop:
    receivers end up with less than if nothing had happened (receivableAfter < receivableBaseline).

    Setup (constructor, through the suite's own helpers): USER3 -> USER1
      C: 100 tok/s, start 0, duration 1 s     A: 1 tok/s, open-ended     deposit 150 tok

    EXPECTED TO FAIL: the counterexample is block.timestamp = T0 + 7. Without the max-end hints
    in the constructor (or with a wider time window) the run runs out of memory or time instead.
*/
contract ProveBalanceAtInFuture is EchidnaStart, Echidna {
    uint160 constant MIN = 100000000; // _minAmtPerSec for 10-second cycles

    // The last call is the suite's own setMaxEndHints action (a call any of the fuzzers can make):
    // hints just past the time window bound _calcMaxEnd's binary search to a few steps.
    constructor() Echidna() {
        setStreamsWithClamping(192, 64, 100e27 - MIN, 0, 1, int128(150e18));
        addStreamWithClamping(192, 64, 1e27 - MIN, 0, 0, 0);
        setMaxEndHints(uint32(STARTING_TIMESTAMP + 8), uint32(STARTING_TIMESTAMP + 9));
    }

    // only block.timestamp is symbolic, inside the deployment's 10-second cycle
    // (STARTING_TIMESTAMP is 1524785992, its cycle starts at ...990): t in [T0 + 2, T0 + 7]
    function prove_balance_at_in_future(uint32 dt) public {
        require(dt >= 2);
        warpBy(dt, 7);
        testBalanceAtInFuture(192, 0, 0);
    }
}
