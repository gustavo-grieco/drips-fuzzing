// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Echidna} from "src/echidna/Echidna.sol";

/*
    testBalanceAtInFuture (EchidnaStreamsTests), the Drips suite invariant that still fails on the
    fixed code, reached through the fuzzer's counterexample shape on the REAL Echidna deployment:
      testSetStreamsShouldNotRevert -> wait -> addStreamImmediatelySqueezable -> wait -> testBalanceAtInFuture
    All calls are the suite's own functions, unchanged; sender USER1 (rawId 64), receiver USER0.
*/
contract FinalBoss is Echidna {
    constructor() Echidna() {}

    function seq(
        uint160 aps1, uint32 start1, uint32 dur1, int128 delta1, uint8 w1,
        uint160 aps2, uint8 w2, uint160 aps3
    ) public {
        testSetStreamsShouldNotRevert(64, 0, aps1, start1, dur1, delta1);
        hevm.warp(block.timestamp + (w1 % 101));
        addStreamImmediatelySqueezable(64, 0, aps2);
        hevm.warp(block.timestamp + (w2 % 101));
        testBalanceAtInFuture(64, 0, aps3);
    }

    function step1(uint160 aps1, uint32 start1, uint32 dur1, int128 delta1) public {
        testSetStreamsShouldNotRevert(64, 0, aps1, start1, dur1, delta1);
    }
    function step2(uint8 w1, uint160 aps2) public {
        hevm.warp(block.timestamp + (w1 % 101));
        addStreamImmediatelySqueezable(64, 0, aps2);
    }
    function step3(uint8 w2, uint160 aps3) public {
        hevm.warp(block.timestamp + (w2 % 101));
        testBalanceAtInFuture(64, 0, aps3);
    }
}

contract FinalBossConcrete is Test {
    FinalBoss b;
    function setUp() public {
        vm.warp(1524785992);
        vm.roll(4370000);
        b = new FinalBoss();
    }
    function testFuzz_seq(uint160 aps1, uint32 start1, uint32 dur1, int128 delta1, uint8 w1, uint160 aps2, uint8 w2, uint160 aps3) public {
        try b.seq(aps1, start1, dur1, delta1, w1, aps2, w2, aps3) {} catch (bytes memory err) {
            // only an assertion failure counts; requires/clamps that reject the input do not
            if (keccak256(err) == keccak256(abi.encodeWithSignature("Panic(uint256)", 1))) revert("ASSERTION FAILED");
        }
    }
}

contract FinalBossRepro is Test {
    function test_repro() public {
        vm.warp(1524785992);
        vm.roll(4370000);
        FinalBoss b = new FinalBoss();
        b.seq(298148556088025715788795419173860475, 5832, 1377425, 20428733, 3, 1809333769011771609471500564163711204645, 5, 7745238544728971742);
    }
}

contract FinalBossStats is Test {
    // log-uniform value: random bit width, then random bits
    function lu(uint256 r, uint256 k) internal pure returns (uint256) {
        uint256 h = uint256(keccak256(abi.encode(r, k)));
        uint256 bits = (h % 128) + 1;
        return (h >> 8) & ((uint256(1) << bits) - 1);
    }
    function test_stats() public {
        vm.warp(1524785992);
        vm.roll(4370000);
        uint256 ok; uint256 asserts; uint256 other; uint256 s1; uint256 s2;
        bytes32 panic1 = keccak256(abi.encodeWithSignature("Panic(uint256)", 1));
        for (uint256 i = 0; i < 20000; i++) {
            uint256 snap = vm.snapshot();
            FinalBoss b = new FinalBoss();
            uint256 r = uint256(keccak256(abi.encode(i)));
            try b.step1(uint160(lu(r, 1)), uint32(lu(r, 2)), uint32(lu(r, 3)), int128(int256(lu(r, 4)))) {} catch { s1++; vm.revertTo(snap); continue; }
            try b.step2(uint8(r >> 224), uint160(lu(r, 5))) {} catch { s2++; vm.revertTo(snap); continue; }
            try b.step3(uint8(r >> 232), uint160(lu(r, 6))) { ok++; }
            catch (bytes memory err) {
                if (keccak256(err) == panic1) {
                    asserts++;
                    if (asserts == 1) {
                        emit log_named_uint("FAIL i", i);
                        emit log_named_uint("aps1", uint160(lu(r, 1))); emit log_named_uint("start1", uint32(lu(r, 2)));
                        emit log_named_uint("dur1", uint32(lu(r, 3))); emit log_named_int("delta1", int128(int256(lu(r, 4))));
                        emit log_named_uint("w1", uint8(r >> 224)); emit log_named_uint("aps2", uint160(lu(r, 5)));
                        emit log_named_uint("w2", uint8(r >> 232)); emit log_named_uint("aps3", uint160(lu(r, 6)));
                    }
                } else other++;
            }
            vm.revertTo(snap);
        }
        emit log_named_uint("completed", ok);
        emit log_named_uint("assert failures", asserts);
        emit log_named_uint("step3 other reverts", other);
        emit log_named_uint("step1 reverts", s1);
        emit log_named_uint("step2 reverts", s2);
    }
}
