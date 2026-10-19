// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {CryticTester} from "../recon/CryticTester.sol";

// Medusa's shrunk testBalanceAtInFuture counterexample from scfuzzbench run 1784151960 (target
// f3748e16, the audited revision with the squeeze fix), replayed on the current code. Medusa runs
// every call of this sequence at block 225, time 301.
contract ReplayMedusaBalFuture is Test {
    function replay(uint256 t0, uint256 b0) internal {
        vm.warp(t0); vm.roll(b0);
        CryticTester t = new CryticTester();
        vm.warp(block.timestamp + 33); vm.roll(block.number + 29); vm.prank(address(0x40000)); try t.setStreamsWithClamping(194, 0, 85070591730234615865843651857942052377, 0, 1, 47546914813571000431899598001118396677) {} catch {}
        vm.warp(block.timestamp + 71); vm.roll(block.number + 51); vm.prank(address(0x20000)); try t.addSplitsReceiverWithClamping(0, 0, 829357755) {} catch {}
        vm.warp(block.timestamp + 25); vm.roll(block.number + 17); vm.prank(address(0x20000)); try t.giveClampedAmount(61, 124, 9886562715746403206125455675556390561) {} catch {}
        vm.warp(block.timestamp + 36); vm.roll(block.number + 20); vm.prank(address(0x30000)); try t.testSplitShouldNotRevert(0) {} catch {}
        vm.warp(block.timestamp + 20); vm.roll(block.number + 2); vm.prank(address(0x40000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 54); vm.roll(block.number + 52); vm.prank(address(0x20000)); try t.testAddStreamShouldNotRevert(209, 0, 1249732974113303466399983258800507362842659370444, 1451130589, 0, 133246744431885414847758202223935015438) {} catch {}
        vm.warp(block.timestamp + 7); vm.roll(block.number + 3); vm.prank(address(0x30000)); try t.addStreamImmediatelySqueezable(238, 0, 4882819979684427439147997) {} catch {}
        vm.prank(address(0x20000)); try t.testRemoveStreamShouldNotRevert(235, 2114985636091165444645689291241756965962110454658233416301707393998123524211) {} catch {}
        vm.warp(block.timestamp + 47); vm.roll(block.number + 44); vm.prank(address(0x40000)); t.testBalanceAtInFuture(208, 0, 0);
    }
    function test_t0_1() public { replay(1, 1); }
    function test_t0_6() public { replay(6, 1); }
    function test_t0_7() public { replay(7, 1); }
    function test_t0_8() public { replay(8, 1); }
    function test_t0_echidna() public { replay(1524785992, 4370000); }
}

contract MaxEndProbe is CryticTester {
    event State(string tag, uint32 updateTime, uint128 balance, uint32 maxEnd);
    function probe() external {
        uint256 acc = getDripsAccountId(getAccount(208));
        (, , uint32 u0, uint128 b0, uint32 m0) = drips.streamsState(acc, token);
        emit State("before addStream", u0, b0, m0);
        uint160 aps = clampAmountPerSec(0);
        uint128 bal = uint128(clampBalanceDelta(int128(uint128(aps) * SECONDS_PER_CYCLE), getAccount(208)));
        addStream(208, 0, aps, 0, 0, int128(bal));
        (, , uint32 u1, uint128 b1, uint32 m1) = drips.streamsState(acc, token);
        emit State("after addStream", u1, b1, m1);
    }
}

contract MaxEndProbeTest is Test {
    function test_probe() public {
        vm.warp(7); vm.roll(1);
        MaxEndProbe t = new MaxEndProbe();
        vm.warp(block.timestamp + 33); vm.roll(block.number + 29); vm.prank(address(0x40000)); try t.setStreamsWithClamping(194, 0, 85070591730234615865843651857942052377, 0, 1, 47546914813571000431899598001118396677) {} catch {}
        vm.warp(block.timestamp + 71); vm.roll(block.number + 51); vm.prank(address(0x20000)); try t.addSplitsReceiverWithClamping(0, 0, 829357755) {} catch {}
        vm.warp(block.timestamp + 25); vm.roll(block.number + 17); vm.prank(address(0x20000)); try t.giveClampedAmount(61, 124, 9886562715746403206125455675556390561) {} catch {}
        vm.warp(block.timestamp + 36); vm.roll(block.number + 20); vm.prank(address(0x30000)); try t.testSplitShouldNotRevert(0) {} catch {}
        vm.warp(block.timestamp + 20); vm.roll(block.number + 2); vm.prank(address(0x40000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 54); vm.roll(block.number + 52); vm.prank(address(0x20000)); try t.testAddStreamShouldNotRevert(209, 0, 1249732974113303466399983258800507362842659370444, 1451130589, 0, 133246744431885414847758202223935015438) {} catch {}
        vm.warp(block.timestamp + 7); vm.roll(block.number + 3); vm.prank(address(0x30000)); try t.addStreamImmediatelySqueezable(238, 0, 4882819979684427439147997) {} catch {}
        vm.prank(address(0x20000)); try t.testRemoveStreamShouldNotRevert(235, 2114985636091165444645689291241756965962110454658233416301707393998123524211) {} catch {}
        vm.warp(block.timestamp + 47); vm.roll(block.number + 44);
        emit log_named_uint("now", block.timestamp);
        t.probe();
    }
}

contract MinimalBalFuture is Test {
    function run(uint256 t0, uint160 aps1, int128 delta1, uint256 w, uint160 aps3) internal {
        vm.warp(t0); vm.roll(1);
        CryticTester t = new CryticTester();
        // USER3 streams to USER1: start 0 (= "from when streams are set"), duration 1
        t.setStreamsWithClamping(192, 64, aps1, 0, 1, delta1);
        vm.warp(block.timestamp + w);
        t.testBalanceAtInFuture(192, 0, aps3);
    }
    function test_min_medusa_values() public { run(1524785992, 85070591730234615865843651857942052377, 47546914813571000431899598001118396677, 47, 0); }
    function test_min_medusa_values_t7() public { run(7, 85070591730234615865843651857942052377, 47546914813571000431899598001118396677, 47, 0); }
}

// Minimal: USER3 -> USER1 with a 1-second start-0 stream C (100 tok/s) and an open-ended stream
// A (1 tok/s); once the balance left is below C's one-second amount, testBalanceAtInFuture fails.
contract Minimal2BalFuture is Test {
    uint160 constant MIN = 100000000; // _minAmtPerSec for 10-second cycles
    function run(uint256 t0, uint256 w) internal {
        vm.warp(t0); vm.roll(1);
        CryticTester t = new CryticTester();
        t.setStreamsWithClamping(192, 64, 100e27 - MIN, 0, 1, int128(150e18));  // C: 100 tok/s for 1 s
        t.addStreamWithClamping(192, 64, 1e27 - MIN, 0, 0, 0);                   // A: 1 tok/s, open-ended
        vm.warp(block.timestamp + w);
        t.testBalanceAtInFuture(192, 0, 0);
    }
    function test_min2_w20() public { run(1524785992, 20); }
    function test_min2_w5() public { run(1524785992, 5); }
}

import {ProveBalanceAtInFuture} from "./ProveBalanceAtInFuture.t.sol";

contract HintedConcrete is Test {
    function test_hinted_t5() public {
        vm.warp(1524785992); vm.roll(4370000);
        ProveBalanceAtInFuture h = new ProveBalanceAtInFuture();
        vm.warp(1524785992 + 5);
        h.prove_balance_at_in_future(5);
    }
}

// Echidna's counterexample from HEVM (verification mode): prove_balance_at_in_future(dt = 7),
// time delay 7 seconds after deployment.
contract HevmCounterexampleReplay is Test {
    function test_hevm_cex() public {
        vm.warp(1524785992); vm.roll(4370000);
        ProveBalanceAtInFuture h = new ProveBalanceAtInFuture();
        vm.warp(1524785992 + 7); vm.roll(4370000 + 20911);
        h.prove_balance_at_in_future(7);
    }
}
