// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {EchidnaStart} from "./EchidnaStart.sol";
import {StreamSymAcctHarness} from "./ProveStreamSymAcct.t.sol";

/*
    Soundness mutants of ProveStreamSymAcct.prove_active_exact_symacct. Every property here is
    FALSE and must be reported with a counterexample; a "verified" result means the prover is unsound.
*/
contract MutantStreamSymAcct is EchidnaStart, Test {
    StreamSymAcctHarness h;
    function setUp() public { h = new StreamSymAcctHarness(); }

    // off by one in the expected balance
    function prove_mut_off_by_one(uint256 acc, uint32 t, uint32 dt) public {
        warpBy(dt, 400000);
        uint32 nowTs = uint32(block.timestamp);
        require(t >= nowTs && t - nowTs <= h.DUR());
        assert(h.setAndBalAt(acc, t) == h.DEPOSIT() - (t - nowTs) + 1);
    }

    // window extended one second past the stream end, where the balance stops draining
    function prove_mut_past_end(uint256 acc, uint32 t, uint32 dt) public {
        warpBy(dt, 400000);
        uint32 nowTs = uint32(block.timestamp);
        require(t >= nowTs && t - nowTs <= h.DUR() + 1);
        assert(h.setAndBalAt(acc, t) == h.DEPOSIT() - (t - nowTs));
    }

    // wrong rate: drains twice as fast
    function prove_mut_double_rate(uint256 acc, uint32 t, uint32 dt) public {
        warpBy(dt, 400000);
        uint32 nowTs = uint32(block.timestamp);
        require(t >= nowTs && t - nowTs <= h.DUR());
        assert(h.setAndBalAt(acc, t) == h.DEPOSIT() - 2 * (t - nowTs));
    }

    // claims nothing is ever drained (depends on reading updateTime back exactly)
    function prove_mut_no_drain(uint256 acc, uint32 t, uint32 dt) public {
        warpBy(dt, 400000);
        uint32 nowTs = uint32(block.timestamp);
        require(t >= nowTs && t - nowTs <= h.DUR());
        assert(h.setAndBalAt(acc, t) == h.DEPOSIT());
    }
}
