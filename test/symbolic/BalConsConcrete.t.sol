// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;
import {Test} from "forge-std/Test.sol";
import {BalConsHarness} from "./ProveBalConservation.t.sol";

contract BalConsConcrete is Test {
    function test_conservation_reproduces() public {
        vm.warp(1524785992);                 // BASE = updateTime
        BalConsHarness h = new BalConsHarness();
        h.initCfg();
        vm.warp(1524785992 + 100000);        // mid-cycle future
        uint128 drained = h.senderDrained(uint32(block.timestamp));
        uint128 receivable = h.receiverReceivable();
        emit log_named_uint("drained (continuous)", drained);
        emit log_named_uint("receivable (quantized)", receivable);
        emit log_named_int("mismatch", int256(uint256(drained)) - int256(uint256(receivable)));
    }
}
