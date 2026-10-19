// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Vm} from "forge-std/Vm.sol";

/*
    Same start state and symbolic time for echidna and hevm.

    Echidna deploys and runs setUp at its initial block (timestamp 1524785992, number 4370000) and
    makes block.timestamp of each verified call symbolic in [start, start + maxTimeDelay]. `hevm test`
    starts at timestamp 0, block 0, and keeps block.timestamp concrete. Harnesses inherit this
    contract first, so its constructor moves both tools to echidna's start block before any other
    setup runs, and properties take time as an explicit offset with `warpBy`, so the window a
    property covers is written in the property and is the same under both tools.
*/
abstract contract EchidnaStart {
    Vm private constant VM_ = Vm(address(uint160(uint256(keccak256("hevm cheat code")))));

    uint32 internal constant START_TIMESTAMP = 1524785992;
    uint256 internal constant START_BLOCK = 4370000;

    constructor() {
        VM_.warp(START_TIMESTAMP);
        VM_.roll(START_BLOCK);
    }

    // block.timestamp := START_TIMESTAMP + dt, for any dt <= window
    function warpBy(uint32 dt, uint32 window) internal {
        require(dt <= window);
        VM_.warp(uint256(START_TIMESTAMP) + dt);
    }
}
