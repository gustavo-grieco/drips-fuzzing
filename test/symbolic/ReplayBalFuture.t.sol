// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {CryticTester} from "../recon/CryticTester.sol";

// Replay of the recon-fuzzer counterexample for testBalanceAtInFuture from scfuzzbench run
// gh-30146496505-1 (target 0ae8bd88), on the current (squeeze-fixed) code.
contract ReplayBalFuture is Test {
    CryticTester t;
    function setUp() public {
        vm.warp(1524785992);
        vm.roll(4370000);
        t = new CryticTester();
    }
    function step(address from) internal { vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(from); }
    function test_replay() public {
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); t.receiveStreamsSplitAndCollectToSelf(72);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000040000)); t.testSplitViewVsActual(255);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); t.testSplittableAfterSplit(22);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); t.receiveStreamsSplitAndCollectToSelf(213);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); t.testReceiveStreamsShouldNotRevert(124);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000030000)); t.testReceiveStreams(101, 1708733114);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); t.receiveStreamsSplitAndCollectToSelf(191);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); t.setStreamsWithClamping(193, 245, 485007912559153484949507350443821279860120632309, 917, 838, 91687458850628739420061685064645310199);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); t.testReceiveStreamsShouldNotRevert(104);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); t.addStream(109, 220, 782865397754326465979896121541064226896481535685, 17, 3693765309, 282044209472491936952049404);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000030000)); t.testBalanceAtInFuture(184, 0, 15674849364229);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000040000)); t.receiveStreamsSplitAndCollectToSelf(0);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000030000)); t.testGiveShouldNotRevert(205, 200, 13335240348659201270207951);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); t.receiveStreams(85, 3666689664);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000030000)); t.receiveStreamsAllCycles(30);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000040000)); t.testGiveShouldNotRevert(248, 251, 190466145251308579755905344);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); t.testSqueezeWithFullyHashedHistory(88, 152);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); t.testReceiversReceivedSplit(0);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); t.testCollect(248, 227);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000040000)); t.testAddSplitsShouldNotRevert(2, 25, 4294967293);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); t.testReceiveStreamsShouldNotRevert(249);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000030000)); t.testCollect(52, 36);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); t.testSetStreamBalanceWithdrawAllShouldNotRevert(208);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000040000)); t.receiveStreamsSplitAndCollectToSelf(131);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); t.squeezeWithDefaultHistory(162, 182);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); t.removeAllSplits(203);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); t.testSplitShouldNotRevert(97);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); t.testSqueezableVsReceived(228);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); t.testSqueezeWithFullyHashedHistory(72, 0);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000040000)); t.setSplitsWithClamping(151, 18, 146);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000030000)); t.testAddStreamShouldNotRevert(152, 104, 418869179563572713383252238097977900366087850866, 294, 2058548618, 710282254406404136834057842);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); t.invariantAccountingVsTokenBalance();
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); t.giveClampedAmount(1, 74, 288570115672117990121044825993028199220);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); t.setStreamBalance(252, 968);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000030000)); t.testSplitShouldNotRevert(193);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); t.collectToSelf(254);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); t.collectToSelf(200);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000040000)); t.testCollectableAfterSplit(197);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); t.addStreamImmediatelySqueezable(5, 22, 806223998721784051087294268396559683916327938442);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000030000)); t.squeezeWithFuzzedHistory(191, 123, 379, bytes32(0xa58c5ce144c237b2b9585ef3adc7b29c3a84422fc76baea58743c972c1997c9a));
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); t.testCollectableAfterSplit(13);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000030000)); t.collectToSelf(76);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); t.squeezeWithDefaultHistory(195, 147);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); t.invariantWithdrawShouldAlwaysFail(1);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); t.testSetSplitsShouldNotRevert(32, 252, 1679071680);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); t.splitAndCollectToSelf(8);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000030000)); t.testReceiveStreamsViewVsActual(91, 4154187309);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); t.setStreamBalance(195, 158);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000040000)); t.giveClampedAmount(103, 39, 231007405465428200026105024385410124464);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); t.squeezeWithFuzzedHistory(54, 7, 189, bytes32(0x000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f));
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); t.testBalanceAtInFuture(169, 225, 5);
    }
}
