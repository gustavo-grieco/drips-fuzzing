// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;
import {Test} from "forge-std/Test.sol";
import {Streams, StreamReceiver, StreamConfigImpl} from "src/Streams.sol";
import {IERC20} from "openzeppelin-contracts/token/ERC20/IERC20.sol";

contract GasCycleHarness is Streams {
    IERC20 constant ERC20 = IERC20(address(0xE12C20));
    constructor() Streams(604800, keccak256("drips.gascycle.check")) {}
    function setStream(uint128 dep) external {
        StreamReceiver[] memory e = new StreamReceiver[](0);
        StreamReceiver[] memory r = new StreamReceiver[](1);
        r[0] = StreamReceiver(42, StreamConfigImpl.create(0, 1e9, 0, 0));
        _setStreams(100, ERC20, e, int128(dep), r, 0, 0);
    }
    function recv(uint32 maxCycles) external returns (uint128 amt) {
        amt = _receiveStreams(42, ERC20, maxCycles);
    }
}
contract GasCycleCheck is Test {
    function test_gas_vs_elapsed_cycles() public {
        vm.warp(1524785992);
        GasCycleHarness h = new GasCycleHarness();
        h.setStream(type(uint128).max / 1e10);        // effectively endless stream
        for (uint256 n = 1; n <= 7000; n = n * 10) {  // 1, 10, 100, 1000, 7000-ish cycles
            uint256 snap = vm.snapshot();
            vm.warp(1524785992 + n * 604800 + 1);
            uint256 g0 = gasleft();
            h.recv(type(uint32).max);
            uint256 used = g0 - gasleft();
            emit log_named_uint(string(abi.encodePacked("cycles=", vm.toString(n), " gas")), used);
            vm.revertTo(snap);
        }
        // full uint32-lifetime worst case (~7100 cycles)
        vm.warp(uint256(type(uint32).max) - 10);
        uint256 g1 = gasleft();
        h.recv(type(uint32).max);
        emit log_named_uint("cycles=MAX-lifetime gas", g1 - gasleft());
    }
}
