// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Echidna} from "src/echidna/Echidna.sol";
import {EchidnaStart} from "./EchidnaStart.sol";

/*
    REAL-setup FV: inherit the full drips Echidna tester (real DripsEchidna + AddressDriver +
    ERC20, deployed by the real EchidnaSetup constructor) and set up a stream through the REAL
    driver flow (addStream -> driver.setStreams). No hand-rolled state, no vm.store, no manual
    history reconstruction -- the setup is byte-for-byte what the fuzzer uses. Only the time is
    symbolic (STARTING_TIMESTAMP + dt, dt <= 400000), so these are forall-over-time proofs of the REAL
    property functions on REAL state.

    Constructor: USER0 streams to USER1, start backdated to 1 (< updateTime), duration 0 (until
    balance runs out), so the squeeze clamp is load-bearing. updateTime == STARTING_TIMESTAMP == BASE.

      make verify T=prove_real_squeeze_accounting
*/
contract ProveRealSqueeze is EchidnaStart, Echidna {
    constructor() Echidna() {
        // real driver-backed setup: from USER0 -> USER1, amtPerSec 1e9 (1 unit/s), start=1 (backdated),
        // duration 0, deposit 1e18 (maxEnd saturates uint32 => stream active across the window)
        addStream(0, 1, 1e9, 1, 0, int128(int256(1e18)));
    }

    // REAL property: squeeze accounting integrity (squeezable/splittable conservation), forall time.
    function prove_real_squeeze_accounting(uint32 dt) public {
        warpBy(dt, 400000);
        testSqueeze(1, 0);
    }

    // Regression-catcher on REAL state: the amount squeezed via the real drips squeeze never exceeds
    // what could stream since updateTime. CLEAN: clamp => start==updateTime => holds. REGRESSION:
    // clamp gone => start==cycleStart<updateTime => over-squeeze => falsified.
    function prove_real_no_pre_update(uint32 dt) public {
        warpBy(dt, 400000);
        uint128 amt = squeezeWithDefaultHistory(1, 0);
        uint256 ref = refStreamed(STARTING_TIMESTAMP, uint256(uint32(block.timestamp)));
        assert(uint256(amt) <= ref);
    }

    // copy of Streams._streamedAmt specialized to SECONDS_PER_CYCLE=10 / amtPerSec=1e9 (the values
    // used in the real stream above) -- the only non-real line, a pure arithmetic oracle
    function refStreamed(uint256 start, uint256 end) internal pure returns (uint256 amt) {
        uint256 cycleSecs = 10;
        uint256 amtPerSec = 1e9;
        assembly {
            let endedCycles := sub(div(end, cycleSecs), div(start, cycleSecs))
            let amtPerCycle := div(mul(cycleSecs, amtPerSec), 1000000000)
            amt := mul(endedCycles, amtPerCycle)
            let amtEnd := div(mul(mod(end, cycleSecs), amtPerSec), 1000000000)
            amt := add(amt, amtEnd)
            let amtStart := div(mul(mod(start, cycleSecs), amtPerSec), 1000000000)
            amt := sub(amt, amtStart)
        }
    }
}
