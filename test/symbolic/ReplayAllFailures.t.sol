// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;
import {Test} from "forge-std/Test.sol";
import {CryticTester} from "../recon/CryticTester.sol";
// Generated: every non-canary failure recorded by echidna/recon in scfuzzbench run gh-30146496505-1.
contract ReplayAllFailures is Test {
    CryticTester t;
    function setUp() public { vm.warp(1524785992); vm.roll(4370000); t = new CryticTester(); }
    // i-0537465ab58fd927d-echidna-v2.3.2: testBalanceAtInFuture (37 calls)
    function test_01_testBalanceAtInFuture() public {
        vm.warp(block.timestamp + 43); vm.roll(block.number + 22364); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.collect(226, 98) {} catch {}
        vm.warp(block.timestamp + 66); vm.roll(block.number + 36694); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamBalanceWithClamping(228, 982814882332672109686170619) {} catch {}
        vm.warp(block.timestamp + 55); vm.roll(block.number + 18456);
        vm.warp(block.timestamp + 21); vm.roll(block.number + 22354); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.split(225) {} catch {}
        vm.warp(block.timestamp + 43); vm.roll(block.number + 42914); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.splitAndCollectToSelf(160) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 5548); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewConsistency(167, 3467333873) {} catch {}
        vm.warp(block.timestamp + 50); vm.roll(block.number + 49152); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewConsistency(134, 1524787177) {} catch {}
        vm.warp(block.timestamp + 26); vm.roll(block.number + 10026); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 73); vm.roll(block.number + 3072); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 18); vm.roll(block.number + 35642); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addStreamWithClamping(2, 9, 179, 4294967293, 3630281748, 63796879019102360866017089131421958724) {} catch {}
        vm.warp(block.timestamp + 42); vm.roll(block.number + 17556); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamBalance(224, 92849699373635624031835544) {} catch {}
        vm.warp(block.timestamp + 5); vm.roll(block.number + 55640); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithFuzzedHistory(32, 147, 86880973723694896261400538317034935904984942387416755270877317957462141231417, bytes32(0xd77bdeeccdc7491e37833d1eec8fc6acbe511e31f1707f6af0897ac05f9a72be)) {} catch {}
        vm.warp(block.timestamp + 76); vm.roll(block.number + 12488); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setSplits(45, 169, 351) {} catch {}
        vm.warp(block.timestamp + 46); vm.roll(block.number + 39882); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiversReceivedSplit(40) {} catch {}
        vm.warp(block.timestamp + 74); vm.roll(block.number + 22337); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addSplitsReceiverWithClamping(2, 205, 651536367) {} catch {}
        vm.warp(block.timestamp + 53); vm.roll(block.number + 42145); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantAmtPerSecVsMinAmtPerSec(0, 115792089237316195423570985008687907853269984665640564039457584007913129639931) {} catch {}
        vm.warp(block.timestamp + 14); vm.roll(block.number + 8048); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.giveClampedAmount(12, 116, 96653892940176803852883907220738357057) {} catch {}
        vm.warp(block.timestamp + 16); vm.roll(block.number + 54247); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamsShouldNotRevert(158, 161, 326804987815141529165046100715344232662747960891, 1186100482, 0, 641) {} catch {}
        vm.warp(block.timestamp + 61); vm.roll(block.number + 60152); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewVsActual(233, 872039) {} catch {}
        vm.warp(block.timestamp + 35); vm.roll(block.number + 3798);
        vm.warp(block.timestamp + 58); vm.roll(block.number + 32147); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeWithFullyHashedHistory(207, 31) {} catch {}
        vm.warp(block.timestamp + 84); vm.roll(block.number + 15412);
        vm.warp(block.timestamp + 6); vm.roll(block.number + 3714); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.assert_canary_ASSERTION_CANARY(107370295755136217370378808580414917483297937509460323865823822579942924388975) {} catch {}
        vm.warp(block.timestamp + 61); vm.roll(block.number + 29761); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setMaxEndHints(3684336535, 548178511) {} catch {}
        vm.warp(block.timestamp + 65); vm.roll(block.number + 49264); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addStreamImmediatelySqueezable(160, 3, 304975787801851717078415119179375) {} catch {}
        vm.warp(block.timestamp + 2); vm.roll(block.number + 637); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeWithDefaultHistory(157, 147) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 55285);
        vm.warp(block.timestamp + 27); vm.roll(block.number + 9098); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testRemoveStreamShouldNotRevert(0, 56752998122563563340033249809755886711737899813985184458892994833508366609494) {} catch {}
        vm.warp(block.timestamp + 16); vm.roll(block.number + 19667); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeWithFuzzedHistory(248, 74, 11374496320241596966376201, bytes32(0x9370004c7e3bd0cc9092f12d5ec18279acc22f6e330b34a9a9eaeba277b15cab)) {} catch {}
        vm.warp(block.timestamp + 75); vm.roll(block.number + 17386); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiversReceivedSplit(40) {} catch {}
        vm.warp(block.timestamp + 5); vm.roll(block.number + 39790);
        vm.warp(block.timestamp + 63); vm.roll(block.number + 52837); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsViewVsActual(23, 412) {} catch {}
        vm.warp(block.timestamp + 17); vm.roll(block.number + 2636); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.assert_canary_ASSERTION_CANARY(778447145810872556144666219) {} catch {}
        vm.warp(block.timestamp + 12); vm.roll(block.number + 10851); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezeWithFullyHashedHistory(208, 223) {} catch {}
        vm.warp(block.timestamp + 75); vm.roll(block.number + 13097); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testCollectShouldNotRevert(98, 190) {} catch {}
        vm.warp(block.timestamp + 98); vm.roll(block.number + 45524); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setStreamsWithClamping(116, 87, 4294967292, 1524787866, 253459, 569050467412656095921178344) {} catch {}
        vm.warp(block.timestamp + 63); vm.roll(block.number + 43084); vm.prank(address(0x0000000000000000000000000000000000040000)); t.testBalanceAtInFuture(128, 130, 37133273755491994721947740);
    }
    // i-0537465ab58fd927d-echidna-v2.3.2: testSqueezableVsReceived (51 calls)
    function test_02_testSqueezableVsReceived() public {
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewVsActual(4, 1673155833) {} catch {}
        vm.warp(block.timestamp + 94); vm.roll(block.number + 59981); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setStreamBalanceWithClamping(189, -997) {} catch {}
        vm.warp(block.timestamp + 163); vm.roll(block.number + 5536);
        vm.warp(block.timestamp + 57); vm.roll(block.number + 488); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezableVsReceived(154) {} catch {}
        vm.warp(block.timestamp + 52); vm.roll(block.number + 35679); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSplittableAfterSplit(222) {} catch {}
        vm.warp(block.timestamp + 32); vm.roll(block.number + 198); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSplitViewVsActual(7) {} catch {}
        vm.warp(block.timestamp + 2); vm.roll(block.number + 58820); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamBalanceWithClamping(118, 20401663999440076360676680377611300281) {} catch {}
        vm.warp(block.timestamp + 38); vm.roll(block.number + 9966); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.receiveStreamsSplitAndCollectToSelf(14) {} catch {}
        vm.warp(block.timestamp + 32); vm.roll(block.number + 202); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeTwice(20, 72, 224, bytes32(0x8d3aba6fa12f1fb48b328fab3e43feb5b7460fcc7f833a8026f20f284a9e9d0d)) {} catch {}
        vm.warp(block.timestamp + 2); vm.roll(block.number + 104); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollectShouldNotRevert(141, 66) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamsWithClamping(115, 207, 1050038879798602300948325288044166836914262194427, 4294967292, 8, -99999999999999999999999999999999998) {} catch {}
        vm.warp(block.timestamp + 64); vm.roll(block.number + 5021); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantSumAmtDeltaIsZero(103) {} catch {}
        vm.warp(block.timestamp + 74); vm.roll(block.number + 4002);
        vm.warp(block.timestamp + 37); vm.roll(block.number + 30); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezableVsReceived(198) {} catch {}
        vm.warp(block.timestamp + 59); vm.roll(block.number + 58822); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSplitViewVsActual(9) {} catch {}
        vm.warp(block.timestamp + 67); vm.roll(block.number + 60083); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.removeAllSplits(138) {} catch {}
        vm.warp(block.timestamp + 63); vm.roll(block.number + 5006); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollectShouldNotRevert(4, 74) {} catch {}
        vm.warp(block.timestamp + 88); vm.roll(block.number + 2957); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.receiveStreams(48, 6511762) {} catch {}
        vm.warp(block.timestamp + 45); vm.roll(block.number + 34108); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeAllSenders(9) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezableAmountCantBeWithdrawn(88, 233) {} catch {}
        vm.warp(block.timestamp + 42); vm.roll(block.number + 47255); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewVsActual(133, 4294967291) {} catch {}
        vm.warp(block.timestamp + 3); vm.roll(block.number + 15977); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalanceWithdrawAll(211) {} catch {}
        vm.warp(block.timestamp + 76); vm.roll(block.number + 20387); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplittableAfterSplit(1) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiversReceivedSplit(41) {} catch {}
        vm.warp(block.timestamp + 34); vm.roll(block.number + 34481); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeAllSenders(134) {} catch {}
        vm.warp(block.timestamp + 29); vm.roll(block.number + 48543); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantSumAmtDeltaIsZero(99) {} catch {}
        vm.warp(block.timestamp + 72); vm.roll(block.number + 334); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testAddStreamShouldNotRevert(125, 54, 46838619033521808642924059597586974367330195367, 35, 56, 567) {} catch {}
        vm.warp(block.timestamp + 83); vm.roll(block.number + 1489); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetSplitsShouldNotRevert(8, 123, 326946444) {} catch {}
        vm.warp(block.timestamp + 62); vm.roll(block.number + 7144); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.removeAllSplits(125) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testAddSplitsShouldNotRevert(213, 95, 347280621) {} catch {}
        vm.warp(block.timestamp + 20); vm.roll(block.number + 7145); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollect(99, 158) {} catch {}
        vm.warp(block.timestamp + 71); vm.roll(block.number + 1312); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 142); vm.roll(block.number + 64937);
        vm.warp(block.timestamp + 85); vm.roll(block.number + 17032); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewVsActual(20, 101) {} catch {}
        vm.warp(block.timestamp + 42); vm.roll(block.number + 47266); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addStream(80, 139, 2070838745805919928691816919003395152306, 682737274, 1524786974, -69) {} catch {}
        vm.warp(block.timestamp + 2); vm.roll(block.number + 482); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.collectToSelf(191) {} catch {}
        vm.warp(block.timestamp + 93); vm.roll(block.number + 7231); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueeze(188, 9) {} catch {}
        vm.warp(block.timestamp + 5); vm.roll(block.number + 44938); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addStreamWithClamping(47, 95, 61, 1524786120, 1524788349, 64913411328945830113971602559600186672) {} catch {}
        vm.warp(block.timestamp + 87); vm.roll(block.number + 4835); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.collectToSelf(135) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeWithFullyHashedHistory(6, 102) {} catch {}
        vm.warp(block.timestamp + 64); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addSplitsReceiverWithClamping(131, 15, 2987980192) {} catch {}
        vm.warp(block.timestamp + 58); vm.roll(block.number + 19326); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeToSelf(97) {} catch {}
        vm.warp(block.timestamp + 69); vm.roll(block.number + 3821); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setSplitsWithClamping(202, 203, 3997270500) {} catch {}
        vm.warp(block.timestamp + 79); vm.roll(block.number + 59301);
        vm.warp(block.timestamp + 21); vm.roll(block.number + 6169); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addSplitsReceiverWithClamping(227, 7, 2338670609) {} catch {}
        vm.warp(block.timestamp + 90); vm.roll(block.number + 13588); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamBalanceWithdrawAll(101) {} catch {}
        vm.warp(block.timestamp + 68); vm.roll(block.number + 1021);
        vm.warp(block.timestamp + 5); vm.roll(block.number + 27747); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeAllSenders(17) {} catch {}
        vm.warp(block.timestamp + 52); vm.roll(block.number + 341); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantWithdrawAllTokens() {} catch {}
        vm.warp(block.timestamp + 43); vm.roll(block.number + 60083); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezableAmountCantBeWithdrawn(64, 88) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000030000)); t.testSqueezableVsReceived(136);
    }
    // i-0537465ab58fd927d-echidna-v2.3.2: invariantWithdrawAllTokensShouldNotRevert (87 calls)
    function test_03_invariantWithdrawAllTokensShouldNotRevert() public {
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreams(131, 16) {} catch {}
        vm.warp(block.timestamp + 18); vm.roll(block.number + 190); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplittableAfterSplit(56) {} catch {}
        vm.warp(block.timestamp + 4); vm.roll(block.number + 29827); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalanceWithClamping(2, 28326947553072844321832999904079124664) {} catch {}
        vm.warp(block.timestamp + 89); vm.roll(block.number + 195);
        vm.warp(block.timestamp + 6); vm.roll(block.number + 29); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testGiveShouldNotRevert(27, 128, 605) {} catch {}
        vm.warp(block.timestamp + 75); vm.roll(block.number + 15);
        vm.warp(block.timestamp + 62); vm.roll(block.number + 55538); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetSplitsShouldNotRevert(16, 252, 1977953295) {} catch {}
        vm.warp(block.timestamp + 75); vm.roll(block.number + 4861);
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollectShouldNotRevert(94, 125) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamBalanceShouldNotRevert(65, 4294967298) {} catch {}
        vm.warp(block.timestamp + 73); vm.roll(block.number + 5008); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.collectToSelf(193) {} catch {}
        vm.warp(block.timestamp + 11); vm.roll(block.number + 42229);
        vm.warp(block.timestamp + 67); vm.roll(block.number + 305); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testCollectableAfterSplit(60) {} catch {}
        vm.warp(block.timestamp + 15); vm.roll(block.number + 2910);
        vm.warp(block.timestamp + 93); vm.roll(block.number + 15976); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamBalance(65, 1000000000) {} catch {}
        vm.warp(block.timestamp + 25); vm.roll(block.number + 127); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantSumAmtDeltaIsZero(11) {} catch {}
        vm.warp(block.timestamp + 30); vm.roll(block.number + 998); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetSplitsShouldNotRevert(10, 89, 149995) {} catch {}
        vm.warp(block.timestamp + 129); vm.roll(block.number + 12165);
        vm.warp(block.timestamp + 4); vm.roll(block.number + 59508); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiversReceivedSplit(161) {} catch {}
        vm.warp(block.timestamp + 29); vm.roll(block.number + 44369); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.giveClampedAmount(28, 30, 17293927872662523611372838380700506099) {} catch {}
        vm.warp(block.timestamp + 34); vm.roll(block.number + 30041); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreams(164, 1524786032) {} catch {}
        vm.warp(block.timestamp + 100); vm.roll(block.number + 372); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezableVsReceived(63) {} catch {}
        vm.warp(block.timestamp + 21); vm.roll(block.number + 1073); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setMaxEndHints(3299075600, 1219241514) {} catch {}
        vm.warp(block.timestamp + 70); vm.roll(block.number + 42101); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsShouldNotRevert(19) {} catch {}
        vm.warp(block.timestamp + 94); vm.roll(block.number + 1469); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.splitAndCollectToSelf(101) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.removeAllSplits(186) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamBalanceShouldNotRevert(126, -97) {} catch {}
        vm.warp(block.timestamp + 52); vm.roll(block.number + 12493);
        vm.warp(block.timestamp + 78); vm.roll(block.number + 16786); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezableVsReceived(132) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewVsActual(96, 1524787777) {} catch {}
        vm.warp(block.timestamp + 65); vm.roll(block.number + 4835); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testBalanceAtInFuture(16, 239, 99999999999999999999999999999999999) {} catch {}
        vm.warp(block.timestamp + 26); vm.roll(block.number + 48543); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamBalance(133, -125) {} catch {}
        vm.warp(block.timestamp + 97); vm.roll(block.number + 6680); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsViewVsActual(50, 1000000) {} catch {}
        vm.warp(block.timestamp + 50); vm.roll(block.number + 49415); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreamsViewConsistency(144, 1524789153) {} catch {}
        vm.warp(block.timestamp + 87); vm.roll(block.number + 20489);
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamBalanceShouldNotRevert(128, 67972300434262688803711745947994701962) {} catch {}
        vm.warp(block.timestamp + 7); vm.roll(block.number + 2480); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(63) {} catch {}
        vm.warp(block.timestamp + 48); vm.roll(block.number + 46041); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamBalanceWithdrawAllShouldNotRevert(32) {} catch {}
        vm.warp(block.timestamp + 10); vm.roll(block.number + 16633); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsShouldNotRevert(32) {} catch {}
        vm.warp(block.timestamp + 15); vm.roll(block.number + 4829); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollect(95, 83) {} catch {}
        vm.warp(block.timestamp + 23); vm.roll(block.number + 1073); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsShouldNotRevert(0) {} catch {}
        vm.warp(block.timestamp + 36); vm.roll(block.number + 27519); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezableVsReceived(204) {} catch {}
        vm.warp(block.timestamp + 68); vm.roll(block.number + 605); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetSplitsShouldNotRevert(99, 94, 467540993) {} catch {}
        vm.warp(block.timestamp + 21); vm.roll(block.number + 94);
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.split(252) {} catch {}
        vm.warp(block.timestamp + 17); vm.roll(block.number + 55882); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueeze(156, 23) {} catch {}
        vm.warp(block.timestamp + 22); vm.roll(block.number + 2833); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testAddSplitsShouldNotRevert(86, 161, 1000001) {} catch {}
        vm.warp(block.timestamp + 39); vm.roll(block.number + 23407); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueeze(89, 4) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.receiveStreams(196, 981497064) {} catch {}
        vm.warp(block.timestamp + 81); vm.roll(block.number + 15495); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeWithFuzzedHistoryShouldNotRevert(111, 198, 33836616157800148473937241991990060311975165975819281289460902511640494382846, bytes32(0xdb5d1a01090d86ae918d075a5887f56b7586d861bc4d7eb61237728ce5c2d654)) {} catch {}
        vm.warp(block.timestamp + 89); vm.roll(block.number + 26232); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testGiveShouldNotRevert(25, 187, 36695478098517707606584814) {} catch {}
        vm.warp(block.timestamp + 20); vm.roll(block.number + 48540); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addStream(226, 18, 1970990394, 3118637718, 3810455976, -16) {} catch {}
        vm.warp(block.timestamp + 98); vm.roll(block.number + 31363); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreams(86, 834291243) {} catch {}
        vm.warp(block.timestamp + 29); vm.roll(block.number + 11077); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setStreamsWithClamping(30, 19, 617, 4294967291, 310, 26039450342971046126804305184726863631) {} catch {}
        vm.warp(block.timestamp + 10); vm.roll(block.number + 35679); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezableVsReceived(203) {} catch {}
        vm.warp(block.timestamp + 10); vm.roll(block.number + 58356);
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testBalanceAtInFuture(0, 227, 2) {} catch {}
        vm.warp(block.timestamp + 81); vm.roll(block.number + 41650);
        vm.warp(block.timestamp + 36); vm.roll(block.number + 47666); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreams(193, 859772826) {} catch {}
        vm.warp(block.timestamp + 14); vm.roll(block.number + 524);
        vm.warp(block.timestamp + 61); vm.roll(block.number + 48539); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollect(167, 189) {} catch {}
        vm.warp(block.timestamp + 39); vm.roll(block.number + 12155); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsViewVsActual(12, 1524786737) {} catch {}
        vm.warp(block.timestamp + 97); vm.roll(block.number + 29826); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testRemoveStreamShouldNotRevert(219, 1023) {} catch {}
        vm.warp(block.timestamp + 85); vm.roll(block.number + 1539); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setSplitsWithClamping(162, 202, 1524787665) {} catch {}
        vm.warp(block.timestamp + 85); vm.roll(block.number + 221); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testGiveShouldNotRevert(100, 29, 5717116825777510616465746) {} catch {}
        vm.warp(block.timestamp + 74); vm.roll(block.number + 1141); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamBalance(157, 255) {} catch {}
        vm.warp(block.timestamp + 46); vm.roll(block.number + 58361); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantAmtPerSecVsMinAmtPerSec(29, 1260923865184704658097691227523376423232781910471082051) {} catch {}
        vm.warp(block.timestamp + 69); vm.roll(block.number + 2253); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 37); vm.roll(block.number + 7323); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreams(210, 448593756) {} catch {}
        vm.warp(block.timestamp + 12); vm.roll(block.number + 32737); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsShouldNotRevert(251) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setMaxEndHints(1524789153, 730174712) {} catch {}
        vm.warp(block.timestamp + 63); vm.roll(block.number + 32303); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollectShouldNotRevert(252, 29) {} catch {}
        vm.warp(block.timestamp + 53); vm.roll(block.number + 19291); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.removeAllSplits(23) {} catch {}
        vm.warp(block.timestamp + 74); vm.roll(block.number + 1012);
        vm.warp(block.timestamp + 36); vm.roll(block.number + 4801); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiversReceivedSplit(193) {} catch {}
        vm.warp(block.timestamp + 16); vm.roll(block.number + 58821); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeToSelf(226) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 9966); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeWithFuzzedHistoryShouldNotRevert(106, 3, 111685542825564708857932739071594217666419970133247396884543305520700841422279, bytes32(0x546f74616c2062616c616e636520746f6f206869670000000000000000000074)) {} catch {}
        vm.warp(block.timestamp + 100); vm.roll(block.number + 4992); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testAddSplitsShouldNotRevert(77, 159, 21) {} catch {}
        vm.warp(block.timestamp + 31); vm.roll(block.number + 30042); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetStreamsShouldNotRevert(62, 253, 699658291906097360191233927429469406883463255024, 2229975555, 1366442910, 121550114680608018556556087155548548987) {} catch {}
        vm.warp(block.timestamp + 43); vm.roll(block.number + 5585); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiversReceivedSplit(31) {} catch {}
        vm.warp(block.timestamp + 46); vm.roll(block.number + 35461); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(24) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testAddSplitsShouldNotRevert(28, 0, 2193402657) {} catch {}
        vm.warp(block.timestamp + 23); vm.roll(block.number + 5237); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplitViewVsActual(48) {} catch {}
        vm.warp(block.timestamp + 45); vm.roll(block.number + 15368); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addStreamWithClamping(29, 178, 826510562393625660763011840902837985831644785687, 148813478, 197, 134646769824517379255438125023525546203) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setStreams(136, 227, 608059538537500635227482833128198208437927250433, 1524789153, 370001, 1000000000000000000000000003) {} catch {}
        vm.warp(block.timestamp + 24); vm.roll(block.number + 68); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezableAmountCantBeUndone(81, 15, 1461501637330902918203684832716283019655932542974, 127, 2742556245, -999) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); t.invariantWithdrawAllTokensShouldNotRevert();
    }
    // i-0537465ab58fd927d-echidna-v2.3.2: testSqueezableAmountCantBeWithdrawn (60 calls)
    function test_04_testSqueezableAmountCantBeWithdrawn() public {
        vm.warp(block.timestamp + 10); vm.roll(block.number + 42229); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollect(16, 36) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.addSplitsReceiverWithClamping(100, 187, 3812308282) {} catch {}
        vm.warp(block.timestamp + 53); vm.roll(block.number + 27404);
        vm.warp(block.timestamp + 48); vm.roll(block.number + 23406); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezableAmountCantBeUndone(81, 14, 1461501637330902918203684832716283019655932542974, 34, 2742556245, -999) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 6681); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezableAmountCantBeWithdrawn(12, 184) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplittableAfterSplit(0) {} catch {}
        vm.warp(block.timestamp + 40); vm.roll(block.number + 6); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplitViewVsActual(35) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantSumAmtDeltaIsZero(181) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setStreamBalanceWithClamping(197, -1003) {} catch {}
        vm.warp(block.timestamp + 38); vm.roll(block.number + 4540); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.receiveStreamsSplitAndCollectToSelf(55) {} catch {}
        vm.warp(block.timestamp + 8); vm.roll(block.number + 158); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollectableAfterSplit(186) {} catch {}
        vm.warp(block.timestamp + 32); vm.roll(block.number + 2512); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.receiveStreamsSplitAndCollectToSelf(40) {} catch {}
        vm.warp(block.timestamp + 12); vm.roll(block.number + 31); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetSplitsShouldNotRevert(178, 128, 2847133284) {} catch {}
        vm.warp(block.timestamp + 24); vm.roll(block.number + 40372); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantWithdrawShouldAlwaysFail(999999998) {} catch {}
        vm.warp(block.timestamp + 16); vm.roll(block.number + 2511); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsViewConsistency(2, 67) {} catch {}
        vm.warp(block.timestamp + 48); vm.roll(block.number + 4992); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSplitShouldNotRevert(153) {} catch {}
        vm.warp(block.timestamp + 48); vm.roll(block.number + 5016); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSplittableAfterSplit(163) {} catch {}
        vm.warp(block.timestamp + 98); vm.roll(block.number + 8447);
        vm.warp(block.timestamp + 26); vm.roll(block.number + 4961); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.receiveStreams(49, 2865039691) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 58359); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsViewConsistency(222, 1195762364) {} catch {}
        vm.warp(block.timestamp + 80); vm.roll(block.number + 5013); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalanceWithdrawAll(4) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.split(102) {} catch {}
        vm.warp(block.timestamp + 33); vm.roll(block.number + 48539); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.receiveStreamsAllCycles(1) {} catch {}
        vm.warp(block.timestamp + 62); vm.roll(block.number + 999); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.receiveStreams(114, 238) {} catch {}
        vm.warp(block.timestamp + 27); vm.roll(block.number + 42102); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setMaxEndHints(191, 329038248) {} catch {}
        vm.warp(block.timestamp + 93); vm.roll(block.number + 4895); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiversReceivedSplit(9) {} catch {}
        vm.warp(block.timestamp + 19); vm.roll(block.number + 63); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollectableAfterSplit(16) {} catch {}
        vm.warp(block.timestamp + 71); vm.roll(block.number + 54862); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSplitShouldNotRevert(190) {} catch {}
        vm.warp(block.timestamp + 99); vm.roll(block.number + 49527);
        vm.warp(block.timestamp + 31); vm.roll(block.number + 7); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.splitAndCollectToSelf(162) {} catch {}
        vm.warp(block.timestamp + 73); vm.roll(block.number + 58722); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreams(63, 762587491) {} catch {}
        vm.warp(block.timestamp + 75); vm.roll(block.number + 4824); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.assert_canary_ASSERTION_CANARY(20409044487300478179451302805678231257766150128864615941890963330947867468563) {} catch {}
        vm.warp(block.timestamp + 44); vm.roll(block.number + 93); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamBalance(133, -125) {} catch {}
        vm.warp(block.timestamp + 18); vm.roll(block.number + 23400); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(1) {} catch {}
        vm.warp(block.timestamp + 12); vm.roll(block.number + 189); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.giveClampedAmount(1, 11, 83336695233467366766555544165918050) {} catch {}
        vm.warp(block.timestamp + 82); vm.roll(block.number + 191);
        vm.warp(block.timestamp + 47); vm.roll(block.number + 47075); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollectableAfterSplit(15) {} catch {}
        vm.warp(block.timestamp + 46); vm.roll(block.number + 58448); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalanceWithClamping(67, 4000000000000000000000000001) {} catch {}
        vm.warp(block.timestamp + 16); vm.roll(block.number + 4027); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezableVsReceived(210) {} catch {}
        vm.warp(block.timestamp + 33); vm.roll(block.number + 58239); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setSplitsWithClamping(240, 236, 489226076) {} catch {}
        vm.warp(block.timestamp + 30); vm.roll(block.number + 5002); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.splitAndCollectToSelf(188) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.splitAndCollectToSelf(12) {} catch {}
        vm.warp(block.timestamp + 12); vm.roll(block.number + 32306); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamBalanceShouldNotRevert(95, 1026) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSplittableAfterSplit(250) {} catch {}
        vm.warp(block.timestamp + 100); vm.roll(block.number + 36805); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantWithdrawAllTokens() {} catch {}
        vm.warp(block.timestamp + 72); vm.roll(block.number + 30256); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.split(200) {} catch {}
        vm.warp(block.timestamp + 24); vm.roll(block.number + 4026);
        vm.warp(block.timestamp + 16); vm.roll(block.number + 67); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamBalance(224, 1000002) {} catch {}
        vm.warp(block.timestamp + 3); vm.roll(block.number + 17031); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeToSelf(188) {} catch {}
        vm.warp(block.timestamp + 57); vm.roll(block.number + 53794); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testCollect(8, 29) {} catch {}
        vm.warp(block.timestamp + 88); vm.roll(block.number + 4000); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.receiveStreamsAllCycles(88) {} catch {}
        vm.warp(block.timestamp + 39); vm.roll(block.number + 33198); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSplittableAfterSplit(22) {} catch {}
        vm.warp(block.timestamp + 69); vm.roll(block.number + 28697); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(198) {} catch {}
        vm.warp(block.timestamp + 19); vm.roll(block.number + 5237); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.split(1) {} catch {}
        vm.warp(block.timestamp + 35); vm.roll(block.number + 4867); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addStreamImmediatelySqueezable(127, 158, 22) {} catch {}
        vm.warp(block.timestamp + 100); vm.roll(block.number + 225); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testBalanceAtInFuture(125, 95, 16) {} catch {}
        vm.warp(block.timestamp + 31); vm.roll(block.number + 195); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollectableAfterSplit(223) {} catch {}
        vm.warp(block.timestamp + 94); vm.roll(block.number + 131); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeWithDefaultHistory(7, 117) {} catch {}
        vm.warp(block.timestamp + 71); vm.roll(block.number + 28286);
        vm.warp(block.timestamp + 13); vm.roll(block.number + 11826); vm.prank(address(0x0000000000000000000000000000000000010000)); t.testSqueezableAmountCantBeWithdrawn(14, 89);
    }
    // i-0537465ab58fd927d-echidna-v2.3.2: invariantAccountingVsTokenBalance (61 calls)
    function test_05_invariantAccountingVsTokenBalance() public {
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsViewVsActual(4, 1673155833) {} catch {}
        vm.warp(block.timestamp + 94); vm.roll(block.number + 59981); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setStreamBalanceWithClamping(189, -997) {} catch {}
        vm.warp(block.timestamp + 163); vm.roll(block.number + 5536);
        vm.warp(block.timestamp + 57); vm.roll(block.number + 488); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezableVsReceived(154) {} catch {}
        vm.warp(block.timestamp + 52); vm.roll(block.number + 35679); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSplittableAfterSplit(222) {} catch {}
        vm.warp(block.timestamp + 32); vm.roll(block.number + 198); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSplitViewVsActual(12) {} catch {}
        vm.warp(block.timestamp + 2); vm.roll(block.number + 58820); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setStreamBalanceWithClamping(118, 149355793278188546814149926053489904067) {} catch {}
        vm.warp(block.timestamp + 38); vm.roll(block.number + 9966); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.receiveStreamsSplitAndCollectToSelf(209) {} catch {}
        vm.warp(block.timestamp + 32); vm.roll(block.number + 202); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeTwice(20, 72, 224, bytes32(0x8d3aba6fa12f1fb48b328fab3e43feb5b7460fcc7f833a8026f20f284a9e9d0d)) {} catch {}
        vm.warp(block.timestamp + 67); vm.roll(block.number + 11905);
        vm.warp(block.timestamp + 5); vm.roll(block.number + 104); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testCollectShouldNotRevert(141, 66) {} catch {}
        vm.warp(block.timestamp + 65); vm.roll(block.number + 226); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamsWithClamping(115, 207, 1050038879798602300948325288044166836914262194427, 4294967292, 8, -99999999999999999999999999999999998) {} catch {}
        vm.warp(block.timestamp + 64); vm.roll(block.number + 5021); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantSumAmtDeltaIsZero(103) {} catch {}
        vm.warp(block.timestamp + 74); vm.roll(block.number + 4002);
        vm.warp(block.timestamp + 37); vm.roll(block.number + 30); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezableVsReceived(198) {} catch {}
        vm.warp(block.timestamp + 57); vm.roll(block.number + 56421); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetSplitsShouldNotRevert(48, 203, 4294967291) {} catch {}
        vm.warp(block.timestamp + 55); vm.roll(block.number + 16962); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setStreams(88, 94, 1164156642078488712317830580970744768194138934324, 2918427228, 3532903227, 23) {} catch {}
        vm.warp(block.timestamp + 220); vm.roll(block.number + 72222);
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.receiveStreams(246, 2204477597) {} catch {}
        vm.warp(block.timestamp + 30); vm.roll(block.number + 5054);
        vm.warp(block.timestamp + 50); vm.roll(block.number + 30039); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addSplitsReceiver(201, 38, 190) {} catch {}
        vm.warp(block.timestamp + 68); vm.roll(block.number + 32737); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezableAmountCantBeWithdrawn(3, 16) {} catch {}
        vm.warp(block.timestamp + 12); vm.roll(block.number + 53349); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testGiveShouldNotRevert(192, 9, 17) {} catch {}
        vm.warp(block.timestamp + 30); vm.roll(block.number + 10); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetSplitsShouldNotRevert(16, 93, 999999998) {} catch {}
        vm.warp(block.timestamp + 68); vm.roll(block.number + 486); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testCollectableAfterSplit(21) {} catch {}
        vm.warp(block.timestamp + 40); vm.roll(block.number + 93); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsViewVsActual(116, 4294967294) {} catch {}
        vm.warp(block.timestamp + 52); vm.roll(block.number + 15); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsViewVsActual(1, 2407215371) {} catch {}
        vm.warp(block.timestamp + 11); vm.roll(block.number + 33203); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.receiveStreamsAllCycles(206) {} catch {}
        vm.warp(block.timestamp + 38); vm.roll(block.number + 1849);
        vm.warp(block.timestamp + 63); vm.roll(block.number + 32728); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 56); vm.roll(block.number + 7323); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewConsistency(195, 1211860217) {} catch {}
        vm.warp(block.timestamp + 72); vm.roll(block.number + 1177); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testRemoveStreamShouldNotRevert(94, 103078299847637418168265759910757024076799819106424293642975003886246892080291) {} catch {}
        vm.warp(block.timestamp + 18); vm.roll(block.number + 29919); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.collect(10, 189) {} catch {}
        vm.warp(block.timestamp + 36); vm.roll(block.number + 53562); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.receiveStreamsSplitAndCollectToSelf(5) {} catch {}
        vm.warp(block.timestamp + 65); vm.roll(block.number + 47561); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testAddSplitsShouldNotRevert(5, 221, 1435756841) {} catch {}
        vm.warp(block.timestamp + 87); vm.roll(block.number + 4539); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsViewVsActual(97, 1886510257) {} catch {}
        vm.warp(block.timestamp + 8); vm.roll(block.number + 30784); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezableAmountCantBeUndone(24, 194, 1000000000000000000000000002, 432902765, 2518004110, -160) {} catch {}
        vm.warp(block.timestamp + 42); vm.roll(block.number + 1553); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setStreamBalance(128, -65) {} catch {}
        vm.warp(block.timestamp + 36); vm.roll(block.number + 261); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.receiveStreamsAllCycles(109) {} catch {}
        vm.warp(block.timestamp + 28); vm.roll(block.number + 19014);
        vm.warp(block.timestamp + 49); vm.roll(block.number + 32737); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiversReceivedSplit(92) {} catch {}
        vm.warp(block.timestamp + 93); vm.roll(block.number + 37399); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setSplits(64, 245, 443595) {} catch {}
        vm.warp(block.timestamp + 68); vm.roll(block.number + 60407); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setMaxEndHints(1524787407, 3521371012) {} catch {}
        vm.warp(block.timestamp + 10); vm.roll(block.number + 5054); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollect(38, 238) {} catch {}
        vm.warp(block.timestamp + 81); vm.roll(block.number + 24023); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeAllSenders(189) {} catch {}
        vm.warp(block.timestamp + 13); vm.roll(block.number + 4866); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testCollectableAfterSplit(159) {} catch {}
        vm.warp(block.timestamp + 39); vm.roll(block.number + 60326); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiversReceivedSplit(251) {} catch {}
        vm.warp(block.timestamp + 17); vm.roll(block.number + 30256); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 79); vm.roll(block.number + 4978);
        vm.warp(block.timestamp + 87); vm.roll(block.number + 60220); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalanceWithdrawAll(30) {} catch {}
        vm.warp(block.timestamp + 25); vm.roll(block.number + 193); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeViewVsActual(25, 35) {} catch {}
        vm.warp(block.timestamp + 5); vm.roll(block.number + 1540); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.receiveStreamsSplitAndCollectToSelf(53) {} catch {}
        vm.warp(block.timestamp + 47); vm.roll(block.number + 60456);
        vm.warp(block.timestamp + 90); vm.roll(block.number + 17853); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezableAmountCantBeUndone(190, 2, 214687872935116096541722162182770863967778041467, 801174632, 4294967291, 162) {} catch {}
        vm.warp(block.timestamp + 35); vm.roll(block.number + 31921); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsViewConsistency(13, 1524788960) {} catch {}
        vm.warp(block.timestamp + 75); vm.roll(block.number + 29829); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantWithdrawAllTokens() {} catch {}
        vm.warp(block.timestamp + 80); vm.roll(block.number + 37101); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamsShouldNotRevert(11, 93, 1181266160711058606512609619856093522144484474647, 1524787808, 2834834054, 115312592467326185339350703766592892761) {} catch {}
        vm.warp(block.timestamp + 94); vm.roll(block.number + 4866);
        vm.warp(block.timestamp + 19); vm.roll(block.number + 23018); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addStreamImmediatelySqueezable(131, 224, 251467907598327396075966154293825864935457782550) {} catch {}
        vm.warp(block.timestamp + 87); vm.roll(block.number + 1812);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 4995); vm.prank(address(0x0000000000000000000000000000000000030000)); t.invariantAccountingVsTokenBalance();
    }
    // i-0537465ab58fd927d-echidna-v2.3.2: testSqueezeWithDefaultHistoryShouldNotRevert (68 calls)
    function test_06_testSqueezeWithDefaultHistoryShouldNotRevert() public {
        vm.warp(block.timestamp + 53); vm.roll(block.number + 3458); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueeze(131, 190) {} catch {}
        vm.warp(block.timestamp + 48); vm.roll(block.number + 3578); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testBalanceAtInFuture(147, 4, 20) {} catch {}
        vm.warp(block.timestamp + 9); vm.roll(block.number + 914); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantWithdrawShouldAlwaysFail(126) {} catch {}
        vm.warp(block.timestamp + 59); vm.roll(block.number + 2773);
        vm.warp(block.timestamp + 15); vm.roll(block.number + 47402); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.receiveStreams(135, 583602458) {} catch {}
        vm.warp(block.timestamp + 6); vm.roll(block.number + 540); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeWithFullyHashedHistory(192, 0) {} catch {}
        vm.warp(block.timestamp + 35); vm.roll(block.number + 51781); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addStreamImmediatelySqueezable(4, 198, 1333335921505410925443025963741079439223527649530) {} catch {}
        vm.warp(block.timestamp + 64); vm.roll(block.number + 1177); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetStreamBalanceShouldNotRevert(18, -100000000000000000000000000000000003) {} catch {}
        vm.warp(block.timestamp + 31); vm.roll(block.number + 123); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetSplitsShouldNotRevert(237, 10, 1524786927) {} catch {}
        vm.warp(block.timestamp + 59); vm.roll(block.number + 1718); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezableVsReceived(21) {} catch {}
        vm.warp(block.timestamp + 20); vm.roll(block.number + 2326);
        vm.warp(block.timestamp + 92); vm.roll(block.number + 19725); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueeze(224, 193) {} catch {}
        vm.warp(block.timestamp + 10); vm.roll(block.number + 4023); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollect(162, 120) {} catch {}
        vm.warp(block.timestamp + 187); vm.roll(block.number + 40839);
        vm.warp(block.timestamp + 72); vm.roll(block.number + 18239); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 69); vm.roll(block.number + 976); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantSumAmtDeltaIsZero(7) {} catch {}
        vm.warp(block.timestamp + 79); vm.roll(block.number + 41299); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantWithdrawAllTokens() {} catch {}
        vm.warp(block.timestamp + 54); vm.roll(block.number + 32165); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetSplitsShouldNotRevert(100, 34, 715423339) {} catch {}
        vm.warp(block.timestamp + 52); vm.roll(block.number + 45881); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 63); vm.roll(block.number + 1337); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezableAmountCantBeWithdrawn(167, 169) {} catch {}
        vm.warp(block.timestamp + 68); vm.roll(block.number + 8766); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewConsistency(39, 1524787527) {} catch {}
        vm.warp(block.timestamp + 18); vm.roll(block.number + 1907); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeAllSenders(243) {} catch {}
        vm.warp(block.timestamp + 89); vm.roll(block.number + 39786); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantWithdrawAllTokens() {} catch {}
        vm.warp(block.timestamp + 80); vm.roll(block.number + 3850); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsViewVsActual(157, 4185493434) {} catch {}
        vm.warp(block.timestamp + 3); vm.roll(block.number + 34215); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeWithFuzzedHistoryShouldNotRevert(226, 93, 1377313539700544014878546503823312252677819897288327168, bytes32(0x7ad0a0c5ff156c00b854871cfeff4e9eae5141c599880962d53b71abab2b7777)) {} catch {}
        vm.warp(block.timestamp + 74); vm.roll(block.number + 46906); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamsWithClamping(99, 195, 1448152390752487947457271975786452651647230269215, 193, 0, 4) {} catch {}
        vm.warp(block.timestamp + 76); vm.roll(block.number + 1874); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamBalanceWithdrawAllShouldNotRevert(4) {} catch {}
        vm.warp(block.timestamp + 79); vm.roll(block.number + 2016); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addStreamWithClamping(193, 12, 145191784283701673487895561377121000790351633938, 1524787599, 2446137942, 24773249445363348630042508569304063181) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 2045); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeAllSenders(195) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 3349); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testCollectShouldNotRevert(192, 22) {} catch {}
        vm.warp(block.timestamp + 95); vm.roll(block.number + 40429); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testRemoveStreamShouldNotRevert(1, 48647944481765291756727091782914889278029793228784687383582162344135122147295) {} catch {}
        vm.warp(block.timestamp + 57); vm.roll(block.number + 27344); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSplitShouldNotRevert(30) {} catch {}
        vm.warp(block.timestamp + 54); vm.roll(block.number + 3156);
        vm.warp(block.timestamp + 42); vm.roll(block.number + 40840); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.splitAndCollectToSelf(94) {} catch {}
        vm.warp(block.timestamp + 36); vm.roll(block.number + 49629); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.receiveStreamsAllCycles(117) {} catch {}
        vm.warp(block.timestamp + 48); vm.roll(block.number + 29307); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplitShouldNotRevert(202) {} catch {}
        vm.warp(block.timestamp + 31); vm.roll(block.number + 55778); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testRemoveStreamShouldNotRevert(252, 75514907444294122096649404107390567659731142009946112) {} catch {}
        vm.warp(block.timestamp + 55); vm.roll(block.number + 29327); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.collect(223, 130) {} catch {}
        vm.warp(block.timestamp + 69); vm.roll(block.number + 56103); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.receiveStreams(163, 202) {} catch {}
        vm.warp(block.timestamp + 69); vm.roll(block.number + 29198); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.collectToSelf(22) {} catch {}
        vm.warp(block.timestamp + 106); vm.roll(block.number + 17356);
        vm.warp(block.timestamp + 80); vm.roll(block.number + 4419); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.give(194, 21, 899964527138430593458476133) {} catch {}
        vm.warp(block.timestamp + 67); vm.roll(block.number + 43880); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreams(20, 2024641425) {} catch {}
        vm.warp(block.timestamp + 99); vm.roll(block.number + 53711); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.receiveStreamsAllCycles(23) {} catch {}
        vm.warp(block.timestamp + 16); vm.roll(block.number + 57290);
        vm.warp(block.timestamp + 96); vm.roll(block.number + 1258); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.removeAllSplits(12) {} catch {}
        vm.warp(block.timestamp + 67); vm.roll(block.number + 24931);
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSplitViewVsActual(233) {} catch {}
        vm.warp(block.timestamp + 15); vm.roll(block.number + 13428); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeAllSenders(127) {} catch {}
        vm.warp(block.timestamp + 28); vm.roll(block.number + 7416); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetStreamBalanceShouldNotRevert(33, 169500358367121511528804544756502123157) {} catch {}
        vm.warp(block.timestamp + 47); vm.roll(block.number + 2577);
        vm.warp(block.timestamp + 92); vm.roll(block.number + 48515); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setSplitsWithClamping(163, 103, 1524790175) {} catch {}
        vm.warp(block.timestamp + 87); vm.roll(block.number + 2081);
        vm.warp(block.timestamp + 24); vm.roll(block.number + 723); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 65); vm.roll(block.number + 49078); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeAllSenders(57) {} catch {}
        vm.warp(block.timestamp + 91); vm.roll(block.number + 3352); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeWithFuzzedHistoryShouldNotRevert(58, 19, 18446745235854428259701751808, bytes32(0x9003febc3b81e6478fa38d71ce9139e7d9bf97567a8d5febc785d4ef9ad0c9c7)) {} catch {}
        vm.warp(block.timestamp + 28); vm.roll(block.number + 30909); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addStreamImmediatelySqueezable(157, 227, 929) {} catch {}
        vm.warp(block.timestamp + 73); vm.roll(block.number + 31264);
        vm.warp(block.timestamp + 9); vm.roll(block.number + 32102); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantWithdrawAllTokens() {} catch {}
        vm.warp(block.timestamp + 25); vm.roll(block.number + 8089);
        vm.warp(block.timestamp + 47); vm.roll(block.number + 56269); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeWithDefaultHistory(134, 236) {} catch {}
        vm.warp(block.timestamp + 62); vm.roll(block.number + 51451); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalanceWithdrawAll(102) {} catch {}
        vm.warp(block.timestamp + 35); vm.roll(block.number + 59019); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezableAmountCantBeWithdrawn(131, 79) {} catch {}
        vm.warp(block.timestamp + 62); vm.roll(block.number + 3758); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeWithFuzzedHistory(254, 35, 94458655741938956576231326574602101730242383033588576426059920681597662079734, bytes32(0x961bef1abae8fd2f81eb1c470eebf4cb73886bf7450162e8843c138f609b701d)) {} catch {}
        vm.warp(block.timestamp + 20); vm.roll(block.number + 20860); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addSplitsReceiverWithClamping(21, 134, 1524787714) {} catch {}
        vm.warp(block.timestamp + 49); vm.roll(block.number + 34358); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.collectToSelf(119) {} catch {}
        vm.warp(block.timestamp + 71); vm.roll(block.number + 29351); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setStreams(224, 196, 391748224869209556983378910337357482340993146286, 1062134745, 3839506497, 688394621619027142638370352) {} catch {}
        vm.warp(block.timestamp + 5); vm.roll(block.number + 14620); vm.prank(address(0x0000000000000000000000000000000000040000)); t.testSqueezeWithDefaultHistoryShouldNotRevert(251, 253);
    }
    // i-0537465ab58fd927d-echidna-v2.3.2: testSetStreamsShouldNotRevert (54 calls)
    function test_07_testSetStreamsShouldNotRevert() public {
        vm.warp(block.timestamp + 43); vm.roll(block.number + 22364); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.collect(226, 98) {} catch {}
        vm.warp(block.timestamp + 66); vm.roll(block.number + 36694); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamBalanceWithClamping(228, 982814882332672109686170619) {} catch {}
        vm.warp(block.timestamp + 55); vm.roll(block.number + 18456);
        vm.warp(block.timestamp + 21); vm.roll(block.number + 22354); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.split(225) {} catch {}
        vm.warp(block.timestamp + 43); vm.roll(block.number + 42914); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.splitAndCollectToSelf(160) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 5548); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewConsistency(167, 3467333873) {} catch {}
        vm.warp(block.timestamp + 50); vm.roll(block.number + 49152); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewConsistency(134, 1524787177) {} catch {}
        vm.warp(block.timestamp + 26); vm.roll(block.number + 10026); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 73); vm.roll(block.number + 3072); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 18); vm.roll(block.number + 35642); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addStreamWithClamping(2, 9, 179, 4294967293, 3630281748, 63796879019102360866017089131421958724) {} catch {}
        vm.warp(block.timestamp + 42); vm.roll(block.number + 17556); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamBalance(224, 92849699373635624031835544) {} catch {}
        vm.warp(block.timestamp + 5); vm.roll(block.number + 55640); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithFuzzedHistory(32, 147, 86880973723694896261400538317034935904984942387416755270877317957462141231417, bytes32(0xd77bdeeccdc7491e37833d1eec8fc6acbe511e31f1707f6af0897ac05f9a72be)) {} catch {}
        vm.warp(block.timestamp + 76); vm.roll(block.number + 12488); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setSplits(45, 169, 351) {} catch {}
        vm.warp(block.timestamp + 46); vm.roll(block.number + 39882); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiversReceivedSplit(40) {} catch {}
        vm.warp(block.timestamp + 74); vm.roll(block.number + 22337); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addSplitsReceiverWithClamping(2, 205, 651536367) {} catch {}
        vm.warp(block.timestamp + 53); vm.roll(block.number + 42145); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantAmtPerSecVsMinAmtPerSec(0, 115792089237316195423570985008687907853269984665640564039457584007913129639931) {} catch {}
        vm.warp(block.timestamp + 14); vm.roll(block.number + 8048); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.giveClampedAmount(12, 116, 96653892940176803852883907220738357057) {} catch {}
        vm.warp(block.timestamp + 16); vm.roll(block.number + 54247); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamsShouldNotRevert(158, 161, 326804987815141529165046100715344232662747960891, 1186100482, 0, 641) {} catch {}
        vm.warp(block.timestamp + 61); vm.roll(block.number + 60152); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewVsActual(233, 872039) {} catch {}
        vm.warp(block.timestamp + 35); vm.roll(block.number + 3798);
        vm.warp(block.timestamp + 58); vm.roll(block.number + 32147); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeWithFullyHashedHistory(207, 31) {} catch {}
        vm.warp(block.timestamp + 84); vm.roll(block.number + 15412);
        vm.warp(block.timestamp + 6); vm.roll(block.number + 3714); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.assert_canary_ASSERTION_CANARY(107370295755136217370378808580414917483297937509460323865823822579942924388975) {} catch {}
        vm.warp(block.timestamp + 61); vm.roll(block.number + 29761); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setMaxEndHints(3684336535, 548178511) {} catch {}
        vm.warp(block.timestamp + 65); vm.roll(block.number + 49264); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addStreamImmediatelySqueezable(160, 3, 304975787801851717078415119179375) {} catch {}
        vm.warp(block.timestamp + 2); vm.roll(block.number + 637); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeWithDefaultHistory(157, 147) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 55285);
        vm.warp(block.timestamp + 27); vm.roll(block.number + 9098); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testRemoveStreamShouldNotRevert(0, 56752998122563563340033249809755886711737899813985184458892994833508366609494) {} catch {}
        vm.warp(block.timestamp + 16); vm.roll(block.number + 19667); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeWithFuzzedHistory(248, 74, 11374496320241596966376201, bytes32(0x9370004c7e3bd0cc9092f12d5ec18279acc22f6e330b34a9a9eaeba277b15cab)) {} catch {}
        vm.warp(block.timestamp + 75); vm.roll(block.number + 17386); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiversReceivedSplit(40) {} catch {}
        vm.warp(block.timestamp + 5); vm.roll(block.number + 39790);
        vm.warp(block.timestamp + 63); vm.roll(block.number + 52837); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsViewVsActual(23, 412) {} catch {}
        vm.warp(block.timestamp + 17); vm.roll(block.number + 2636); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.assert_canary_ASSERTION_CANARY(778447145810872556144666219) {} catch {}
        vm.warp(block.timestamp + 76); vm.roll(block.number + 9000);
        vm.warp(block.timestamp + 33); vm.roll(block.number + 22224); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamBalanceWithdrawAll(94) {} catch {}
        vm.warp(block.timestamp + 14); vm.roll(block.number + 42583);
        vm.warp(block.timestamp + 69); vm.roll(block.number + 37387); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeWithFuzzedHistoryShouldNotRevert(33, 15, 35772540817140345152274462021947182885025796762711189328103404640312025708311, bytes32(0x67593d9110c141011396d7c81ab0584518ae0bdf86192764c4aad398a9bc310b)) {} catch {}
        vm.warp(block.timestamp + 59); vm.roll(block.number + 36364); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollectableAfterSplit(35) {} catch {}
        vm.warp(block.timestamp + 65); vm.roll(block.number + 13395); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalanceWithdrawAll(73) {} catch {}
        vm.warp(block.timestamp + 30); vm.roll(block.number + 44668); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testCollectShouldNotRevert(162, 3) {} catch {}
        vm.warp(block.timestamp + 77); vm.roll(block.number + 3409);
        vm.warp(block.timestamp + 34); vm.roll(block.number + 28929); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplittableAfterSplit(103) {} catch {}
        vm.warp(block.timestamp + 60); vm.roll(block.number + 59182);
        vm.warp(block.timestamp + 65); vm.roll(block.number + 16191); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalanceWithdrawAll(8) {} catch {}
        vm.warp(block.timestamp + 70); vm.roll(block.number + 11171);
        vm.warp(block.timestamp + 38); vm.roll(block.number + 7879); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeAllSenders(217) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 106029);
        vm.warp(block.timestamp + 10); vm.roll(block.number + 43149); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addStream(132, 96, 346888433335392736107106140095529696015040040085, 4294967292, 190, -3999999999999999999999999997) {} catch {}
        vm.warp(block.timestamp + 34); vm.roll(block.number + 59484); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollectShouldNotRevert(47, 228) {} catch {}
        vm.warp(block.timestamp + 68); vm.roll(block.number + 32774);
        vm.warp(block.timestamp + 58); vm.roll(block.number + 20138); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setStreamBalanceWithdrawAll(177) {} catch {}
        vm.warp(block.timestamp + 197); vm.roll(block.number + 65029);
        vm.warp(block.timestamp + 97); vm.roll(block.number + 14392); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeAllSenders(147) {} catch {}
        vm.warp(block.timestamp + 66); vm.roll(block.number + 19873); vm.prank(address(0x0000000000000000000000000000000000030000)); t.testSetStreamsShouldNotRevert(233, 1, 128, 2674762467, 2843616477, -487372965421807689925761360);
    }
    // i-0537465ab58fd927d-echidna-v2.3.2: testSqueezableAmountCantBeUndone (37 calls)
    function test_08_testSqueezableAmountCantBeUndone() public {
        vm.warp(block.timestamp + 24); vm.roll(block.number + 27678); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testGiveShouldNotRevert(125, 191, 0) {} catch {}
        vm.warp(block.timestamp + 22); vm.roll(block.number + 4023); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantWithdrawAllTokens() {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 23653); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setMaxEndHints(255692671, 192) {} catch {}
        vm.warp(block.timestamp + 93); vm.roll(block.number + 126); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.addStream(197, 248, 215141561835468453992908416604764544819582173103, 4294967292, 999999999, 63) {} catch {}
        vm.warp(block.timestamp + 67); vm.roll(block.number + 59981); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamsShouldNotRevert(80, 51, 997516148459469739008436226581102805815456264272, 2221450887, 4, 157392886079650657839109154810244433295) {} catch {}
        vm.warp(block.timestamp + 12); vm.roll(block.number + 221); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantAmtPerSecVsMinAmtPerSec(234, 33048860383849004559742813297059419343339852917517107368639918720169455489346) {} catch {}
        vm.warp(block.timestamp + 70); vm.roll(block.number + 4925); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 32); vm.roll(block.number + 60364); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.invariantAmtPerSecVsMinAmtPerSec(247, 69774633687910042698893957307472681941805344923946572333723745360609234096399) {} catch {}
        vm.warp(block.timestamp + 27); vm.roll(block.number + 42229); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 89); vm.roll(block.number + 4223); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreamsViewVsActual(202, 4294967291) {} catch {}
        vm.warp(block.timestamp + 21); vm.roll(block.number + 42099); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamsWithClamping(124, 89, 498081748775292187297444627467127217590169483071, 999, 94, -1000000003) {} catch {}
        vm.warp(block.timestamp + 24); vm.roll(block.number + 4990); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsShouldNotRevert(200) {} catch {}
        vm.warp(block.timestamp + 63); vm.roll(block.number + 1023); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addStreamImmediatelySqueezable(94, 11, 647093568106404093671335300802993419789920765746) {} catch {}
        vm.warp(block.timestamp + 39); vm.roll(block.number + 2512); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiversReceivedSplit(189) {} catch {}
        vm.warp(block.timestamp + 70); vm.roll(block.number + 5014);
        vm.warp(block.timestamp + 73); vm.roll(block.number + 4536); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezableVsReceived(191) {} catch {}
        vm.warp(block.timestamp + 45); vm.roll(block.number + 50499); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.addSplitsReceiverWithClamping(67, 17, 197) {} catch {}
        vm.warp(block.timestamp + 16); vm.roll(block.number + 194); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.assert_canary_ASSERTION_CANARY(81955473079516046949633743016697847541294818689821282749996681496272635257089) {} catch {}
        vm.warp(block.timestamp + 65); vm.roll(block.number + 60054); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testCollectableAfterSplit(61) {} catch {}
        vm.warp(block.timestamp + 7); vm.roll(block.number + 800); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testAddStreamShouldNotRevert(252, 21, 4369999, 3171357299, 3540748542, 1000000000000000000000000003) {} catch {}
        vm.warp(block.timestamp + 37); vm.roll(block.number + 1003); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsShouldNotRevert(157) {} catch {}
        vm.warp(block.timestamp + 61); vm.roll(block.number + 41489); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezableAmountCantBeWithdrawn(189, 98) {} catch {}
        vm.warp(block.timestamp + 26); vm.roll(block.number + 23489); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamsWithClamping(96, 127, 198, 998, 2008016959, 4) {} catch {}
        vm.warp(block.timestamp + 64); vm.roll(block.number + 4002); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantAmtPerSecVsMinAmtPerSec(244, 25680216575950851252930829591270958522928965157796906524824697215628978571483) {} catch {}
        vm.warp(block.timestamp + 55); vm.roll(block.number + 58358); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 91); vm.roll(block.number + 5015); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addStreamImmediatelySqueezable(251, 251, 0) {} catch {}
        vm.warp(block.timestamp + 69); vm.roll(block.number + 15979); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.removeAllSplits(123) {} catch {}
        vm.warp(block.timestamp + 60); vm.roll(block.number + 5013); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.assert_canary_ASSERTION_CANARY(115792089237316195423570985008687907853269984665640564039457584007913129639924) {} catch {}
        vm.warp(block.timestamp + 33); vm.roll(block.number + 15980); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testAddStreamShouldNotRevert(253, 8, 16060879844752, 1000002, 287, 107998544789017057153838128078242704753) {} catch {}
        vm.warp(block.timestamp + 34); vm.roll(block.number + 104); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeViewVsActual(214, 17) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setMaxEndHints(2956727791, 1135740001) {} catch {}
        vm.warp(block.timestamp + 50); vm.roll(block.number + 50499); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testAddStreamShouldNotRevert(254, 128, 1461501637330902918203684832716283019655932542972, 187593451, 2639632943, 63179206354378586594643987115501438404) {} catch {}
        vm.warp(block.timestamp + 2); vm.roll(block.number + 23406); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSplittableAfterSplit(128) {} catch {}
        vm.warp(block.timestamp + 60); vm.roll(block.number + 15977);
        vm.warp(block.timestamp + 69); vm.roll(block.number + 12338); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.removeAllSplits(13) {} catch {}
        vm.warp(block.timestamp + 50); vm.roll(block.number + 1021); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeToSelf(0) {} catch {}
        vm.warp(block.timestamp + 89); vm.roll(block.number + 4959); vm.prank(address(0x0000000000000000000000000000000000020000)); t.testSqueezableAmountCantBeUndone(40, 10, 90821760868741385387303228013753115699236614447, 95, 3990876465, 125);
    }
    // i-0537465ab58fd927d-echidna-v2.3.2: testReceiveStreamsShouldNotRevert (61 calls)
    function test_09_testReceiveStreamsShouldNotRevert() public {
        vm.warp(block.timestamp + 66); vm.roll(block.number + 36694); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamBalanceWithClamping(228, 982814882332672109686170619) {} catch {}
        vm.warp(block.timestamp + 55); vm.roll(block.number + 18456);
        vm.warp(block.timestamp + 21); vm.roll(block.number + 22354); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.split(225) {} catch {}
        vm.warp(block.timestamp + 43); vm.roll(block.number + 42914); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.splitAndCollectToSelf(160) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 5548); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewConsistency(167, 3467333873) {} catch {}
        vm.warp(block.timestamp + 50); vm.roll(block.number + 49152); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewConsistency(134, 1524787177) {} catch {}
        vm.warp(block.timestamp + 26); vm.roll(block.number + 10026); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 73); vm.roll(block.number + 3072); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 18); vm.roll(block.number + 35642); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addStreamWithClamping(2, 9, 179, 4294967293, 3630281748, 63796879019102360866017089131421958724) {} catch {}
        vm.warp(block.timestamp + 42); vm.roll(block.number + 17556); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamBalance(224, 92849699373635624031835544) {} catch {}
        vm.warp(block.timestamp + 5); vm.roll(block.number + 55640); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithFuzzedHistory(32, 147, 86880973723694896261400538317034935904984942387416755270877317957462141231417, bytes32(0xd77bdeeccdc7491e37833d1eec8fc6acbe511e31f1707f6af0897ac05f9a72be)) {} catch {}
        vm.warp(block.timestamp + 76); vm.roll(block.number + 12488); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setSplits(45, 169, 351) {} catch {}
        vm.warp(block.timestamp + 46); vm.roll(block.number + 39882); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiversReceivedSplit(40) {} catch {}
        vm.warp(block.timestamp + 74); vm.roll(block.number + 22337); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addSplitsReceiverWithClamping(2, 205, 651536367) {} catch {}
        vm.warp(block.timestamp + 53); vm.roll(block.number + 42145); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantAmtPerSecVsMinAmtPerSec(0, 115792089237316195423570985008687907853269984665640564039457584007913129639931) {} catch {}
        vm.warp(block.timestamp + 14); vm.roll(block.number + 8048); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.giveClampedAmount(12, 116, 96653892940176803852883907220738357057) {} catch {}
        vm.warp(block.timestamp + 16); vm.roll(block.number + 54247); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamsShouldNotRevert(158, 161, 326804987815141529165046100715344232662747960891, 1186100482, 0, 641) {} catch {}
        vm.warp(block.timestamp + 61); vm.roll(block.number + 60152); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewVsActual(233, 872039) {} catch {}
        vm.warp(block.timestamp + 35); vm.roll(block.number + 3798);
        vm.warp(block.timestamp + 58); vm.roll(block.number + 32147); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeWithFullyHashedHistory(207, 31) {} catch {}
        vm.warp(block.timestamp + 84); vm.roll(block.number + 15412);
        vm.warp(block.timestamp + 6); vm.roll(block.number + 3714); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.assert_canary_ASSERTION_CANARY(107370295755136217370378808580414917483297937509460323865823822579942924388975) {} catch {}
        vm.warp(block.timestamp + 61); vm.roll(block.number + 29761); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setMaxEndHints(3684336535, 548178511) {} catch {}
        vm.warp(block.timestamp + 65); vm.roll(block.number + 49264); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addStreamImmediatelySqueezable(160, 3, 304975787801851717078415119179375) {} catch {}
        vm.warp(block.timestamp + 2); vm.roll(block.number + 637); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeWithDefaultHistory(157, 147) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 55285);
        vm.warp(block.timestamp + 27); vm.roll(block.number + 9098); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testRemoveStreamShouldNotRevert(0, 56752998122563563340033249809755886711737899813985184458892994833508366609494) {} catch {}
        vm.warp(block.timestamp + 16); vm.roll(block.number + 19667); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeWithFuzzedHistory(248, 74, 11374496320241596966376201, bytes32(0x9370004c7e3bd0cc9092f12d5ec18279acc22f6e330b34a9a9eaeba277b15cab)) {} catch {}
        vm.warp(block.timestamp + 75); vm.roll(block.number + 17386); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiversReceivedSplit(40) {} catch {}
        vm.warp(block.timestamp + 5); vm.roll(block.number + 39790);
        vm.warp(block.timestamp + 63); vm.roll(block.number + 52837); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsViewVsActual(23, 412) {} catch {}
        vm.warp(block.timestamp + 17); vm.roll(block.number + 2636); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.assert_canary_ASSERTION_CANARY(778447145810872556144666219) {} catch {}
        vm.warp(block.timestamp + 76); vm.roll(block.number + 9000);
        vm.warp(block.timestamp + 33); vm.roll(block.number + 22224); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamBalanceWithdrawAll(94) {} catch {}
        vm.warp(block.timestamp + 99); vm.roll(block.number + 2701); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeWithFullyHashedHistory(6, 254) {} catch {}
        vm.warp(block.timestamp + 76); vm.roll(block.number + 8587); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(229) {} catch {}
        vm.warp(block.timestamp + 54); vm.roll(block.number + 31684); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSplittableAfterSplit(253) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 53293); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetSplitsShouldNotRevert(20, 252, 3285384265) {} catch {}
        vm.warp(block.timestamp + 41); vm.roll(block.number + 37200);
        vm.warp(block.timestamp + 2); vm.roll(block.number + 29304); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplitViewVsActual(37) {} catch {}
        vm.warp(block.timestamp + 65); vm.roll(block.number + 22103);
        vm.warp(block.timestamp + 56); vm.roll(block.number + 1099); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testCollectableAfterSplit(164) {} catch {}
        vm.warp(block.timestamp + 6); vm.roll(block.number + 38425); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantWithdrawShouldAlwaysFail(73786976294838206465844674450813354629587271743) {} catch {}
        vm.warp(block.timestamp + 35); vm.roll(block.number + 4025); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalanceWithClamping(126, 401995601818429320025181570) {} catch {}
        vm.warp(block.timestamp + 45); vm.roll(block.number + 1009);
        vm.warp(block.timestamp + 100); vm.roll(block.number + 3604); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithDefaultHistory(203, 80) {} catch {}
        vm.warp(block.timestamp + 80); vm.roll(block.number + 44477);
        vm.warp(block.timestamp + 96); vm.roll(block.number + 48342); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeWithDefaultHistory(62, 9) {} catch {}
        vm.warp(block.timestamp + 97); vm.roll(block.number + 3212); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewConsistency(252, 633731166) {} catch {}
        vm.warp(block.timestamp + 97); vm.roll(block.number + 4863); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.addSplitsReceiverWithClamping(116, 153, 1524786857) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 46543); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.receiveStreamsSplitAndCollectToSelf(17) {} catch {}
        vm.warp(block.timestamp + 16); vm.roll(block.number + 12063); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeAllSenders(205) {} catch {}
        vm.warp(block.timestamp + 21); vm.roll(block.number + 22160); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewConsistency(159, 3740745606) {} catch {}
        vm.warp(block.timestamp + 11); vm.roll(block.number + 18590); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSplittableAfterSplit(61) {} catch {}
        vm.warp(block.timestamp + 33); vm.roll(block.number + 5035); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setSplitsWithClamping(0, 193, 1524790006) {} catch {}
        vm.warp(block.timestamp + 23); vm.roll(block.number + 3524); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplitViewVsActual(200) {} catch {}
        vm.warp(block.timestamp + 76); vm.roll(block.number + 48941); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setStreamBalanceWithClamping(5, 39307293850690539476858802296700322372) {} catch {}
        vm.warp(block.timestamp + 77); vm.roll(block.number + 35228);
        vm.warp(block.timestamp + 77); vm.roll(block.number + 45888); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.receiveStreamsAllCycles(6) {} catch {}
        vm.warp(block.timestamp + 7); vm.roll(block.number + 12091); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetStreamBalanceWithdrawAllShouldNotRevert(107) {} catch {}
        vm.warp(block.timestamp + 83); vm.roll(block.number + 49455); vm.prank(address(0x0000000000000000000000000000000000010000)); t.testReceiveStreamsShouldNotRevert(161);
    }
    // i-0537465ab58fd927d-echidna-v2.3.2: testSetStreamBalanceShouldNotRevert (66 calls)
    function test_10_testSetStreamBalanceShouldNotRevert() public {
        vm.warp(block.timestamp + 43); vm.roll(block.number + 22364); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.collect(226, 98) {} catch {}
        vm.warp(block.timestamp + 66); vm.roll(block.number + 36694); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamBalanceWithClamping(228, 982814882332672109686170619) {} catch {}
        vm.warp(block.timestamp + 55); vm.roll(block.number + 18456);
        vm.warp(block.timestamp + 21); vm.roll(block.number + 22354); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.split(225) {} catch {}
        vm.warp(block.timestamp + 43); vm.roll(block.number + 42914); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.splitAndCollectToSelf(160) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 5548); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewConsistency(167, 3467333873) {} catch {}
        vm.warp(block.timestamp + 50); vm.roll(block.number + 49152); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewConsistency(134, 1524787177) {} catch {}
        vm.warp(block.timestamp + 26); vm.roll(block.number + 10026); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 73); vm.roll(block.number + 3072); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 18); vm.roll(block.number + 35642); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addStreamWithClamping(2, 9, 179, 4294967293, 3630281748, 63796879019102360866017089131421958724) {} catch {}
        vm.warp(block.timestamp + 42); vm.roll(block.number + 17556); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamBalance(224, 92849699373635624031835544) {} catch {}
        vm.warp(block.timestamp + 5); vm.roll(block.number + 55640); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithFuzzedHistory(32, 147, 86880973723694896261400538317034935904984942387416755270877317957462141231417, bytes32(0xd77bdeeccdc7491e37833d1eec8fc6acbe511e31f1707f6af0897ac05f9a72be)) {} catch {}
        vm.warp(block.timestamp + 76); vm.roll(block.number + 12488); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setSplits(45, 169, 351) {} catch {}
        vm.warp(block.timestamp + 46); vm.roll(block.number + 39882); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiversReceivedSplit(40) {} catch {}
        vm.warp(block.timestamp + 74); vm.roll(block.number + 22337); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addSplitsReceiverWithClamping(2, 205, 651536367) {} catch {}
        vm.warp(block.timestamp + 53); vm.roll(block.number + 42145); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantAmtPerSecVsMinAmtPerSec(0, 115792089237316195423570985008687907853269984665640564039457584007913129639931) {} catch {}
        vm.warp(block.timestamp + 14); vm.roll(block.number + 8048); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.giveClampedAmount(12, 116, 96653892940176803852883907220738357057) {} catch {}
        vm.warp(block.timestamp + 16); vm.roll(block.number + 54247); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamsShouldNotRevert(158, 161, 326804987815141529165046100715344232662747960891, 1186100482, 0, 641) {} catch {}
        vm.warp(block.timestamp + 61); vm.roll(block.number + 60152); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewVsActual(233, 872039) {} catch {}
        vm.warp(block.timestamp + 35); vm.roll(block.number + 3798);
        vm.warp(block.timestamp + 58); vm.roll(block.number + 32147); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeWithFullyHashedHistory(207, 31) {} catch {}
        vm.warp(block.timestamp + 84); vm.roll(block.number + 15412);
        vm.warp(block.timestamp + 6); vm.roll(block.number + 3714); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.assert_canary_ASSERTION_CANARY(107370295755136217370378808580414917483297937509460323865823822579942924388975) {} catch {}
        vm.warp(block.timestamp + 61); vm.roll(block.number + 29761); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setMaxEndHints(3684336535, 548178511) {} catch {}
        vm.warp(block.timestamp + 65); vm.roll(block.number + 49264); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addStreamImmediatelySqueezable(160, 3, 304975787801851717078415119179375) {} catch {}
        vm.warp(block.timestamp + 2); vm.roll(block.number + 637); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeWithDefaultHistory(157, 147) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 55285);
        vm.warp(block.timestamp + 27); vm.roll(block.number + 9098); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testRemoveStreamShouldNotRevert(0, 56752998122563563340033249809755886711737899813985184458892994833508366609494) {} catch {}
        vm.warp(block.timestamp + 16); vm.roll(block.number + 19667); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeWithFuzzedHistory(248, 74, 11374496320241596966376201, bytes32(0x9370004c7e3bd0cc9092f12d5ec18279acc22f6e330b34a9a9eaeba277b15cab)) {} catch {}
        vm.warp(block.timestamp + 75); vm.roll(block.number + 17386); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiversReceivedSplit(40) {} catch {}
        vm.warp(block.timestamp + 5); vm.roll(block.number + 39790);
        vm.warp(block.timestamp + 63); vm.roll(block.number + 52837); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsViewVsActual(23, 412) {} catch {}
        vm.warp(block.timestamp + 17); vm.roll(block.number + 2636); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.assert_canary_ASSERTION_CANARY(778447145810872556144666219) {} catch {}
        vm.warp(block.timestamp + 76); vm.roll(block.number + 9000);
        vm.warp(block.timestamp + 33); vm.roll(block.number + 22224); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamBalanceWithdrawAll(94) {} catch {}
        vm.warp(block.timestamp + 99); vm.roll(block.number + 2701); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeWithFullyHashedHistory(6, 254) {} catch {}
        vm.warp(block.timestamp + 76); vm.roll(block.number + 8587); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(229) {} catch {}
        vm.warp(block.timestamp + 54); vm.roll(block.number + 31684); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSplittableAfterSplit(253) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 53293); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetSplitsShouldNotRevert(20, 252, 3285384265) {} catch {}
        vm.warp(block.timestamp + 86); vm.roll(block.number + 7972);
        vm.warp(block.timestamp + 73); vm.roll(block.number + 16166); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeWithFullyHashedHistory(52, 223) {} catch {}
        vm.warp(block.timestamp + 34); vm.roll(block.number + 1284);
        vm.warp(block.timestamp + 75); vm.roll(block.number + 8391); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.removeAllSplits(48) {} catch {}
        vm.warp(block.timestamp + 74); vm.roll(block.number + 52005); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.collectToSelf(184) {} catch {}
        vm.warp(block.timestamp + 93); vm.roll(block.number + 5975);
        vm.warp(block.timestamp + 64); vm.roll(block.number + 22231); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.removeAllSplits(223) {} catch {}
        vm.warp(block.timestamp + 115); vm.roll(block.number + 21149);
        vm.warp(block.timestamp + 44); vm.roll(block.number + 472); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeToSelf(127) {} catch {}
        vm.warp(block.timestamp + 69); vm.roll(block.number + 30255);
        vm.warp(block.timestamp + 54); vm.roll(block.number + 43879); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplitShouldNotRevert(62) {} catch {}
        vm.warp(block.timestamp + 59); vm.roll(block.number + 46764); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testGiveShouldNotRevert(189, 189, 794) {} catch {}
        vm.warp(block.timestamp + 35); vm.roll(block.number + 25065); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addStreamImmediatelySqueezable(193, 105, 1000000000000000000000000000) {} catch {}
        vm.warp(block.timestamp + 96); vm.roll(block.number + 58823); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addStreamWithClamping(202, 95, 65, 4130394783, 4294967293, 283024493009457085593135978) {} catch {}
        vm.warp(block.timestamp + 62); vm.roll(block.number + 1349); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeViewVsActual(105, 179) {} catch {}
        vm.warp(block.timestamp + 80); vm.roll(block.number + 41010); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeWithFullyHashedHistory(13, 44) {} catch {}
        vm.warp(block.timestamp + 174); vm.roll(block.number + 66489);
        vm.warp(block.timestamp + 30); vm.roll(block.number + 86); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setMaxEndHints(410998035, 789656) {} catch {}
        vm.warp(block.timestamp + 13); vm.roll(block.number + 52759);
        vm.warp(block.timestamp + 55); vm.roll(block.number + 384); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezableAmountCantBeWithdrawn(171, 194) {} catch {}
        vm.warp(block.timestamp + 73); vm.roll(block.number + 30270); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezableAmountCantBeWithdrawn(138, 73) {} catch {}
        vm.warp(block.timestamp + 10); vm.roll(block.number + 280);
        vm.warp(block.timestamp + 20); vm.roll(block.number + 111); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollectableAfterSplit(6) {} catch {}
        vm.warp(block.timestamp + 83); vm.roll(block.number + 25075);
        vm.warp(block.timestamp + 93); vm.roll(block.number + 3153); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeWithFuzzedHistoryShouldNotRevert(222, 161, 31731268950650357907088196711285070089391831132034542239818580748888809727113, bytes32(0x283e7bdf0a309bf82f238efbbc73d0989d72ad0a99e8118dfa5b42594b062ab1)) {} catch {}
        vm.warp(block.timestamp + 93); vm.roll(block.number + 10524); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.collect(0, 29) {} catch {}
        vm.warp(block.timestamp + 91); vm.roll(block.number + 20054); vm.prank(address(0x0000000000000000000000000000000000040000)); t.testSetStreamBalanceShouldNotRevert(16, -643633712201443525257260133);
    }
    // i-0537465ab58fd927d-echidna-v2.3.2: testAddStreamShouldNotRevert (77 calls)
    function test_11_testAddStreamShouldNotRevert() public {
        vm.warp(block.timestamp + 43); vm.roll(block.number + 22364); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.collect(226, 98) {} catch {}
        vm.warp(block.timestamp + 66); vm.roll(block.number + 36694); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamBalanceWithClamping(228, 982814882332672109686170619) {} catch {}
        vm.warp(block.timestamp + 55); vm.roll(block.number + 18456);
        vm.warp(block.timestamp + 21); vm.roll(block.number + 22354); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.split(225) {} catch {}
        vm.warp(block.timestamp + 43); vm.roll(block.number + 42914); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.splitAndCollectToSelf(160) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 5548); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewConsistency(167, 3467333873) {} catch {}
        vm.warp(block.timestamp + 50); vm.roll(block.number + 49152); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewConsistency(134, 1524787177) {} catch {}
        vm.warp(block.timestamp + 26); vm.roll(block.number + 10026); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 73); vm.roll(block.number + 3072); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 18); vm.roll(block.number + 35642); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addStreamWithClamping(2, 9, 179, 4294967293, 3630281748, 63796879019102360866017089131421958724) {} catch {}
        vm.warp(block.timestamp + 42); vm.roll(block.number + 17556); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamBalance(224, 92849699373635624031835544) {} catch {}
        vm.warp(block.timestamp + 5); vm.roll(block.number + 55640); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithFuzzedHistory(32, 147, 86880973723694896261400538317034935904984942387416755270877317957462141231417, bytes32(0xd77bdeeccdc7491e37833d1eec8fc6acbe511e31f1707f6af0897ac05f9a72be)) {} catch {}
        vm.warp(block.timestamp + 76); vm.roll(block.number + 12488); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setSplits(45, 169, 351) {} catch {}
        vm.warp(block.timestamp + 46); vm.roll(block.number + 39882); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiversReceivedSplit(40) {} catch {}
        vm.warp(block.timestamp + 74); vm.roll(block.number + 22337); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addSplitsReceiverWithClamping(2, 205, 651536367) {} catch {}
        vm.warp(block.timestamp + 53); vm.roll(block.number + 42145); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantAmtPerSecVsMinAmtPerSec(0, 115792089237316195423570985008687907853269984665640564039457584007913129639931) {} catch {}
        vm.warp(block.timestamp + 14); vm.roll(block.number + 8048); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.giveClampedAmount(12, 116, 96653892940176803852883907220738357057) {} catch {}
        vm.warp(block.timestamp + 16); vm.roll(block.number + 54247); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamsShouldNotRevert(158, 161, 326804987815141529165046100715344232662747960891, 1186100482, 0, 641) {} catch {}
        vm.warp(block.timestamp + 61); vm.roll(block.number + 60152); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewVsActual(233, 872039) {} catch {}
        vm.warp(block.timestamp + 35); vm.roll(block.number + 3798);
        vm.warp(block.timestamp + 58); vm.roll(block.number + 32147); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeWithFullyHashedHistory(207, 31) {} catch {}
        vm.warp(block.timestamp + 84); vm.roll(block.number + 15412);
        vm.warp(block.timestamp + 6); vm.roll(block.number + 3714); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.assert_canary_ASSERTION_CANARY(107370295755136217370378808580414917483297937509460323865823822579942924388975) {} catch {}
        vm.warp(block.timestamp + 61); vm.roll(block.number + 29761); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setMaxEndHints(3684336535, 548178511) {} catch {}
        vm.warp(block.timestamp + 65); vm.roll(block.number + 49264); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addStreamImmediatelySqueezable(160, 3, 304975787801851717078415119179375) {} catch {}
        vm.warp(block.timestamp + 2); vm.roll(block.number + 637); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeWithDefaultHistory(157, 147) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 55285);
        vm.warp(block.timestamp + 27); vm.roll(block.number + 9098); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testRemoveStreamShouldNotRevert(0, 56752998122563563340033249809755886711737899813985184458892994833508366609494) {} catch {}
        vm.warp(block.timestamp + 16); vm.roll(block.number + 19667); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeWithFuzzedHistory(248, 74, 11374496320241596966376201, bytes32(0x9370004c7e3bd0cc9092f12d5ec18279acc22f6e330b34a9a9eaeba277b15cab)) {} catch {}
        vm.warp(block.timestamp + 75); vm.roll(block.number + 17386); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiversReceivedSplit(40) {} catch {}
        vm.warp(block.timestamp + 5); vm.roll(block.number + 39790);
        vm.warp(block.timestamp + 63); vm.roll(block.number + 52837); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsViewVsActual(23, 412) {} catch {}
        vm.warp(block.timestamp + 17); vm.roll(block.number + 2636); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.assert_canary_ASSERTION_CANARY(778447145810872556144666219) {} catch {}
        vm.warp(block.timestamp + 76); vm.roll(block.number + 9000);
        vm.warp(block.timestamp + 33); vm.roll(block.number + 22224); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamBalanceWithdrawAll(94) {} catch {}
        vm.warp(block.timestamp + 14); vm.roll(block.number + 42583);
        vm.warp(block.timestamp + 69); vm.roll(block.number + 37387); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeWithFuzzedHistoryShouldNotRevert(33, 15, 35772540817140345152274462021947182885025796762711189328103404640312025708311, bytes32(0x67593d9110c141011396d7c81ab0584518ae0bdf86192764c4aad398a9bc310b)) {} catch {}
        vm.warp(block.timestamp + 59); vm.roll(block.number + 36364); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollectableAfterSplit(35) {} catch {}
        vm.warp(block.timestamp + 65); vm.roll(block.number + 13395); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalanceWithdrawAll(73) {} catch {}
        vm.warp(block.timestamp + 30); vm.roll(block.number + 44668); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testCollectShouldNotRevert(162, 3) {} catch {}
        vm.warp(block.timestamp + 77); vm.roll(block.number + 3409);
        vm.warp(block.timestamp + 34); vm.roll(block.number + 28929); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplittableAfterSplit(103) {} catch {}
        vm.warp(block.timestamp + 60); vm.roll(block.number + 59182);
        vm.warp(block.timestamp + 65); vm.roll(block.number + 16191); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalanceWithdrawAll(8) {} catch {}
        vm.warp(block.timestamp + 70); vm.roll(block.number + 11171);
        vm.warp(block.timestamp + 38); vm.roll(block.number + 7879); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeAllSenders(217) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 106029);
        vm.warp(block.timestamp + 10); vm.roll(block.number + 43149); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addStream(132, 96, 346888433335392736107106140095529696015040040085, 4294967292, 190, -3999999999999999999999999997) {} catch {}
        vm.warp(block.timestamp + 34); vm.roll(block.number + 59484); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollectShouldNotRevert(47, 228) {} catch {}
        vm.warp(block.timestamp + 68); vm.roll(block.number + 32774);
        vm.warp(block.timestamp + 58); vm.roll(block.number + 20138); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setStreamBalanceWithdrawAll(177) {} catch {}
        vm.warp(block.timestamp + 115); vm.roll(block.number + 18447);
        vm.warp(block.timestamp + 73); vm.roll(block.number + 51787); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamsShouldNotRevert(30, 15, 130, 107631, 788901, 75747274898676355006261102103760119218) {} catch {}
        vm.warp(block.timestamp + 84); vm.roll(block.number + 18508); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setStreamBalanceWithClamping(223, 1947336808510461449457361786) {} catch {}
        vm.warp(block.timestamp + 13); vm.roll(block.number + 27504); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeWithFullyHashedHistory(115, 103) {} catch {}
        vm.warp(block.timestamp + 58); vm.roll(block.number + 7058); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeWithFuzzedHistory(131, 135, 115792089237316195423570985008687907853269984665640564039457584007913129639933, bytes32(0x1dbd1519ec7e7915e6071a56e2e769b1eec0d48c9678a9b4e9558b56009626db)) {} catch {}
        vm.warp(block.timestamp + 49); vm.roll(block.number + 1423);
        vm.warp(block.timestamp + 46); vm.roll(block.number + 654); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setSplits(50, 239, 307) {} catch {}
        vm.warp(block.timestamp + 75); vm.roll(block.number + 41169); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testCollect(246, 0) {} catch {}
        vm.warp(block.timestamp + 36); vm.roll(block.number + 42738); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeWithFuzzedHistoryShouldNotRevert(57, 252, 369556353790678297550169284241134086244721412745986137, bytes32(0xd0ef6df634bf8c8cf6be19c9dca2e128b661980ccdf189560a3a7c39435c4095)) {} catch {}
        vm.warp(block.timestamp + 107); vm.roll(block.number + 20569);
        vm.warp(block.timestamp + 2); vm.roll(block.number + 29629); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.removeStream(8, 27622156364856150797123276920703976992512702983328996612912072673374945427941) {} catch {}
        vm.warp(block.timestamp + 94); vm.roll(block.number + 52164); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.assert_canary_ASSERTION_CANARY(58760071742599649964716778859140126134188697052895549852944627306661406926357) {} catch {}
        vm.warp(block.timestamp + 100); vm.roll(block.number + 5189);
        vm.warp(block.timestamp + 67); vm.roll(block.number + 22475); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setSplitsWithClamping(75, 203, 641) {} catch {}
        vm.warp(block.timestamp + 89); vm.roll(block.number + 49629); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeViewVsActual(159, 21) {} catch {}
        vm.warp(block.timestamp + 47); vm.roll(block.number + 4399);
        vm.warp(block.timestamp + 70); vm.roll(block.number + 57283); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(11) {} catch {}
        vm.warp(block.timestamp + 85); vm.roll(block.number + 1367); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetStreamBalance(8, -928578457279304555555595168) {} catch {}
        vm.warp(block.timestamp + 81); vm.roll(block.number + 2486); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testAddStreamShouldNotRevert(9, 29, 191, 4294967293, 1026, 19) {} catch {}
        vm.warp(block.timestamp + 84); vm.roll(block.number + 24939); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.removeAllSplits(171) {} catch {}
        vm.warp(block.timestamp + 41); vm.roll(block.number + 49415); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.removeAllSplits(58) {} catch {}
        vm.warp(block.timestamp + 34); vm.roll(block.number + 30982); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.collect(190, 13) {} catch {}
        vm.warp(block.timestamp + 96); vm.roll(block.number + 51855); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetStreamBalanceWithdrawAllShouldNotRevert(189) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 32367); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.addStreamImmediatelySqueezable(74, 242, 1000001) {} catch {}
        vm.warp(block.timestamp + 12); vm.roll(block.number + 48850); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.collectToSelf(129) {} catch {}
        vm.warp(block.timestamp + 25); vm.roll(block.number + 20096); vm.prank(address(0x0000000000000000000000000000000000040000)); t.testAddStreamShouldNotRevert(252, 127, 243401559601148268191461647044593281259497426926, 2871979295, 788658, -469249459712831158864782195);
    }
    // i-0537465ab58fd927d-echidna-v2.3.2: testSetStreamBalanceWithdrawAllShouldNotRevert (44 calls)
    function test_12_testSetStreamBalanceWithdrawAllShouldNotRevert() public {
        vm.warp(block.timestamp + 43); vm.roll(block.number + 22364); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.collect(226, 98) {} catch {}
        vm.warp(block.timestamp + 66); vm.roll(block.number + 36694); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamBalanceWithClamping(228, 982814882332672109686170619) {} catch {}
        vm.warp(block.timestamp + 55); vm.roll(block.number + 18456);
        vm.warp(block.timestamp + 21); vm.roll(block.number + 22354); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.split(225) {} catch {}
        vm.warp(block.timestamp + 43); vm.roll(block.number + 42914); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.splitAndCollectToSelf(160) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 5548); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewConsistency(167, 3467333873) {} catch {}
        vm.warp(block.timestamp + 50); vm.roll(block.number + 49152); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewConsistency(134, 1524787177) {} catch {}
        vm.warp(block.timestamp + 26); vm.roll(block.number + 10026); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 73); vm.roll(block.number + 3072); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 18); vm.roll(block.number + 35642); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addStreamWithClamping(2, 9, 179, 4294967293, 3630281748, 63796879019102360866017089131421958724) {} catch {}
        vm.warp(block.timestamp + 42); vm.roll(block.number + 17556); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamBalance(224, 92849699373635624031835544) {} catch {}
        vm.warp(block.timestamp + 5); vm.roll(block.number + 55640); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithFuzzedHistory(32, 147, 86880973723694896261400538317034935904984942387416755270877317957462141231417, bytes32(0xd77bdeeccdc7491e37833d1eec8fc6acbe511e31f1707f6af0897ac05f9a72be)) {} catch {}
        vm.warp(block.timestamp + 76); vm.roll(block.number + 12488); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setSplits(45, 169, 351) {} catch {}
        vm.warp(block.timestamp + 46); vm.roll(block.number + 39882); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiversReceivedSplit(40) {} catch {}
        vm.warp(block.timestamp + 74); vm.roll(block.number + 22337); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addSplitsReceiverWithClamping(2, 205, 651536367) {} catch {}
        vm.warp(block.timestamp + 53); vm.roll(block.number + 42145); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantAmtPerSecVsMinAmtPerSec(0, 115792089237316195423570985008687907853269984665640564039457584007913129639931) {} catch {}
        vm.warp(block.timestamp + 14); vm.roll(block.number + 8048); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.giveClampedAmount(12, 116, 96653892940176803852883907220738357057) {} catch {}
        vm.warp(block.timestamp + 16); vm.roll(block.number + 54247); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamsShouldNotRevert(158, 161, 326804987815141529165046100715344232662747960891, 1186100482, 0, 641) {} catch {}
        vm.warp(block.timestamp + 61); vm.roll(block.number + 60152); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewVsActual(233, 872039) {} catch {}
        vm.warp(block.timestamp + 35); vm.roll(block.number + 3798);
        vm.warp(block.timestamp + 58); vm.roll(block.number + 32147); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeWithFullyHashedHistory(207, 31) {} catch {}
        vm.warp(block.timestamp + 84); vm.roll(block.number + 15412);
        vm.warp(block.timestamp + 6); vm.roll(block.number + 3714); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.assert_canary_ASSERTION_CANARY(107370295755136217370378808580414917483297937509460323865823822579942924388975) {} catch {}
        vm.warp(block.timestamp + 61); vm.roll(block.number + 29761); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setMaxEndHints(3684336535, 548178511) {} catch {}
        vm.warp(block.timestamp + 65); vm.roll(block.number + 49264); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addStreamImmediatelySqueezable(160, 3, 304975787801851717078415119179375) {} catch {}
        vm.warp(block.timestamp + 2); vm.roll(block.number + 637); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeWithDefaultHistory(157, 147) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 55285);
        vm.warp(block.timestamp + 27); vm.roll(block.number + 9098); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testRemoveStreamShouldNotRevert(0, 56752998122563563340033249809755886711737899813985184458892994833508366609494) {} catch {}
        vm.warp(block.timestamp + 16); vm.roll(block.number + 19667); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeWithFuzzedHistory(248, 74, 11374496320241596966376201, bytes32(0x9370004c7e3bd0cc9092f12d5ec18279acc22f6e330b34a9a9eaeba277b15cab)) {} catch {}
        vm.warp(block.timestamp + 75); vm.roll(block.number + 17386); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiversReceivedSplit(40) {} catch {}
        vm.warp(block.timestamp + 5); vm.roll(block.number + 39790);
        vm.warp(block.timestamp + 63); vm.roll(block.number + 52837); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsViewVsActual(23, 412) {} catch {}
        vm.warp(block.timestamp + 17); vm.roll(block.number + 2636); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.assert_canary_ASSERTION_CANARY(778447145810872556144666219) {} catch {}
        vm.warp(block.timestamp + 76); vm.roll(block.number + 9000);
        vm.warp(block.timestamp + 14); vm.roll(block.number + 42583);
        vm.warp(block.timestamp + 69); vm.roll(block.number + 37387); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeWithFuzzedHistoryShouldNotRevert(33, 15, 35772540817140345152274462021947182885025796762711189328103404640312025708311, bytes32(0x67593d9110c141011396d7c81ab0584518ae0bdf86192764c4aad398a9bc310b)) {} catch {}
        vm.warp(block.timestamp + 59); vm.roll(block.number + 36364); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollectableAfterSplit(35) {} catch {}
        vm.warp(block.timestamp + 65); vm.roll(block.number + 13395); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalanceWithdrawAll(73) {} catch {}
        vm.warp(block.timestamp + 30); vm.roll(block.number + 44668); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testCollectShouldNotRevert(162, 3) {} catch {}
        vm.warp(block.timestamp + 77); vm.roll(block.number + 3409);
        vm.warp(block.timestamp + 34); vm.roll(block.number + 28929); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplittableAfterSplit(103) {} catch {}
        vm.warp(block.timestamp + 60); vm.roll(block.number + 59182);
        vm.warp(block.timestamp + 65); vm.roll(block.number + 16191); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalanceWithdrawAll(8) {} catch {}
        vm.warp(block.timestamp + 70); vm.roll(block.number + 11171); vm.prank(address(0x0000000000000000000000000000000000040000)); t.testSetStreamBalanceWithdrawAllShouldNotRevert(200);
    }
    // i-0a6a8a9d574c3af9e-echidna-v2.3.2: testSqueezableVsReceived (80 calls)
    function test_13_testSqueezableVsReceived() public {
        vm.warp(block.timestamp + 5); vm.roll(block.number + 4863); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.receiveStreams(31, 997) {} catch {}
        vm.warp(block.timestamp + 47); vm.roll(block.number + 126);
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeViewVsActual(190, 0) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setMaxEndHints(224, 574013225) {} catch {}
        vm.warp(block.timestamp + 33); vm.roll(block.number + 36124); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.assert_canary_ASSERTION_CANARY(11596947707919414781520188796038180011662028592916476471179308238010028448949) {} catch {}
        vm.warp(block.timestamp + 43); vm.roll(block.number + 7147); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.addStreamWithClamping(95, 161, 4294967296, 1495706553, 194, 60374198284686698693344957107118510979) {} catch {}
        vm.warp(block.timestamp + 70); vm.roll(block.number + 34); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.collect(189, 136) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 32737);
        vm.warp(block.timestamp + 1); vm.roll(block.number + 15896); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setStreamBalanceWithClamping(218, 166642945652876585872703551398031488997) {} catch {}
        vm.warp(block.timestamp + 87); vm.roll(block.number + 4); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addSplitsReceiverWithClamping(81, 190, 126) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.clampSplitWeight(1178116, 30) {} catch {}
        vm.warp(block.timestamp + 50); vm.roll(block.number + 36126); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeWithDefaultHistory(102, 61) {} catch {}
        vm.warp(block.timestamp + 97); vm.roll(block.number + 35681); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplitViewVsActual(94) {} catch {}
        vm.warp(block.timestamp + 60); vm.roll(block.number + 29829); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addSplitsReceiver(0, 0, 134) {} catch {}
        vm.warp(block.timestamp + 8); vm.roll(block.number + 45876); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiversReceivedSplit(253) {} catch {}
        vm.warp(block.timestamp + 12); vm.roll(block.number + 15977);
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueeze(139, 112) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.assert_canary_ASSERTION_CANARY(115792089237316195423570985008687907853269984665640564039457584007913129638912) {} catch {}
        vm.warp(block.timestamp + 17); vm.roll(block.number + 1011); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreams(63, 15) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 4803);
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testAddSplitsShouldNotRevert(219, 93, 202) {} catch {}
        vm.warp(block.timestamp + 7); vm.roll(block.number + 48019); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewVsActual(97, 0) {} catch {}
        vm.warp(block.timestamp + 60); vm.roll(block.number + 15978); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezableVsReceived(216) {} catch {}
        vm.warp(block.timestamp + 87); vm.roll(block.number + 13244); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewConsistency(101, 128) {} catch {}
        vm.warp(block.timestamp + 97); vm.roll(block.number + 6011);
        vm.warp(block.timestamp + 16); vm.roll(block.number + 30044); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.receiveStreamsSplitAndCollectToSelf(20) {} catch {}
        vm.warp(block.timestamp + 43); vm.roll(block.number + 35205); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeTwice(0, 80, 0, bytes32(0x83798888a96742c106888fc7e03edecdd9c484c0b099818bbe5acd38834deb57)) {} catch {}
        vm.warp(block.timestamp + 13); vm.roll(block.number + 32302); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewConsistency(82, 9) {} catch {}
        vm.warp(block.timestamp + 61); vm.roll(block.number + 96); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeAllSenders(0) {} catch {}
        vm.warp(block.timestamp + 93); vm.roll(block.number + 189); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamBalance(139, -190) {} catch {}
        vm.warp(block.timestamp + 19); vm.roll(block.number + 5002);
        vm.warp(block.timestamp + 13); vm.roll(block.number + 53451); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplitShouldNotRevert(200) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1027); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addStreamWithClamping(189, 148, 318261922472600877708042042562282142116085942993, 1242452643, 1930491, -61) {} catch {}
        vm.warp(block.timestamp + 13); vm.roll(block.number + 4963);
        vm.warp(block.timestamp + 22); vm.roll(block.number + 35461); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewVsActual(40, 2174209526) {} catch {}
        vm.warp(block.timestamp + 10); vm.roll(block.number + 41196); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSplitShouldNotRevert(203) {} catch {}
        vm.warp(block.timestamp + 61); vm.roll(block.number + 202); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setSplitsWithClamping(188, 192, 1215621393) {} catch {}
        vm.warp(block.timestamp + 93); vm.roll(block.number + 29828); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantSumAmtDeltaIsZero(91) {} catch {}
        vm.warp(block.timestamp + 45); vm.roll(block.number + 48542); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeAllSenders(103) {} catch {}
        vm.warp(block.timestamp + 11); vm.roll(block.number + 484);
        vm.warp(block.timestamp + 89); vm.roll(block.number + 130); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollect(202, 234) {} catch {}
        vm.warp(block.timestamp + 99); vm.roll(block.number + 46422); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.receiveStreamsSplitAndCollectToSelf(234) {} catch {}
        vm.warp(block.timestamp + 2); vm.roll(block.number + 9808); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 7); vm.roll(block.number + 1002); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamBalanceWithdrawAllShouldNotRevert(65) {} catch {}
        vm.warp(block.timestamp + 12); vm.roll(block.number + 56251); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollect(2, 198) {} catch {}
        vm.warp(block.timestamp + 24); vm.roll(block.number + 336); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addStreamImmediatelySqueezable(103, 106, 945) {} catch {}
        vm.warp(block.timestamp + 37); vm.roll(block.number + 484); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.assert_canary_ASSERTION_CANARY(115792089237316195423570985008687907853269984665640564039457584007913129639931) {} catch {}
        vm.warp(block.timestamp + 91); vm.roll(block.number + 60248); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 14); vm.roll(block.number + 46422); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testGiveShouldNotRevert(158, 195, 7) {} catch {}
        vm.warp(block.timestamp + 31); vm.roll(block.number + 5237); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testBalanceAtInFuture(14, 48, 128) {} catch {}
        vm.warp(block.timestamp + 90); vm.roll(block.number + 23531); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewVsActual(236, 244987639) {} catch {}
        vm.warp(block.timestamp + 20); vm.roll(block.number + 4027); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.split(251) {} catch {}
        vm.warp(block.timestamp + 64); vm.roll(block.number + 33357); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.collectToSelf(184) {} catch {}
        vm.warp(block.timestamp + 22); vm.roll(block.number + 15976); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.collect(17, 6) {} catch {}
        vm.warp(block.timestamp + 61); vm.roll(block.number + 1798); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setSplitsWithClamping(201, 199, 1524786180) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSplitViewVsActual(119) {} catch {}
        vm.warp(block.timestamp + 28); vm.roll(block.number + 32756); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetSplitsShouldNotRevert(94, 43, 2264222696) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeAllSenders(222) {} catch {}
        vm.warp(block.timestamp + 41); vm.roll(block.number + 36533); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeToSelf(14) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 1027); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueeze(102, 195) {} catch {}
        vm.warp(block.timestamp + 23); vm.roll(block.number + 60462); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalanceWithdrawAll(224) {} catch {}
        vm.warp(block.timestamp + 9); vm.roll(block.number + 1966); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 69); vm.roll(block.number + 3163); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantWithdrawAllTokens() {} catch {}
        vm.warp(block.timestamp + 16); vm.roll(block.number + 2694); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.receiveStreamsSplitAndCollectToSelf(163) {} catch {}
        vm.warp(block.timestamp + 39); vm.roll(block.number + 29922); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.removeStream(0, 91352034832010926057001582751876410893860910903135406657784615168643518944325) {} catch {}
        vm.warp(block.timestamp + 58); vm.roll(block.number + 43577);
        vm.warp(block.timestamp + 87); vm.roll(block.number + 3845); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsViewConsistency(126, 881) {} catch {}
        vm.warp(block.timestamp + 41); vm.roll(block.number + 839); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreamsViewVsActual(7, 0) {} catch {}
        vm.warp(block.timestamp + 85); vm.roll(block.number + 17750); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(23, 154) {} catch {}
        vm.warp(block.timestamp + 95); vm.roll(block.number + 85); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.give(116, 102, 189) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetStreamsShouldNotRevert(88, 136, 201, 83734758, 1524788395, 62) {} catch {}
        vm.warp(block.timestamp + 76); vm.roll(block.number + 17423); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.removeAllSplits(251) {} catch {}
        vm.warp(block.timestamp + 52); vm.roll(block.number + 47864); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamsWithClamping(0, 10, 6, 505356515, 65, 192) {} catch {}
        vm.warp(block.timestamp + 36); vm.roll(block.number + 11498);
        vm.warp(block.timestamp + 63); vm.roll(block.number + 38645); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueeze(0, 10) {} catch {}
        vm.warp(block.timestamp + 40); vm.roll(block.number + 9); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezableVsReceived(15) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 760); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamsWithClamping(30, 137, 1461501637330902918203684832716283019655932542974, 2655312736, 3459058990, 97122955153754113686138872081224071228) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.receiveStreams(85, 2173787255) {} catch {}
        vm.warp(block.timestamp + 2); vm.roll(block.number + 5244); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.giveClampedAmount(20, 38, 203541183274802928682067591297117784404) {} catch {}
        vm.warp(block.timestamp + 5); vm.roll(block.number + 4864); vm.prank(address(0x0000000000000000000000000000000000020000)); t.testSqueezableVsReceived(159);
    }
    // i-0a6a8a9d574c3af9e-echidna-v2.3.2: invariantWithdrawAllTokensShouldNotRevert (85 calls)
    function test_14_invariantWithdrawAllTokensShouldNotRevert() public {
        vm.warp(block.timestamp + 74); vm.roll(block.number + 19707); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueeze(122, 45) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 4989); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.splitAndCollectToSelf(198) {} catch {}
        vm.warp(block.timestamp + 32); vm.roll(block.number + 28695);
        vm.warp(block.timestamp + 67); vm.roll(block.number + 5015); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 88); vm.roll(block.number + 58361); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezableAmountCantBeWithdrawn(32, 74) {} catch {}
        vm.warp(block.timestamp + 48); vm.roll(block.number + 65); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamsWithClamping(228, 18, 125, 2202031933, 22, 90311067193090349449639958489017738977) {} catch {}
        vm.warp(block.timestamp + 14); vm.roll(block.number + 4931); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.addSplitsReceiverWithClamping(0, 20, 193) {} catch {}
        vm.warp(block.timestamp + 97); vm.roll(block.number + 48542); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testCollect(246, 159) {} catch {}
        vm.warp(block.timestamp + 77); vm.roll(block.number + 48539); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamBalanceWithdrawAllShouldNotRevert(35) {} catch {}
        vm.warp(block.timestamp + 15); vm.roll(block.number + 32); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(134, 80) {} catch {}
        vm.warp(block.timestamp + 88); vm.roll(block.number + 3998); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addStreamWithClamping(80, 203, 308221410243699332412198755153837680277322953295, 0, 1995691417, 103040768269929972947919637359301374871) {} catch {}
        vm.warp(block.timestamp + 28); vm.roll(block.number + 35); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.collectToSelf(94) {} catch {}
        vm.warp(block.timestamp + 15); vm.roll(block.number + 6721);
        vm.warp(block.timestamp + 99); vm.roll(block.number + 1002); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamBalanceWithClamping(251, 136934462138446320791873366307126438364) {} catch {}
        vm.warp(block.timestamp + 59); vm.roll(block.number + 28695); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 25); vm.roll(block.number + 486); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testAddStreamShouldNotRevert(212, 4, 999997, 232366455, 1026, 1025) {} catch {}
        vm.warp(block.timestamp + 54); vm.roll(block.number + 35200); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addStream(126, 226, 1114900428623328103995335370056240671399565481238, 1444633415, 2875186344, 162) {} catch {}
        vm.warp(block.timestamp + 26); vm.roll(block.number + 15977); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetSplitsShouldNotRevert(88, 5, 4294967293) {} catch {}
        vm.warp(block.timestamp + 90); vm.roll(block.number + 31); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testCollect(90, 54) {} catch {}
        vm.warp(block.timestamp + 60); vm.roll(block.number + 4022); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantSumAmtDeltaIsZero(10) {} catch {}
        vm.warp(block.timestamp + 80); vm.roll(block.number + 28695);
        vm.warp(block.timestamp + 38); vm.roll(block.number + 45261); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setStreamBalanceWithdrawAll(189) {} catch {}
        vm.warp(block.timestamp + 46); vm.roll(block.number + 66); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testAddSplitsShouldNotRevert(179, 50, 3045522452) {} catch {}
        vm.warp(block.timestamp + 97); vm.roll(block.number + 48989); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testAddSplitsShouldNotRevert(96, 21, 1) {} catch {}
        vm.warp(block.timestamp + 22); vm.roll(block.number + 7143); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueeze(65, 139) {} catch {}
        vm.warp(block.timestamp + 61); vm.roll(block.number + 482); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.receiveStreamsAllCycles(24) {} catch {}
        vm.warp(block.timestamp + 96); vm.roll(block.number + 33203); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeWithDefaultHistory(158, 89) {} catch {}
        vm.warp(block.timestamp + 36); vm.roll(block.number + 4027);
        vm.warp(block.timestamp + 28); vm.roll(block.number + 35681); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.splitAndCollectToSelf(1) {} catch {}
        vm.warp(block.timestamp + 25); vm.roll(block.number + 1025);
        vm.warp(block.timestamp + 29); vm.roll(block.number + 4929); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(186, 132) {} catch {}
        vm.warp(block.timestamp + 65); vm.roll(block.number + 53166); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.split(245) {} catch {}
        vm.warp(block.timestamp + 2); vm.roll(block.number + 32147); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addStream(188, 63, 1000000001, 11534639, 1000000001, 888) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 36805); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsShouldNotRevert(208) {} catch {}
        vm.warp(block.timestamp + 59); vm.roll(block.number + 4834); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.giveClampedAmount(93, 160, 295367093033463066563051115880680820800) {} catch {}
        vm.warp(block.timestamp + 15); vm.roll(block.number + 4994); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.split(125) {} catch {}
        vm.warp(block.timestamp + 34); vm.roll(block.number + 4826);
        vm.warp(block.timestamp + 18); vm.roll(block.number + 2); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeWithFuzzedHistoryShouldNotRevert(252, 103, 2929219364623113384223998520458720104904999209973194120386743435912445481771, bytes32(0x8a4f6b5b38eb09f95b72a86e02d1dc41f75b275297021ff1d28bde9a9dc38bac)) {} catch {}
        vm.warp(block.timestamp + 89); vm.roll(block.number + 4024); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezeTwice(132, 195, 115792089237316195423570985008687907853269984665640564039457584007913129639904, bytes32(0x496e76616c69642073747265616d7320726563656976657273206c6973740000)) {} catch {}
        vm.warp(block.timestamp + 40); vm.roll(block.number + 4542); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezeViewVsActual(19, 197) {} catch {}
        vm.warp(block.timestamp + 60); vm.roll(block.number + 58356); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testGiveShouldNotRevert(203, 63, 161581344616920909008205192) {} catch {}
        vm.warp(block.timestamp + 30); vm.roll(block.number + 52223); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsViewVsActual(45, 1906911688) {} catch {}
        vm.warp(block.timestamp + 9); vm.roll(block.number + 19012); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezableVsReceived(8) {} catch {}
        vm.warp(block.timestamp + 47); vm.roll(block.number + 17156); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezableVsReceived(163) {} catch {}
        vm.warp(block.timestamp + 3); vm.roll(block.number + 889); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplitViewVsActual(19) {} catch {}
        vm.warp(block.timestamp + 86); vm.roll(block.number + 59688); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addSplitsReceiverWithClamping(23, 163, 4294967292) {} catch {}
        vm.warp(block.timestamp + 21); vm.roll(block.number + 52992);
        vm.warp(block.timestamp + 19); vm.roll(block.number + 24006); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamBalanceShouldNotRevert(12, 6166161214755077998610513491466945828) {} catch {}
        vm.warp(block.timestamp + 72); vm.roll(block.number + 7443); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamBalanceWithdrawAllShouldNotRevert(31) {} catch {}
        vm.warp(block.timestamp + 53); vm.roll(block.number + 7524);
        vm.warp(block.timestamp + 58); vm.roll(block.number + 248); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsShouldNotRevert(250) {} catch {}
        vm.warp(block.timestamp + 98); vm.roll(block.number + 821); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezableVsReceived(132) {} catch {}
        vm.warp(block.timestamp + 8); vm.roll(block.number + 58825); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeTwice(156, 0, 18958144961448520543554157491444610115416217155483838136075531746579018518323, bytes32(0x88b4ac432ff2c296f78bcfa6f9572cd6e0939e0434df42d33828fa7c6db87885)) {} catch {}
        vm.warp(block.timestamp + 71); vm.roll(block.number + 159); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setStreamBalanceWithClamping(254, 167033417293178691496004880980675175195) {} catch {}
        vm.warp(block.timestamp + 87); vm.roll(block.number + 3643); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsViewConsistency(125, 4258732223) {} catch {}
        vm.warp(block.timestamp + 60); vm.roll(block.number + 2790); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(101, 225) {} catch {}
        vm.warp(block.timestamp + 200); vm.roll(block.number + 64226);
        vm.warp(block.timestamp + 22); vm.roll(block.number + 43347); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(239) {} catch {}
        vm.warp(block.timestamp + 97); vm.roll(block.number + 2117); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testAddSplitsShouldNotRevert(29, 34, 80695315) {} catch {}
        vm.warp(block.timestamp + 56); vm.roll(block.number + 2178); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezableAmountCantBeUndone(151, 78, 214992439221155248701349177428221200720418034365, 3153082873, 1577929604, 226) {} catch {}
        vm.warp(block.timestamp + 16); vm.roll(block.number + 51225);
        vm.warp(block.timestamp + 88); vm.roll(block.number + 31968); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.removeStream(99, 53831356529334884697075561984128194835872885040480256) {} catch {}
        vm.warp(block.timestamp + 3); vm.roll(block.number + 16748); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeWithFuzzedHistoryShouldNotRevert(113, 64, 64692108714163793897491916087323148543649519625296563985370889561696172614090, bytes32(0xc0c43ebc4028cf0afc5aa5750332afe5bbf395c7464a8a6ffd5b8032a3cadb33)) {} catch {}
        vm.warp(block.timestamp + 17); vm.roll(block.number + 51108); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setSplitsWithClamping(10, 199, 2269032534) {} catch {}
        vm.warp(block.timestamp + 30); vm.roll(block.number + 47917); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 14); vm.roll(block.number + 3180); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.collectToSelf(59) {} catch {}
        vm.warp(block.timestamp + 9); vm.roll(block.number + 42061); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeAllSenders(65) {} catch {}
        vm.warp(block.timestamp + 66); vm.roll(block.number + 10916); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplitViewVsActual(96) {} catch {}
        vm.warp(block.timestamp + 97); vm.roll(block.number + 2983); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addStreamImmediatelySqueezable(165, 20, 1074246406023121547134064411072631991402271287559) {} catch {}
        vm.warp(block.timestamp + 9); vm.roll(block.number + 5237); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testBalanceAtInFuture(222, 253, 4369999) {} catch {}
        vm.warp(block.timestamp + 35); vm.roll(block.number + 41711);
        vm.warp(block.timestamp + 32); vm.roll(block.number + 22100); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeAllSenders(214) {} catch {}
        vm.warp(block.timestamp + 96); vm.roll(block.number + 72939);
        vm.warp(block.timestamp + 9); vm.roll(block.number + 48623); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setStreamsWithClamping(213, 183, 1461501637330902918203684832716283019655932542973, 3723068401, 1524786863, 16146451530085061559274177617180014445) {} catch {}
        vm.warp(block.timestamp + 67); vm.roll(block.number + 442); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.addSplitsReceiverWithClamping(189, 177, 210240015) {} catch {}
        vm.warp(block.timestamp + 67); vm.roll(block.number + 19636);
        vm.warp(block.timestamp + 6); vm.roll(block.number + 25732); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.collectToSelf(20) {} catch {}
        vm.warp(block.timestamp + 34); vm.roll(block.number + 19933); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.collectToSelf(243) {} catch {}
        vm.warp(block.timestamp + 81); vm.roll(block.number + 2356); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.removeStream(221, 103737689120678315262147416125270248411018657430506956045639483079746881889792) {} catch {}
        vm.warp(block.timestamp + 30); vm.roll(block.number + 12918); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.split(163) {} catch {}
        vm.warp(block.timestamp + 72); vm.roll(block.number + 44765); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.split(108) {} catch {}
        vm.warp(block.timestamp + 7); vm.roll(block.number + 44259); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.collect(62, 154) {} catch {}
        vm.warp(block.timestamp + 72); vm.roll(block.number + 27133); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezeWithFuzzedHistoryShouldNotRevert(125, 149, 509013103257153013125737282, bytes32(0xe0d8c7f21ec31fd067c11d1b56e9ba224f0fcfe5a9b7cb88b9a446af4c772c4d)) {} catch {}
        vm.warp(block.timestamp + 41); vm.roll(block.number + 36274); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamsShouldNotRevert(238, 129, 617593590041815071489769006467731527408792673044, 563711208, 1098287519, 170141183460469231731687303715884105726) {} catch {}
        vm.warp(block.timestamp + 2); vm.roll(block.number + 1272); vm.prank(address(0x0000000000000000000000000000000000020000)); t.invariantWithdrawAllTokensShouldNotRevert();
    }
    // i-0a6a8a9d574c3af9e-echidna-v2.3.2: testSqueezableAmountCantBeWithdrawn (28 calls)
    function test_15_testSqueezableAmountCantBeWithdrawn() public {
        vm.warp(block.timestamp + 40); vm.roll(block.number + 48541);
        vm.warp(block.timestamp + 65); vm.roll(block.number + 63); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.collectToSelf(242) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 51145); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSplitShouldNotRevert(176) {} catch {}
        vm.warp(block.timestamp + 94); vm.roll(block.number + 1123); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setMaxEndHints(97, 1240287066) {} catch {}
        vm.warp(block.timestamp + 35); vm.roll(block.number + 67); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.assert_canary_ASSERTION_CANARY(115792089237316195423570985008687907853269984665640564039457584007913129639873) {} catch {}
        vm.warp(block.timestamp + 17); vm.roll(block.number + 5014); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeAllSenders(253) {} catch {}
        vm.warp(block.timestamp + 11); vm.roll(block.number + 54673); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplittableAfterSplit(158) {} catch {}
        vm.warp(block.timestamp + 33); vm.roll(block.number + 160); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 98); vm.roll(block.number + 4929);
        vm.warp(block.timestamp + 2); vm.roll(block.number + 30041); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addStreamWithClamping(193, 6, 1275850403220573052087764291070007306637477900161, 3337302383, 2774110716, 83162321544020198622456379473661049546) {} catch {}
        vm.warp(block.timestamp + 36); vm.roll(block.number + 4895); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollectableAfterSplit(128) {} catch {}
        vm.warp(block.timestamp + 166); vm.roll(block.number + 4837);
        vm.warp(block.timestamp + 3); vm.roll(block.number + 6681); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.receiveStreams(35, 3014730344) {} catch {}
        vm.warp(block.timestamp + 21); vm.roll(block.number + 59982);
        vm.warp(block.timestamp + 46); vm.roll(block.number + 129); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsShouldNotRevert(247) {} catch {}
        vm.warp(block.timestamp + 89); vm.roll(block.number + 4822);
        vm.warp(block.timestamp + 85); vm.roll(block.number + 199); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamsWithClamping(118, 34, 261198511707138437147573938812783597337048154301, 4294967291, 0, 139) {} catch {}
        vm.warp(block.timestamp + 20); vm.roll(block.number + 19933); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamsWithClamping(243, 189, 308633623916145298497992001937980027519328772975, 3966850085, 1516363055, 161861464941937861477851980220064312581) {} catch {}
        vm.warp(block.timestamp + 11); vm.roll(block.number + 158); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(12) {} catch {}
        vm.warp(block.timestamp + 47); vm.roll(block.number + 4824); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantAmtPerSecVsMinAmtPerSec(110, 64264449320522990144970637078106658427607204134485566527074368408528441068760) {} catch {}
        vm.warp(block.timestamp + 68); vm.roll(block.number + 36859); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addStreamImmediatelySqueezable(5, 3, 205331007976587531851028368570092603647141801748) {} catch {}
        vm.warp(block.timestamp + 13); vm.roll(block.number + 27404); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamsShouldNotRevert(240, 103, 522951426986492555522386827515142097013829752056, 2104906015, 1524786388, 12260970974715653304610925539610789176) {} catch {}
        vm.warp(block.timestamp + 100); vm.roll(block.number + 5017); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testAddSplitsShouldNotRevert(189, 30, 1524787376) {} catch {}
        vm.warp(block.timestamp + 54); vm.roll(block.number + 20243); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreamsViewVsActual(252, 22) {} catch {}
        vm.warp(block.timestamp + 91); vm.roll(block.number + 38971); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantWithdrawAllTokens() {} catch {}
        vm.warp(block.timestamp + 63); vm.roll(block.number + 36807); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantAmtPerSecVsMinAmtPerSec(254, 97018069175655140962658940186606238048670005749541013058444630150875541019417) {} catch {}
        vm.warp(block.timestamp + 67); vm.roll(block.number + 339); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testAddStreamShouldNotRevert(84, 119, 999999999999999999999999999, 2708387323, 1206303129, 82776445544856767523352346188761159978) {} catch {}
        vm.warp(block.timestamp + 83); vm.roll(block.number + 58361); vm.prank(address(0x0000000000000000000000000000000000030000)); t.testSqueezableAmountCantBeWithdrawn(34, 77);
    }
    // i-0a6a8a9d574c3af9e-echidna-v2.3.2: invariantAccountingVsTokenBalance (22 calls)
    function test_16_invariantAccountingVsTokenBalance() public {
        vm.warp(block.timestamp + 54); vm.roll(block.number + 15202); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.addSplitsReceiver(11, 178, 203) {} catch {}
        vm.warp(block.timestamp + 63); vm.roll(block.number + 4026); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testCollectableAfterSplit(126) {} catch {}
        vm.warp(block.timestamp + 35); vm.roll(block.number + 60448); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testAddStreamShouldNotRevert(104, 249, 171508975608197405953001428279763243795153357346, 4294967292, 967292, 98458304444410435323473997292021854970) {} catch {}
        vm.warp(block.timestamp + 88); vm.roll(block.number + 24831); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsViewVsActual(117, 697409688) {} catch {}
        vm.warp(block.timestamp + 99); vm.roll(block.number + 47015); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalance(18, 11) {} catch {}
        vm.warp(block.timestamp + 41); vm.roll(block.number + 2728); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeAllSenders(253) {} catch {}
        vm.warp(block.timestamp + 5); vm.roll(block.number + 60131); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetSplitsShouldNotRevert(138, 55, 657) {} catch {}
        vm.warp(block.timestamp + 48); vm.roll(block.number + 60054); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.assert_canary_ASSERTION_CANARY(581779143848375841145674347) {} catch {}
        vm.warp(block.timestamp + 51); vm.roll(block.number + 2534); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeWithFullyHashedHistory(195, 18) {} catch {}
        vm.warp(block.timestamp + 97); vm.roll(block.number + 35345); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantWithdrawAllTokens() {} catch {}
        vm.warp(block.timestamp + 69); vm.roll(block.number + 12849); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplittableAfterSplit(133) {} catch {}
        vm.warp(block.timestamp + 46); vm.roll(block.number + 38490); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.giveClampedAmount(113, 227, 599286438714889211200455603) {} catch {}
        vm.warp(block.timestamp + 53); vm.roll(block.number + 4995);
        vm.warp(block.timestamp + 85); vm.roll(block.number + 16209); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addSplitsReceiverWithClamping(125, 31, 1524787549) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 15051); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testAddStreamShouldNotRevert(167, 203, 940504352292793753806379349908814484549394893381, 4111477951, 0, 62122253784029218434560082798305977851) {} catch {}
        vm.warp(block.timestamp + 67); vm.roll(block.number + 8756); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantWithdrawAllTokens() {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 45595); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(0) {} catch {}
        vm.warp(block.timestamp + 13); vm.roll(block.number + 3078); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezableVsReceived(3) {} catch {}
        vm.warp(block.timestamp + 3); vm.roll(block.number + 34546); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(151, 11) {} catch {}
        vm.warp(block.timestamp + 100); vm.roll(block.number + 48231); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 59); vm.roll(block.number + 2168); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 3); vm.roll(block.number + 18); vm.prank(address(0x0000000000000000000000000000000000030000)); t.invariantAccountingVsTokenBalance();
    }
    // i-0a6a8a9d574c3af9e-echidna-v2.3.2: testSqueezeWithDefaultHistoryShouldNotRevert (96 calls)
    function test_17_testSqueezeWithDefaultHistoryShouldNotRevert() public {
        vm.warp(block.timestamp + 52); vm.roll(block.number + 3084); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.receiveStreamsAllCycles(198) {} catch {}
        vm.warp(block.timestamp + 79); vm.roll(block.number + 22559); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.assert_canary_ASSERTION_CANARY(53172715341554933999704397495369473226902471951737366841198867884786709814136) {} catch {}
        vm.warp(block.timestamp + 69); vm.roll(block.number + 574); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezableAmountCantBeWithdrawn(98, 168) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 66); vm.roll(block.number + 46637); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addSplitsReceiver(112, 249, 15205) {} catch {}
        vm.warp(block.timestamp + 27); vm.roll(block.number + 1157);
        vm.warp(block.timestamp + 65); vm.roll(block.number + 60199); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamsWithClamping(19, 163, 99, 4282591722, 1524789841, 169160887538253517794947104676929572352) {} catch {}
        vm.warp(block.timestamp + 67); vm.roll(block.number + 55999); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollectableAfterSplit(128) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 1026); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplittableAfterSplit(252) {} catch {}
        vm.warp(block.timestamp + 68); vm.roll(block.number + 44191); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsShouldNotRevert(71) {} catch {}
        vm.warp(block.timestamp + 133); vm.roll(block.number + 16438);
        vm.warp(block.timestamp + 42); vm.roll(block.number + 51953); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamsWithClamping(12, 58, 97, 995, 1070172970, 3999999999999999999999999997) {} catch {}
        vm.warp(block.timestamp + 53); vm.roll(block.number + 12669); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewConsistency(94, 46780489) {} catch {}
        vm.warp(block.timestamp + 27); vm.roll(block.number + 624); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeWithFullyHashedHistory(64, 57) {} catch {}
        vm.warp(block.timestamp + 33); vm.roll(block.number + 1706); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 73); vm.roll(block.number + 14941); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(212, 93) {} catch {}
        vm.warp(block.timestamp + 30); vm.roll(block.number + 60318); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithDefaultHistory(254, 125) {} catch {}
        vm.warp(block.timestamp + 77); vm.roll(block.number + 49474); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalanceWithClamping(202, 136066180723754564823007400868853906754) {} catch {}
        vm.warp(block.timestamp + 33); vm.roll(block.number + 23568);
        vm.warp(block.timestamp + 20); vm.roll(block.number + 58078); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsShouldNotRevert(94) {} catch {}
        vm.warp(block.timestamp + 35); vm.roll(block.number + 41952); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 50); vm.roll(block.number + 2175);
        vm.warp(block.timestamp + 92); vm.roll(block.number + 33334); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.assert_canary_ASSERTION_CANARY(4058865182498799307776958) {} catch {}
        vm.warp(block.timestamp + 43); vm.roll(block.number + 60442); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantAmtPerSecVsMinAmtPerSec(8, 64430149531586259499850495565258571013261282897398864681025610350654157905387) {} catch {}
        vm.warp(block.timestamp + 99); vm.roll(block.number + 9298);
        vm.warp(block.timestamp + 3); vm.roll(block.number + 16413); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamBalanceWithClamping(4, 20) {} catch {}
        vm.warp(block.timestamp + 89); vm.roll(block.number + 194); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamBalanceShouldNotRevert(95, 29339784305381648428605686273758251629) {} catch {}
        vm.warp(block.timestamp + 96); vm.roll(block.number + 3190); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueeze(6, 16) {} catch {}
        vm.warp(block.timestamp + 30); vm.roll(block.number + 29312);
        vm.warp(block.timestamp + 19); vm.roll(block.number + 396); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsViewVsActual(16, 1524789641) {} catch {}
        vm.warp(block.timestamp + 56); vm.roll(block.number + 9973); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreams(112, 562633) {} catch {}
        vm.warp(block.timestamp + 63); vm.roll(block.number + 30304);
        vm.warp(block.timestamp + 56); vm.roll(block.number + 4290); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalanceWithClamping(80, 38771147269870882453424697231405390501) {} catch {}
        vm.warp(block.timestamp + 55); vm.roll(block.number + 3160); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetSplitsShouldNotRevert(209, 4, 1524786678) {} catch {}
        vm.warp(block.timestamp + 67); vm.roll(block.number + 34712);
        vm.warp(block.timestamp + 43); vm.roll(block.number + 2885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetStreamBalanceWithdrawAllShouldNotRevert(40) {} catch {}
        vm.warp(block.timestamp + 2); vm.roll(block.number + 10626); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamBalanceShouldNotRevert(70, 109355856789939436426639574937480697808) {} catch {}
        vm.warp(block.timestamp + 16); vm.roll(block.number + 1556); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testCollectableAfterSplit(66) {} catch {}
        vm.warp(block.timestamp + 16); vm.roll(block.number + 17941); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsShouldNotRevert(135) {} catch {}
        vm.warp(block.timestamp + 24); vm.roll(block.number + 62); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.clampSplitWeight(0, 788309) {} catch {}
        vm.warp(block.timestamp + 91); vm.roll(block.number + 5427); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollectShouldNotRevert(106, 11) {} catch {}
        vm.warp(block.timestamp + 26); vm.roll(block.number + 4696); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addStreamWithClamping(158, 139, 94, 2527997965, 3136023676, 149) {} catch {}
        vm.warp(block.timestamp + 48); vm.roll(block.number + 21853); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplittableAfterSplit(8) {} catch {}
        vm.warp(block.timestamp + 22); vm.roll(block.number + 1745); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addStream(189, 107, 700163617762393419637013575582690381973296375994, 1388473641, 0, -198) {} catch {}
        vm.warp(block.timestamp + 39); vm.roll(block.number + 21692);
        vm.warp(block.timestamp + 25); vm.roll(block.number + 38730); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(64) {} catch {}
        vm.warp(block.timestamp + 51); vm.roll(block.number + 21434); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(127) {} catch {}
        vm.warp(block.timestamp + 74); vm.roll(block.number + 3497);
        vm.warp(block.timestamp + 71); vm.roll(block.number + 36758); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.receiveStreams(130, 1524786148) {} catch {}
        vm.warp(block.timestamp + 58); vm.roll(block.number + 1527); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeWithFullyHashedHistory(0, 103) {} catch {}
        vm.warp(block.timestamp + 88); vm.roll(block.number + 18407); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(16, 106) {} catch {}
        vm.warp(block.timestamp + 2); vm.roll(block.number + 32266); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.splitAndCollectToSelf(96) {} catch {}
        vm.warp(block.timestamp + 100); vm.roll(block.number + 128); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsViewVsActual(222, 1614681102) {} catch {}
        vm.warp(block.timestamp + 53); vm.roll(block.number + 11312); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.collect(13, 99) {} catch {}
        vm.warp(block.timestamp + 129); vm.roll(block.number + 10952);
        vm.warp(block.timestamp + 37); vm.roll(block.number + 1036); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalanceWithClamping(23, 86) {} catch {}
        vm.warp(block.timestamp + 48); vm.roll(block.number + 55911);
        vm.warp(block.timestamp + 63); vm.roll(block.number + 55197); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezableVsReceived(96) {} catch {}
        vm.warp(block.timestamp + 15); vm.roll(block.number + 6695); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.invariantWithdrawAllTokens() {} catch {}
        vm.warp(block.timestamp + 72); vm.roll(block.number + 60259); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeToSelf(150) {} catch {}
        vm.warp(block.timestamp + 107); vm.roll(block.number + 19602);
        vm.warp(block.timestamp + 58); vm.roll(block.number + 15694); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetStreamBalanceShouldNotRevert(127, 63755903018432512795242636853875578439) {} catch {}
        vm.warp(block.timestamp + 27); vm.roll(block.number + 30915);
        vm.warp(block.timestamp + 27); vm.roll(block.number + 2236); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeWithFuzzedHistory(240, 93, 115792089237316195423570985008687907853269984665640564039457584007913129639931, bytes32(0x203d0390efbd905948d201c13eab173f39d5d127d581e0b4b14b3d4a6ea49eb8)) {} catch {}
        vm.warp(block.timestamp + 98); vm.roll(block.number + 13736); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplittableAfterSplit(197) {} catch {}
        vm.warp(block.timestamp + 83); vm.roll(block.number + 37277);
        vm.warp(block.timestamp + 63); vm.roll(block.number + 6573); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 43); vm.roll(block.number + 19847); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeWithDefaultHistory(206, 12) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeToSelf(106) {} catch {}
        vm.warp(block.timestamp + 4); vm.roll(block.number + 4936);
        vm.warp(block.timestamp + 92); vm.roll(block.number + 41); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.receiveStreamsAllCycles(161) {} catch {}
        vm.warp(block.timestamp + 27); vm.roll(block.number + 30948); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezableAmountCantBeWithdrawn(49, 20) {} catch {}
        vm.warp(block.timestamp + 91); vm.roll(block.number + 15007); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.receiveStreams(31, 1122942915) {} catch {}
        vm.warp(block.timestamp + 15); vm.roll(block.number + 14225); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.collectToSelf(253) {} catch {}
        vm.warp(block.timestamp + 54); vm.roll(block.number + 43575); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.removeStream(3, 18446746453339537124532158464) {} catch {}
        vm.warp(block.timestamp + 32); vm.roll(block.number + 22504); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.receiveStreamsSplitAndCollectToSelf(141) {} catch {}
        vm.warp(block.timestamp + 80); vm.roll(block.number + 54756); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setMaxEndHints(1524788427, 3230351161) {} catch {}
        vm.warp(block.timestamp + 31); vm.roll(block.number + 2759); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setMaxEndHints(3027133919, 1524787457) {} catch {}
        vm.warp(block.timestamp + 18); vm.roll(block.number + 48217); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreamsViewConsistency(200, 4294967292) {} catch {}
        vm.warp(block.timestamp + 35); vm.roll(block.number + 34501); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamsShouldNotRevert(0, 11, 1010963667543501904894533203351000119821656566499, 1870304699, 1524788694, 114292780685560775006239724971904450131) {} catch {}
        vm.warp(block.timestamp + 67); vm.roll(block.number + 397); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeAllSenders(159) {} catch {}
        vm.warp(block.timestamp + 99); vm.roll(block.number + 37059); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.assert_canary_ASSERTION_CANARY(1922981996167763604181256752) {} catch {}
        vm.warp(block.timestamp + 5); vm.roll(block.number + 54932); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeWithFuzzedHistoryShouldNotRevert(31, 103, 0, bytes32(0x505f7af6f3675577c44e0d2b2cf7b8289ffda11ff6bb50d6cca81067d4413965)) {} catch {}
        vm.warp(block.timestamp + 67); vm.roll(block.number + 49561);
        vm.warp(block.timestamp + 47); vm.roll(block.number + 46568); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.giveClampedAmount(66, 183, 938463463374947373852765534) {} catch {}
        vm.warp(block.timestamp + 82); vm.roll(block.number + 3870); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setSplitsWithClamping(29, 78, 1524789516) {} catch {}
        vm.warp(block.timestamp + 14); vm.roll(block.number + 46637); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.addStreamImmediatelySqueezable(29, 233, 1088397748486072889962555343696935111175237216520) {} catch {}
        vm.warp(block.timestamp + 42); vm.roll(block.number + 49167); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addStreamImmediatelySqueezable(253, 89, 101) {} catch {}
        vm.warp(block.timestamp + 33); vm.roll(block.number + 314); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollect(0, 232) {} catch {}
        vm.warp(block.timestamp + 100); vm.roll(block.number + 3120); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezableVsReceived(159) {} catch {}
        vm.warp(block.timestamp + 58); vm.roll(block.number + 48062);
        vm.warp(block.timestamp + 35); vm.roll(block.number + 35834); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreams(79, 660757234) {} catch {}
        vm.warp(block.timestamp + 23); vm.roll(block.number + 49413); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantSumAmtDeltaIsZero(59) {} catch {}
        vm.warp(block.timestamp + 63); vm.roll(block.number + 1394); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.assert_canary_ASSERTION_CANARY(1665974092) {} catch {}
        vm.warp(block.timestamp + 91); vm.roll(block.number + 8064); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreams(98, 197, 1041051332147484100734718659537888526449700781137, 944, 2645897960, 2) {} catch {}
        vm.warp(block.timestamp + 3); vm.roll(block.number + 2706); vm.prank(address(0x0000000000000000000000000000000000040000)); t.testSqueezeWithDefaultHistoryShouldNotRevert(216, 100);
    }
    // i-0a6a8a9d574c3af9e-echidna-v2.3.2: testSetStreamsShouldNotRevert (78 calls)
    function test_18_testSetStreamsShouldNotRevert() public {
        vm.warp(block.timestamp + 52); vm.roll(block.number + 3084); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.receiveStreamsAllCycles(198) {} catch {}
        vm.warp(block.timestamp + 79); vm.roll(block.number + 22559); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.assert_canary_ASSERTION_CANARY(53172715341554933999704397495369473226902471951737366841198867884786709814136) {} catch {}
        vm.warp(block.timestamp + 69); vm.roll(block.number + 574); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezableAmountCantBeWithdrawn(98, 168) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 66); vm.roll(block.number + 46637); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addSplitsReceiver(112, 249, 15205) {} catch {}
        vm.warp(block.timestamp + 27); vm.roll(block.number + 1157);
        vm.warp(block.timestamp + 65); vm.roll(block.number + 60199); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamsWithClamping(19, 163, 99, 4282591722, 1524789841, 169160887538253517794947104676929572352) {} catch {}
        vm.warp(block.timestamp + 67); vm.roll(block.number + 55999); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollectableAfterSplit(128) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 1026); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplittableAfterSplit(252) {} catch {}
        vm.warp(block.timestamp + 68); vm.roll(block.number + 44191); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsShouldNotRevert(71) {} catch {}
        vm.warp(block.timestamp + 133); vm.roll(block.number + 16438);
        vm.warp(block.timestamp + 42); vm.roll(block.number + 51953); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamsWithClamping(12, 58, 97, 995, 1070172970, 3999999999999999999999999997) {} catch {}
        vm.warp(block.timestamp + 53); vm.roll(block.number + 12669); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewConsistency(94, 46780489) {} catch {}
        vm.warp(block.timestamp + 27); vm.roll(block.number + 624); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeWithFullyHashedHistory(64, 57) {} catch {}
        vm.warp(block.timestamp + 33); vm.roll(block.number + 1706); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 73); vm.roll(block.number + 14941); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(212, 93) {} catch {}
        vm.warp(block.timestamp + 30); vm.roll(block.number + 60318); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithDefaultHistory(254, 125) {} catch {}
        vm.warp(block.timestamp + 77); vm.roll(block.number + 49474); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalanceWithClamping(202, 136066180723754564823007400868853906754) {} catch {}
        vm.warp(block.timestamp + 33); vm.roll(block.number + 23568);
        vm.warp(block.timestamp + 20); vm.roll(block.number + 58078); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsShouldNotRevert(94) {} catch {}
        vm.warp(block.timestamp + 35); vm.roll(block.number + 41952); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 50); vm.roll(block.number + 2175);
        vm.warp(block.timestamp + 92); vm.roll(block.number + 33334); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.assert_canary_ASSERTION_CANARY(4058865182498799307776958) {} catch {}
        vm.warp(block.timestamp + 43); vm.roll(block.number + 60442); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantAmtPerSecVsMinAmtPerSec(8, 64430149531586259499850495565258571013261282897398864681025610350654157905387) {} catch {}
        vm.warp(block.timestamp + 99); vm.roll(block.number + 9298);
        vm.warp(block.timestamp + 3); vm.roll(block.number + 16413); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamBalanceWithClamping(4, 20) {} catch {}
        vm.warp(block.timestamp + 89); vm.roll(block.number + 194); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamBalanceShouldNotRevert(95, 29339784305381648428605686273758251629) {} catch {}
        vm.warp(block.timestamp + 96); vm.roll(block.number + 3190); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueeze(6, 16) {} catch {}
        vm.warp(block.timestamp + 30); vm.roll(block.number + 29312);
        vm.warp(block.timestamp + 19); vm.roll(block.number + 396); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsViewVsActual(16, 1524789641) {} catch {}
        vm.warp(block.timestamp + 56); vm.roll(block.number + 9973); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreams(112, 562633) {} catch {}
        vm.warp(block.timestamp + 63); vm.roll(block.number + 30304);
        vm.warp(block.timestamp + 56); vm.roll(block.number + 4290); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalanceWithClamping(80, 38771147269870882453424697231405390501) {} catch {}
        vm.warp(block.timestamp + 55); vm.roll(block.number + 3160); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetSplitsShouldNotRevert(209, 4, 1524786678) {} catch {}
        vm.warp(block.timestamp + 67); vm.roll(block.number + 34712);
        vm.warp(block.timestamp + 43); vm.roll(block.number + 2885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetStreamBalanceWithdrawAllShouldNotRevert(40) {} catch {}
        vm.warp(block.timestamp + 2); vm.roll(block.number + 10626); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamBalanceShouldNotRevert(70, 109355856789939436426639574937480697808) {} catch {}
        vm.warp(block.timestamp + 48); vm.roll(block.number + 36700); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollectShouldNotRevert(252, 16) {} catch {}
        vm.warp(block.timestamp + 77); vm.roll(block.number + 313); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueeze(166, 212) {} catch {}
        vm.warp(block.timestamp + 51); vm.roll(block.number + 1370);
        vm.warp(block.timestamp + 52); vm.roll(block.number + 45269); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testAddStreamShouldNotRevert(148, 141, 131, 1384972711, 731105148, 78469781680240007522481290616048675197) {} catch {}
        vm.warp(block.timestamp + 89); vm.roll(block.number + 60251);
        vm.warp(block.timestamp + 99); vm.roll(block.number + 382); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeToSelf(12) {} catch {}
        vm.warp(block.timestamp + 50); vm.roll(block.number + 16658);
        vm.warp(block.timestamp + 99); vm.roll(block.number + 55295); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamBalanceWithdrawAllShouldNotRevert(167) {} catch {}
        vm.warp(block.timestamp + 83); vm.roll(block.number + 49280); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetStreamBalanceWithdrawAllShouldNotRevert(197) {} catch {}
        vm.warp(block.timestamp + 75); vm.roll(block.number + 16089); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsShouldNotRevert(246) {} catch {}
        vm.warp(block.timestamp + 67); vm.roll(block.number + 35862); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.split(192) {} catch {}
        vm.warp(block.timestamp + 13); vm.roll(block.number + 44210); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testAddStreamShouldNotRevert(17, 10, 294810115530255107444845081530391185049735628344, 1524790650, 219092710, -3999999999999999999999999997) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 11234); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(5, 19) {} catch {}
        vm.warp(block.timestamp + 12); vm.roll(block.number + 1286); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.giveClampedAmount(157, 100, 1807475283757494572290015891) {} catch {}
        vm.warp(block.timestamp + 21); vm.roll(block.number + 43821); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setStreamBalanceWithClamping(11, 20756713826333667334112614390104094790) {} catch {}
        vm.warp(block.timestamp + 37); vm.roll(block.number + 17445);
        vm.warp(block.timestamp + 56); vm.roll(block.number + 2496); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreamsViewConsistency(103, 1934945763) {} catch {}
        vm.warp(block.timestamp + 64); vm.roll(block.number + 53618); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.giveClampedAmount(16, 32, 1031517265011925805443366192) {} catch {}
        vm.warp(block.timestamp + 21); vm.roll(block.number + 13325);
        vm.warp(block.timestamp + 98); vm.roll(block.number + 59095); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeToSelf(20) {} catch {}
        vm.warp(block.timestamp + 9); vm.roll(block.number + 2830); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeAllSenders(4) {} catch {}
        vm.warp(block.timestamp + 12); vm.roll(block.number + 53451); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantWithdrawShouldAlwaysFail(94311815437383156596649369563775508851873457445587518552549312231803614286549) {} catch {}
        vm.warp(block.timestamp + 113); vm.roll(block.number + 14929);
        vm.warp(block.timestamp + 68); vm.roll(block.number + 152); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setStreamsWithClamping(65, 162, 103, 4087851692, 1524787170, 24388683780030357098209461828445621437) {} catch {}
        vm.warp(block.timestamp + 53); vm.roll(block.number + 57536); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.receiveStreams(195, 842398) {} catch {}
        vm.warp(block.timestamp + 66); vm.roll(block.number + 12338); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeWithDefaultHistory(114, 158) {} catch {}
        vm.warp(block.timestamp + 26); vm.roll(block.number + 3963);
        vm.warp(block.timestamp + 39); vm.roll(block.number + 19221); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.splitAndCollectToSelf(11) {} catch {}
        vm.warp(block.timestamp + 95); vm.roll(block.number + 18204); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addStream(195, 76, 170141183460469231731687303715884105727, 1571594226, 3137998162, 999999998) {} catch {}
        vm.warp(block.timestamp + 182); vm.roll(block.number + 54728);
        vm.warp(block.timestamp + 27); vm.roll(block.number + 48592); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueeze(34, 13) {} catch {}
        vm.warp(block.timestamp + 66); vm.roll(block.number + 1720); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalanceWithdrawAll(5) {} catch {}
        vm.warp(block.timestamp + 34); vm.roll(block.number + 5515); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setStreamBalanceWithClamping(93, 33109786352013985732601178362371564328) {} catch {}
        vm.warp(block.timestamp + 71); vm.roll(block.number + 22850);
        vm.warp(block.timestamp + 49); vm.roll(block.number + 157); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeAllSenders(8) {} catch {}
        vm.warp(block.timestamp + 61); vm.roll(block.number + 6419);
        vm.warp(block.timestamp + 40); vm.roll(block.number + 14753); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamBalanceWithdrawAll(29) {} catch {}
        vm.warp(block.timestamp + 53); vm.roll(block.number + 31044); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setMaxEndHints(861314337, 1130878611) {} catch {}
        vm.warp(block.timestamp + 60); vm.roll(block.number + 10915); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeAllSenders(62) {} catch {}
        vm.warp(block.timestamp + 54); vm.roll(block.number + 2740); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testCollectShouldNotRevert(101, 19) {} catch {}
        vm.warp(block.timestamp + 61); vm.roll(block.number + 20565); vm.prank(address(0x0000000000000000000000000000000000010000)); t.testSetStreamsShouldNotRevert(103, 122, 33, 599173088, 193, -999999999999999999999999998);
    }
    // i-0a6a8a9d574c3af9e-echidna-v2.3.2: testSqueezableAmountCantBeUndone (91 calls)
    function test_19_testSqueezableAmountCantBeUndone() public {
        vm.warp(block.timestamp + 49); vm.roll(block.number + 9); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testGiveShouldNotRevert(160, 21, 1524785993) {} catch {}
        vm.warp(block.timestamp + 90); vm.roll(block.number + 15590);
        vm.warp(block.timestamp + 80); vm.roll(block.number + 484); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setMaxEndHints(932175006, 1000000002) {} catch {}
        vm.warp(block.timestamp + 3); vm.roll(block.number + 35676);
        vm.warp(block.timestamp + 47); vm.roll(block.number + 5006); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.removeAllSplits(30) {} catch {}
        vm.warp(block.timestamp + 42); vm.roll(block.number + 198); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplittableAfterSplit(137) {} catch {}
        vm.warp(block.timestamp + 18); vm.roll(block.number + 487);
        vm.warp(block.timestamp + 43); vm.roll(block.number + 30784); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addStreamImmediatelySqueezable(252, 221, 129) {} catch {}
        vm.warp(block.timestamp + 44); vm.roll(block.number + 1002); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiversReceivedSplit(161) {} catch {}
        vm.warp(block.timestamp + 35); vm.roll(block.number + 49528); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testGiveShouldNotRevert(234, 132, 523) {} catch {}
        vm.warp(block.timestamp + 13); vm.roll(block.number + 561); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setStreamBalance(203, 193) {} catch {}
        vm.warp(block.timestamp + 94); vm.roll(block.number + 18429); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollectShouldNotRevert(203, 0) {} catch {}
        vm.warp(block.timestamp + 91); vm.roll(block.number + 36804); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.collect(221, 84) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 4962); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.receiveStreamsAllCycles(126) {} catch {}
        vm.warp(block.timestamp + 20); vm.roll(block.number + 4960);
        vm.warp(block.timestamp + 91); vm.roll(block.number + 1023); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezableAmountCantBeWithdrawn(175, 85) {} catch {}
        vm.warp(block.timestamp + 15); vm.roll(block.number + 11); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.collect(103, 192) {} catch {}
        vm.warp(block.timestamp + 97); vm.roll(block.number + 58360); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsShouldNotRevert(0) {} catch {}
        vm.warp(block.timestamp + 23); vm.roll(block.number + 49527); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addSplitsReceiverWithClamping(94, 223, 2140345981) {} catch {}
        vm.warp(block.timestamp + 4); vm.roll(block.number + 35677);
        vm.warp(block.timestamp + 45); vm.roll(block.number + 42104); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplittableAfterSplit(136) {} catch {}
        vm.warp(block.timestamp + 19); vm.roll(block.number + 5014); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetSplitsShouldNotRevert(0, 74, 7) {} catch {}
        vm.warp(block.timestamp + 22); vm.roll(block.number + 30043); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testCollectShouldNotRevert(73, 104) {} catch {}
        vm.warp(block.timestamp + 64); vm.roll(block.number + 4930); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addStreamImmediatelySqueezable(192, 9, 4370001) {} catch {}
        vm.warp(block.timestamp + 49); vm.roll(block.number + 7146); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreams(252, 4266018915) {} catch {}
        vm.warp(block.timestamp + 13); vm.roll(block.number + 15979); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetStreamBalanceWithdrawAllShouldNotRevert(200) {} catch {}
        vm.warp(block.timestamp + 13); vm.roll(block.number + 24987); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezableAmountCantBeWithdrawn(4, 42) {} catch {}
        vm.warp(block.timestamp + 13); vm.roll(block.number + 51619);
        vm.warp(block.timestamp + 4); vm.roll(block.number + 9920); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.collect(46, 20) {} catch {}
        vm.warp(block.timestamp + 44); vm.roll(block.number + 13112); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testAddStreamShouldNotRevert(253, 216, 4000000000000000000000000003, 65, 2305971484, -999997) {} catch {}
        vm.warp(block.timestamp + 29); vm.roll(block.number + 32307); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 44); vm.roll(block.number + 4825); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 21); vm.roll(block.number + 30040); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addStreamWithClamping(96, 81, 4294967295, 894732317, 129, -11) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 4027); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testCollect(78, 32) {} catch {}
        vm.warp(block.timestamp + 97); vm.roll(block.number + 4462); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeViewVsActual(254, 194) {} catch {}
        vm.warp(block.timestamp + 43); vm.roll(block.number + 4867); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.collectToSelf(22) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 12155); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamsShouldNotRevert(14, 202, 910, 102, 2936909737, 137125438382087309276750694984630390523) {} catch {}
        vm.warp(block.timestamp + 9); vm.roll(block.number + 126);
        vm.warp(block.timestamp + 37); vm.roll(block.number + 18429); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.removeAllSplits(204) {} catch {}
        vm.warp(block.timestamp + 82); vm.roll(block.number + 53562); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testAddSplitsShouldNotRevert(22, 17, 2890687091) {} catch {}
        vm.warp(block.timestamp + 37); vm.roll(block.number + 221); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollectableAfterSplit(33) {} catch {}
        vm.warp(block.timestamp + 75); vm.roll(block.number + 194); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testAddStreamShouldNotRevert(244, 189, 360773603792446787472320651132621488760376172300, 198, 440668566, -101) {} catch {}
        vm.warp(block.timestamp + 52); vm.roll(block.number + 202); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(103) {} catch {}
        vm.warp(block.timestamp + 32); vm.roll(block.number + 5306); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.addStream(191, 219, 646016397113820074285538011273478322569030514399, 1063605420, 3634060339, -226) {} catch {}
        vm.warp(block.timestamp + 66); vm.roll(block.number + 38131); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addStreamWithClamping(69, 111, 971326702147313236582868197357150232245612371100, 4178500464, 1524786984, -100) {} catch {}
        vm.warp(block.timestamp + 37); vm.roll(block.number + 113); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(97) {} catch {}
        vm.warp(block.timestamp + 4); vm.roll(block.number + 7323); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setStreamsWithClamping(6, 22, 923954711614599688172073421763198021298646050406, 1524788727, 3470453904, -63) {} catch {}
        vm.warp(block.timestamp + 52); vm.roll(block.number + 1200); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetSplitsShouldNotRevert(231, 73, 2167991247) {} catch {}
        vm.warp(block.timestamp + 8); vm.roll(block.number + 3590); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.giveClampedAmount(54, 254, 197973864177317269038961193282727140757) {} catch {}
        vm.warp(block.timestamp + 18); vm.roll(block.number + 3840); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 94); vm.roll(block.number + 4027);
        vm.warp(block.timestamp + 3); vm.roll(block.number + 15976); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantAmtPerSecVsMinAmtPerSec(63, 88429483143413880330663702955194579115841936178459497695329747763240843078108) {} catch {}
        vm.warp(block.timestamp + 79); vm.roll(block.number + 44602); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamsWithClamping(101, 10, 767513185252752545083306853521460382901105879033, 1814247798, 4294967291, -158) {} catch {}
        vm.warp(block.timestamp + 68); vm.roll(block.number + 487); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsShouldNotRevert(38) {} catch {}
        vm.warp(block.timestamp + 91); vm.roll(block.number + 4993); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.receiveStreams(29, 125) {} catch {}
        vm.warp(block.timestamp + 38); vm.roll(block.number + 487); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.split(195) {} catch {}
        vm.warp(block.timestamp + 36); vm.roll(block.number + 28695); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezableVsReceived(97) {} catch {}
        vm.warp(block.timestamp + 75); vm.roll(block.number + 4540); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addSplitsReceiverWithClamping(157, 87, 4294967294) {} catch {}
        vm.warp(block.timestamp + 80); vm.roll(block.number + 8); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.removeAllSplits(129) {} catch {}
        vm.warp(block.timestamp + 25); vm.roll(block.number + 4929); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalance(171, 1027) {} catch {}
        vm.warp(block.timestamp + 41); vm.roll(block.number + 34720);
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithDefaultHistory(14, 34) {} catch {}
        vm.warp(block.timestamp + 4); vm.roll(block.number + 15369); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setStreamsWithClamping(148, 0, 223, 1368064159, 918614615, 7) {} catch {}
        vm.warp(block.timestamp + 14); vm.roll(block.number + 28695); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezableVsReceived(199) {} catch {}
        vm.warp(block.timestamp + 23); vm.roll(block.number + 4798); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.receiveStreamsAllCycles(47) {} catch {}
        vm.warp(block.timestamp + 58); vm.roll(block.number + 3082); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.give(222, 100, 65) {} catch {}
        vm.warp(block.timestamp + 44); vm.roll(block.number + 999); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreams(37, 491159178) {} catch {}
        vm.warp(block.timestamp + 33); vm.roll(block.number + 35157); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setStreamsWithClamping(159, 172, 1524785992, 2084227430, 4294967295, 162540346822329674083228942870327655872) {} catch {}
        vm.warp(block.timestamp + 25); vm.roll(block.number + 35466);
        vm.warp(block.timestamp + 43); vm.roll(block.number + 1002); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamBalanceWithdrawAllShouldNotRevert(78) {} catch {}
        vm.warp(block.timestamp + 22); vm.roll(block.number + 46691); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.receiveStreamsSplitAndCollectToSelf(99) {} catch {}
        vm.warp(block.timestamp + 55); vm.roll(block.number + 22333); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsShouldNotRevert(199) {} catch {}
        vm.warp(block.timestamp + 6); vm.roll(block.number + 30040); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeWithFuzzedHistoryShouldNotRevert(36, 131, 9775871669777603496782107076828497367643883725484942041034574522116637829838, bytes32(0x06484193d67d58d6fc6122c72db35868c48aba26a06ccd30acd29665fe10b5b5)) {} catch {}
        vm.warp(block.timestamp + 4); vm.roll(block.number + 42098); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantWithdrawShouldAlwaysFail(1524785991) {} catch {}
        vm.warp(block.timestamp + 99); vm.roll(block.number + 42099);
        vm.warp(block.timestamp + 16); vm.roll(block.number + 2497); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testRemoveStreamShouldNotRevert(62, 4370001) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 42100);
        vm.warp(block.timestamp + 36); vm.roll(block.number + 58824); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezableAmountCantBeWithdrawn(202, 39) {} catch {}
        vm.warp(block.timestamp + 25); vm.roll(block.number + 4867); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setSplitsWithClamping(197, 193, 96) {} catch {}
        vm.warp(block.timestamp + 19); vm.roll(block.number + 100);
        vm.warp(block.timestamp + 62); vm.roll(block.number + 35157); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.receiveStreams(106, 41394461) {} catch {}
        vm.warp(block.timestamp + 56); vm.roll(block.number + 15978); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamBalanceShouldNotRevert(110, -1000000003) {} catch {}
        vm.warp(block.timestamp + 19); vm.roll(block.number + 24311); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeTwice(251, 248, 115792089237316195423570985008687907853269984665640564039457584007913129639779, bytes32(0x38f76daa3fa476ea1a150643f7968fd75e589608c368a21f62876d73083028a0)) {} catch {}
        vm.warp(block.timestamp + 57); vm.roll(block.number + 32); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.removeStream(181, 45745441203976361264000692840962547204409189142007921943816164817835636189067) {} catch {}
        vm.warp(block.timestamp + 26); vm.roll(block.number + 4539); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.collect(128, 3) {} catch {}
        vm.warp(block.timestamp + 22); vm.roll(block.number + 42099); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(94, 157) {} catch {}
        vm.warp(block.timestamp + 57); vm.roll(block.number + 42102); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.splitAndCollectToSelf(31) {} catch {}
        vm.warp(block.timestamp + 8); vm.roll(block.number + 4992); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantWithdrawShouldAlwaysFail(22733055402626425691043120579402324569727718991980362153312200658260057700585) {} catch {}
        vm.warp(block.timestamp + 95); vm.roll(block.number + 1025);
        vm.warp(block.timestamp + 5); vm.roll(block.number + 484); vm.prank(address(0x0000000000000000000000000000000000010000)); t.testSqueezableAmountCantBeUndone(31, 38, 648032827152965050312640408560154796124449185332, 238771386, 1768817014, 97);
    }
    // i-0a6a8a9d574c3af9e-echidna-v2.3.2: testReceiveStreamsShouldNotRevert (74 calls)
    function test_20_testReceiveStreamsShouldNotRevert() public {
        vm.warp(block.timestamp + 52); vm.roll(block.number + 3084); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.receiveStreamsAllCycles(198) {} catch {}
        vm.warp(block.timestamp + 79); vm.roll(block.number + 22559); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.assert_canary_ASSERTION_CANARY(53172715341554933999704397495369473226902471951737366841198867884786709814136) {} catch {}
        vm.warp(block.timestamp + 69); vm.roll(block.number + 574); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezableAmountCantBeWithdrawn(98, 168) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 66); vm.roll(block.number + 46637); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addSplitsReceiver(112, 249, 15205) {} catch {}
        vm.warp(block.timestamp + 27); vm.roll(block.number + 1157);
        vm.warp(block.timestamp + 65); vm.roll(block.number + 60199); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamsWithClamping(19, 163, 99, 4282591722, 1524789841, 169160887538253517794947104676929572352) {} catch {}
        vm.warp(block.timestamp + 67); vm.roll(block.number + 55999); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollectableAfterSplit(128) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 1026); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplittableAfterSplit(252) {} catch {}
        vm.warp(block.timestamp + 68); vm.roll(block.number + 44191); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsShouldNotRevert(71) {} catch {}
        vm.warp(block.timestamp + 133); vm.roll(block.number + 16438);
        vm.warp(block.timestamp + 42); vm.roll(block.number + 51953); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamsWithClamping(12, 58, 97, 995, 1070172970, 3999999999999999999999999997) {} catch {}
        vm.warp(block.timestamp + 53); vm.roll(block.number + 12669); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewConsistency(94, 46780489) {} catch {}
        vm.warp(block.timestamp + 27); vm.roll(block.number + 624); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeWithFullyHashedHistory(64, 57) {} catch {}
        vm.warp(block.timestamp + 33); vm.roll(block.number + 1706); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 73); vm.roll(block.number + 14941); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(212, 93) {} catch {}
        vm.warp(block.timestamp + 30); vm.roll(block.number + 60318); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithDefaultHistory(254, 125) {} catch {}
        vm.warp(block.timestamp + 77); vm.roll(block.number + 49474); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalanceWithClamping(202, 136066180723754564823007400868853906754) {} catch {}
        vm.warp(block.timestamp + 33); vm.roll(block.number + 23568);
        vm.warp(block.timestamp + 20); vm.roll(block.number + 58078); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsShouldNotRevert(94) {} catch {}
        vm.warp(block.timestamp + 35); vm.roll(block.number + 41952); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 50); vm.roll(block.number + 2175);
        vm.warp(block.timestamp + 92); vm.roll(block.number + 33334); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.assert_canary_ASSERTION_CANARY(4058865182498799307776958) {} catch {}
        vm.warp(block.timestamp + 43); vm.roll(block.number + 60442); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantAmtPerSecVsMinAmtPerSec(8, 64430149531586259499850495565258571013261282897398864681025610350654157905387) {} catch {}
        vm.warp(block.timestamp + 99); vm.roll(block.number + 9298);
        vm.warp(block.timestamp + 3); vm.roll(block.number + 16413); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamBalanceWithClamping(4, 20) {} catch {}
        vm.warp(block.timestamp + 89); vm.roll(block.number + 194); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamBalanceShouldNotRevert(95, 29339784305381648428605686273758251629) {} catch {}
        vm.warp(block.timestamp + 96); vm.roll(block.number + 3190); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueeze(6, 16) {} catch {}
        vm.warp(block.timestamp + 30); vm.roll(block.number + 29312);
        vm.warp(block.timestamp + 19); vm.roll(block.number + 396); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsViewVsActual(16, 1524789641) {} catch {}
        vm.warp(block.timestamp + 63); vm.roll(block.number + 30304);
        vm.warp(block.timestamp + 56); vm.roll(block.number + 4290); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalanceWithClamping(80, 38771147269870882453424697231405390501) {} catch {}
        vm.warp(block.timestamp + 55); vm.roll(block.number + 3160); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetSplitsShouldNotRevert(209, 4, 1524786678) {} catch {}
        vm.warp(block.timestamp + 67); vm.roll(block.number + 34712);
        vm.warp(block.timestamp + 43); vm.roll(block.number + 2885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetStreamBalanceWithdrawAllShouldNotRevert(40) {} catch {}
        vm.warp(block.timestamp + 2); vm.roll(block.number + 10626); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamBalanceShouldNotRevert(70, 109355856789939436426639574937480697808) {} catch {}
        vm.warp(block.timestamp + 48); vm.roll(block.number + 36700); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollectShouldNotRevert(252, 16) {} catch {}
        vm.warp(block.timestamp + 77); vm.roll(block.number + 313); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueeze(166, 212) {} catch {}
        vm.warp(block.timestamp + 51); vm.roll(block.number + 1370);
        vm.warp(block.timestamp + 52); vm.roll(block.number + 45269); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testAddStreamShouldNotRevert(148, 141, 131, 1384972711, 731105148, 78469781680240007522481290616048675197) {} catch {}
        vm.warp(block.timestamp + 89); vm.roll(block.number + 60251);
        vm.warp(block.timestamp + 99); vm.roll(block.number + 382); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeToSelf(12) {} catch {}
        vm.warp(block.timestamp + 50); vm.roll(block.number + 16658);
        vm.warp(block.timestamp + 99); vm.roll(block.number + 55295); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamBalanceWithdrawAllShouldNotRevert(167) {} catch {}
        vm.warp(block.timestamp + 83); vm.roll(block.number + 49280); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetStreamBalanceWithdrawAllShouldNotRevert(197) {} catch {}
        vm.warp(block.timestamp + 75); vm.roll(block.number + 16089); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsShouldNotRevert(246) {} catch {}
        vm.warp(block.timestamp + 67); vm.roll(block.number + 35862); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.split(192) {} catch {}
        vm.warp(block.timestamp + 13); vm.roll(block.number + 44210); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testAddStreamShouldNotRevert(17, 10, 294810115530255107444845081530391185049735628344, 1524790650, 219092710, -3999999999999999999999999997) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 11234); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(5, 19) {} catch {}
        vm.warp(block.timestamp + 11); vm.roll(block.number + 25042); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeToSelf(22) {} catch {}
        vm.warp(block.timestamp + 29); vm.roll(block.number + 31549);
        vm.warp(block.timestamp + 100); vm.roll(block.number + 2690); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.giveClampedAmount(123, 225, 179934971132622994397935754020842200547) {} catch {}
        vm.warp(block.timestamp + 85); vm.roll(block.number + 47219); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setSplitsWithClamping(103, 205, 4294967293) {} catch {}
        vm.warp(block.timestamp + 30); vm.roll(block.number + 899); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeWithFuzzedHistory(190, 216, 71000397130344172751104232351252149998880006397944443011995199681246026026473, bytes32(0x74f31faebd89b43d556dea07667ab02cbdddddf1651ea9fa793f81465637d042)) {} catch {}
        vm.warp(block.timestamp + 58); vm.roll(block.number + 58013);
        vm.warp(block.timestamp + 15); vm.roll(block.number + 9827); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testRemoveStreamShouldNotRevert(9, 33048860383849004559742813297059419343339852917517107368639918720169455489347) {} catch {}
        vm.warp(block.timestamp + 71); vm.roll(block.number + 1418); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.splitAndCollectToSelf(1) {} catch {}
        vm.warp(block.timestamp + 11); vm.roll(block.number + 4023); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setSplitsWithClamping(74, 20, 2618622771) {} catch {}
        vm.warp(block.timestamp + 67); vm.roll(block.number + 1149); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSplittableAfterSplit(223) {} catch {}
        vm.warp(block.timestamp + 70); vm.roll(block.number + 59132); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSplitViewVsActual(116) {} catch {}
        vm.warp(block.timestamp + 53); vm.roll(block.number + 24792); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeViewVsActual(102, 30) {} catch {}
        vm.warp(block.timestamp + 67); vm.roll(block.number + 11707); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setMaxEndHints(28, 2895094493) {} catch {}
        vm.warp(block.timestamp + 87); vm.roll(block.number + 76991);
        vm.warp(block.timestamp + 87); vm.roll(block.number + 39072); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamBalanceWithdrawAllShouldNotRevert(214) {} catch {}
        vm.warp(block.timestamp + 33); vm.roll(block.number + 31746);
        vm.warp(block.timestamp + 11); vm.roll(block.number + 52460); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addSplitsReceiverWithClamping(85, 194, 1524788961) {} catch {}
        vm.warp(block.timestamp + 7); vm.roll(block.number + 54597); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetSplitsShouldNotRevert(157, 168, 2444346428) {} catch {}
        vm.warp(block.timestamp + 2); vm.roll(block.number + 1988); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamBalanceWithdrawAllShouldNotRevert(33) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 28905); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.addStreamWithClamping(88, 254, 224, 46, 3270521182, 161255753969493769724648551352166470909) {} catch {}
        vm.warp(block.timestamp + 89); vm.roll(block.number + 52773); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithFuzzedHistory(168, 10, 65638264176249188344901656289807949815411616382871496360789058184154294730790, bytes32(0x10c687d484090df17e61a07844c24216819f39b2440b61c0fa4b34e540bac8a7)) {} catch {}
        vm.warp(block.timestamp + 44); vm.roll(block.number + 725);
        vm.warp(block.timestamp + 59); vm.roll(block.number + 235); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.addStreamWithClamping(74, 221, 1132638753358248254807024276757197182837708803245, 1524788270, 1524786413, 136618673196946471171682129958652642238) {} catch {}
        vm.warp(block.timestamp + 27); vm.roll(block.number + 47343); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalanceWithdrawAll(60) {} catch {}
        vm.warp(block.timestamp + 33); vm.roll(block.number + 2927); vm.prank(address(0x0000000000000000000000000000000000010000)); t.testReceiveStreamsShouldNotRevert(15);
    }
    // i-0a6a8a9d574c3af9e-echidna-v2.3.2: testSqueezeWithFuzzedHistoryShouldNotRevert (40 calls)
    function test_21_testSqueezeWithFuzzedHistoryShouldNotRevert() public {
        vm.warp(block.timestamp + 52); vm.roll(block.number + 3084); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.receiveStreamsAllCycles(198) {} catch {}
        vm.warp(block.timestamp + 79); vm.roll(block.number + 22559); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.assert_canary_ASSERTION_CANARY(53172715341554933999704397495369473226902471951737366841198867884786709814136) {} catch {}
        vm.warp(block.timestamp + 69); vm.roll(block.number + 574); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezableAmountCantBeWithdrawn(98, 168) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 66); vm.roll(block.number + 46637); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addSplitsReceiver(112, 249, 15205) {} catch {}
        vm.warp(block.timestamp + 18); vm.roll(block.number + 59139); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplittableAfterSplit(132) {} catch {}
        vm.warp(block.timestamp + 16); vm.roll(block.number + 19067); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testGiveShouldNotRevert(94, 230, 8018264674080074566) {} catch {}
        vm.warp(block.timestamp + 89); vm.roll(block.number + 33445);
        vm.warp(block.timestamp + 61); vm.roll(block.number + 45930); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezableAmountCantBeUndone(226, 125, 496230611042958130502372924148710683816404218422, 573127934, 1524789281, 211671511378556961264236638) {} catch {}
        vm.warp(block.timestamp + 31); vm.roll(block.number + 9323);
        vm.warp(block.timestamp + 86); vm.roll(block.number + 33328); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.removeAllSplits(232) {} catch {}
        vm.warp(block.timestamp + 23); vm.roll(block.number + 54035); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setMaxEndHints(276, 4294967293) {} catch {}
        vm.warp(block.timestamp + 9); vm.roll(block.number + 3699); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezableAmountCantBeWithdrawn(194, 243) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 6078); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addStreamWithClamping(161, 0, 198, 4170604054, 226351, 1607068578154592360656732241) {} catch {}
        vm.warp(block.timestamp + 98); vm.roll(block.number + 1003);
        vm.warp(block.timestamp + 51); vm.roll(block.number + 65); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsViewVsActual(21, 355957914) {} catch {}
        vm.warp(block.timestamp + 97); vm.roll(block.number + 29603);
        vm.warp(block.timestamp + 29); vm.roll(block.number + 50406); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetStreamBalanceWithdrawAllShouldNotRevert(163) {} catch {}
        vm.warp(block.timestamp + 72); vm.roll(block.number + 28462); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeViewVsActual(143, 10) {} catch {}
        vm.warp(block.timestamp + 52); vm.roll(block.number + 2375); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(100, 238) {} catch {}
        vm.warp(block.timestamp + 54); vm.roll(block.number + 30070); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testCollect(11, 202) {} catch {}
        vm.warp(block.timestamp + 19); vm.roll(block.number + 1851);
        vm.warp(block.timestamp + 6); vm.roll(block.number + 4306); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezableVsReceived(126) {} catch {}
        vm.warp(block.timestamp + 67); vm.roll(block.number + 1161); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.receiveStreamsSplitAndCollectToSelf(254) {} catch {}
        vm.warp(block.timestamp + 155); vm.roll(block.number + 43320);
        vm.warp(block.timestamp + 49); vm.roll(block.number + 36293); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setSplitsWithClamping(220, 224, 606199071) {} catch {}
        vm.warp(block.timestamp + 75); vm.roll(block.number + 17407);
        vm.warp(block.timestamp + 40); vm.roll(block.number + 53787); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.assert_canary_ASSERTION_CANARY(1863121102653348992386072599) {} catch {}
        vm.warp(block.timestamp + 62); vm.roll(block.number + 37794); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezableAmountCantBeUndone(114, 203, 16608807294682772138217478049654949579345573121, 10648434, 4294967294, -13) {} catch {}
        vm.warp(block.timestamp + 90); vm.roll(block.number + 827); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(10, 68) {} catch {}
        vm.warp(block.timestamp + 83); vm.roll(block.number + 23196); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeWithFullyHashedHistory(209, 31) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 3521); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testAddSplitsShouldNotRevert(32, 249, 594210574) {} catch {}
        vm.warp(block.timestamp + 14); vm.roll(block.number + 24613); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetStreamBalanceShouldNotRevert(133, 641584274638815503520919325) {} catch {}
        vm.warp(block.timestamp + 20); vm.roll(block.number + 2188); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.splitAndCollectToSelf(226) {} catch {}
        vm.warp(block.timestamp + 56); vm.roll(block.number + 16811); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(126) {} catch {}
        vm.warp(block.timestamp + 9); vm.roll(block.number + 51094); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.collectToSelf(198) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 39); vm.roll(block.number + 49583); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 75); vm.roll(block.number + 36644); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.addStreamWithClamping(103, 223, 997, 1524787524, 1524787899, 111147279057816239403244802796902073869) {} catch {}
        vm.warp(block.timestamp + 5); vm.roll(block.number + 21181); vm.prank(address(0x0000000000000000000000000000000000040000)); t.testSqueezeWithFuzzedHistoryShouldNotRevert(238, 98, 115792089237316195423570985008687907853269984665640564039457584007913129639806, bytes32(0x776974686472617720616d6f756e74206d757374206265203e20300000000000));
    }
    // i-0a6a8a9d574c3af9e-echidna-v2.3.2: testSetStreamBalanceWithdrawAllShouldNotRevert (93 calls)
    function test_22_testSetStreamBalanceWithdrawAllShouldNotRevert() public {
        vm.warp(block.timestamp + 52); vm.roll(block.number + 3084); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.receiveStreamsAllCycles(198) {} catch {}
        vm.warp(block.timestamp + 79); vm.roll(block.number + 22559); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.assert_canary_ASSERTION_CANARY(53172715341554933999704397495369473226902471951737366841198867884786709814136) {} catch {}
        vm.warp(block.timestamp + 69); vm.roll(block.number + 574); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezableAmountCantBeWithdrawn(98, 168) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 66); vm.roll(block.number + 46637); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addSplitsReceiver(112, 249, 15205) {} catch {}
        vm.warp(block.timestamp + 27); vm.roll(block.number + 1157);
        vm.warp(block.timestamp + 65); vm.roll(block.number + 60199); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamsWithClamping(19, 163, 99, 4282591722, 1524789841, 169160887538253517794947104676929572352) {} catch {}
        vm.warp(block.timestamp + 67); vm.roll(block.number + 55999); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollectableAfterSplit(128) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 1026); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplittableAfterSplit(252) {} catch {}
        vm.warp(block.timestamp + 68); vm.roll(block.number + 44191); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsShouldNotRevert(71) {} catch {}
        vm.warp(block.timestamp + 133); vm.roll(block.number + 16438);
        vm.warp(block.timestamp + 42); vm.roll(block.number + 51953); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamsWithClamping(12, 58, 97, 995, 1070172970, 3999999999999999999999999997) {} catch {}
        vm.warp(block.timestamp + 53); vm.roll(block.number + 12669); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewConsistency(94, 46780489) {} catch {}
        vm.warp(block.timestamp + 27); vm.roll(block.number + 624); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeWithFullyHashedHistory(64, 57) {} catch {}
        vm.warp(block.timestamp + 33); vm.roll(block.number + 1706); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 73); vm.roll(block.number + 14941); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(212, 93) {} catch {}
        vm.warp(block.timestamp + 30); vm.roll(block.number + 60318); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithDefaultHistory(254, 125) {} catch {}
        vm.warp(block.timestamp + 77); vm.roll(block.number + 49474); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalanceWithClamping(202, 136066180723754564823007400868853906754) {} catch {}
        vm.warp(block.timestamp + 33); vm.roll(block.number + 23568);
        vm.warp(block.timestamp + 20); vm.roll(block.number + 58078); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsShouldNotRevert(94) {} catch {}
        vm.warp(block.timestamp + 35); vm.roll(block.number + 41952); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 50); vm.roll(block.number + 2175);
        vm.warp(block.timestamp + 92); vm.roll(block.number + 33334); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.assert_canary_ASSERTION_CANARY(4058865182498799307776958) {} catch {}
        vm.warp(block.timestamp + 43); vm.roll(block.number + 60442); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantAmtPerSecVsMinAmtPerSec(8, 64430149531586259499850495565258571013261282897398864681025610350654157905387) {} catch {}
        vm.warp(block.timestamp + 99); vm.roll(block.number + 9298);
        vm.warp(block.timestamp + 3); vm.roll(block.number + 16413); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamBalanceWithClamping(4, 20) {} catch {}
        vm.warp(block.timestamp + 89); vm.roll(block.number + 194); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamBalanceShouldNotRevert(95, 29339784305381648428605686273758251629) {} catch {}
        vm.warp(block.timestamp + 96); vm.roll(block.number + 3190); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueeze(6, 16) {} catch {}
        vm.warp(block.timestamp + 30); vm.roll(block.number + 29312);
        vm.warp(block.timestamp + 19); vm.roll(block.number + 396); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsViewVsActual(16, 1524789641) {} catch {}
        vm.warp(block.timestamp + 56); vm.roll(block.number + 9973); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreams(112, 562633) {} catch {}
        vm.warp(block.timestamp + 63); vm.roll(block.number + 30304);
        vm.warp(block.timestamp + 56); vm.roll(block.number + 4290); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalanceWithClamping(80, 38771147269870882453424697231405390501) {} catch {}
        vm.warp(block.timestamp + 55); vm.roll(block.number + 3160); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetSplitsShouldNotRevert(209, 4, 1524786678) {} catch {}
        vm.warp(block.timestamp + 67); vm.roll(block.number + 34712);
        vm.warp(block.timestamp + 43); vm.roll(block.number + 2885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetStreamBalanceWithdrawAllShouldNotRevert(40) {} catch {}
        vm.warp(block.timestamp + 2); vm.roll(block.number + 10626); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamBalanceShouldNotRevert(70, 109355856789939436426639574937480697808) {} catch {}
        vm.warp(block.timestamp + 48); vm.roll(block.number + 36700); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollectShouldNotRevert(252, 16) {} catch {}
        vm.warp(block.timestamp + 77); vm.roll(block.number + 313); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueeze(166, 212) {} catch {}
        vm.warp(block.timestamp + 51); vm.roll(block.number + 1370);
        vm.warp(block.timestamp + 52); vm.roll(block.number + 45269); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testAddStreamShouldNotRevert(148, 141, 131, 1384972711, 731105148, 78469781680240007522481290616048675197) {} catch {}
        vm.warp(block.timestamp + 89); vm.roll(block.number + 60251);
        vm.warp(block.timestamp + 99); vm.roll(block.number + 382); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeToSelf(12) {} catch {}
        vm.warp(block.timestamp + 50); vm.roll(block.number + 16658);
        vm.warp(block.timestamp + 99); vm.roll(block.number + 55295); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamBalanceWithdrawAllShouldNotRevert(167) {} catch {}
        vm.warp(block.timestamp + 83); vm.roll(block.number + 49280); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetStreamBalanceWithdrawAllShouldNotRevert(197) {} catch {}
        vm.warp(block.timestamp + 75); vm.roll(block.number + 16089); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsShouldNotRevert(246) {} catch {}
        vm.warp(block.timestamp + 67); vm.roll(block.number + 35862); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.split(192) {} catch {}
        vm.warp(block.timestamp + 13); vm.roll(block.number + 44210); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testAddStreamShouldNotRevert(17, 10, 294810115530255107444845081530391185049735628344, 1524790650, 219092710, -3999999999999999999999999997) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 11234); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(5, 19) {} catch {}
        vm.warp(block.timestamp + 12); vm.roll(block.number + 1286); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.giveClampedAmount(157, 100, 1807475283757494572290015891) {} catch {}
        vm.warp(block.timestamp + 21); vm.roll(block.number + 43821); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setStreamBalanceWithClamping(11, 20756713826333667334112614390104094790) {} catch {}
        vm.warp(block.timestamp + 37); vm.roll(block.number + 17445);
        vm.warp(block.timestamp + 56); vm.roll(block.number + 2496); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreamsViewConsistency(103, 1934945763) {} catch {}
        vm.warp(block.timestamp + 64); vm.roll(block.number + 53618); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.giveClampedAmount(16, 32, 1031517265011925805443366192) {} catch {}
        vm.warp(block.timestamp + 74); vm.roll(block.number + 58089); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.collectToSelf(31) {} catch {}
        vm.warp(block.timestamp + 24); vm.roll(block.number + 2034); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeViewVsActual(240, 201) {} catch {}
        vm.warp(block.timestamp + 13); vm.roll(block.number + 4033); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.receiveStreamsAllCycles(210) {} catch {}
        vm.warp(block.timestamp + 75); vm.roll(block.number + 819); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiversReceivedSplit(43) {} catch {}
        vm.warp(block.timestamp + 99); vm.roll(block.number + 53267); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.split(91) {} catch {}
        vm.warp(block.timestamp + 10); vm.roll(block.number + 29147); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewVsActual(129, 9483315) {} catch {}
        vm.warp(block.timestamp + 80); vm.roll(block.number + 60434);
        vm.warp(block.timestamp + 52); vm.roll(block.number + 848); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantWithdrawShouldAlwaysFail(37135671067175203349803559798952773182163920285839440908459584896704668569524) {} catch {}
        vm.warp(block.timestamp + 19); vm.roll(block.number + 37855);
        vm.warp(block.timestamp + 10); vm.roll(block.number + 55244); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeToSelf(79) {} catch {}
        vm.warp(block.timestamp + 79); vm.roll(block.number + 20573); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.assert_canary_ASSERTION_CANARY(7510878817339349439036758) {} catch {}
        vm.warp(block.timestamp + 25); vm.roll(block.number + 20758); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.assert_canary_ASSERTION_CANARY(2929035465599922491539698) {} catch {}
        vm.warp(block.timestamp + 96); vm.roll(block.number + 144); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.split(36) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 116);
        vm.warp(block.timestamp + 20); vm.roll(block.number + 229); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezeWithFuzzedHistoryShouldNotRevert(94, 34, 824, bytes32(0xc80be89e4615aa04a3ac6011f46bb7a6fbf4d32033fa2d8a164da933ca45ed6e)) {} catch {}
        vm.warp(block.timestamp + 56); vm.roll(block.number + 610);
        vm.warp(block.timestamp + 42); vm.roll(block.number + 32121); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testRemoveStreamShouldNotRevert(7, 1640) {} catch {}
        vm.warp(block.timestamp + 90); vm.roll(block.number + 922); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeViewVsActual(124, 5) {} catch {}
        vm.warp(block.timestamp + 97); vm.roll(block.number + 20680); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.addSplitsReceiverWithClamping(3, 127, 1524788307) {} catch {}
        vm.warp(block.timestamp + 71); vm.roll(block.number + 9844); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantWithdrawShouldAlwaysFail(681) {} catch {}
        vm.warp(block.timestamp + 45); vm.roll(block.number + 23448); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.give(93, 96, 29492549226518943525971161) {} catch {}
        vm.warp(block.timestamp + 21); vm.roll(block.number + 56245); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.collect(133, 251) {} catch {}
        vm.warp(block.timestamp + 86); vm.roll(block.number + 11345);
        vm.warp(block.timestamp + 49); vm.roll(block.number + 47442); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeWithFuzzedHistoryShouldNotRevert(190, 187, 71962534899951942541720493049321808807000485696684841468300408879464242340943, bytes32(0xead5fdb14da4f91128fe60c1c9447c271c0591b9b346172b77857a9d8dd17cf1)) {} catch {}
        vm.warp(block.timestamp + 35); vm.roll(block.number + 3260); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeWithDefaultHistory(252, 59) {} catch {}
        vm.warp(block.timestamp + 65); vm.roll(block.number + 77303);
        vm.warp(block.timestamp + 97); vm.roll(block.number + 2966); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testBalanceAtInFuture(193, 91, 200) {} catch {}
        vm.warp(block.timestamp + 32); vm.roll(block.number + 2067);
        vm.warp(block.timestamp + 35); vm.roll(block.number + 29226); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamsShouldNotRevert(161, 9, 29, 2270791155, 1524789627, 62289784674864990707929112093977522745) {} catch {}
        vm.warp(block.timestamp + 63); vm.roll(block.number + 169); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeViewVsActual(239, 28) {} catch {}
        vm.warp(block.timestamp + 98); vm.roll(block.number + 50484); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setMaxEndHints(1524790150, 20356) {} catch {}
        vm.warp(block.timestamp + 93); vm.roll(block.number + 9823); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.removeAllSplits(203) {} catch {}
        vm.warp(block.timestamp + 51); vm.roll(block.number + 54612); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsViewConsistency(225, 720641974) {} catch {}
        vm.warp(block.timestamp + 11); vm.roll(block.number + 309);
        vm.warp(block.timestamp + 74); vm.roll(block.number + 25446); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testCollect(0, 203) {} catch {}
        vm.warp(block.timestamp + 95); vm.roll(block.number + 2044); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.split(128) {} catch {}
        vm.warp(block.timestamp + 28); vm.roll(block.number + 51311); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplitViewVsActual(190) {} catch {}
        vm.warp(block.timestamp + 58); vm.roll(block.number + 26018); vm.prank(address(0x0000000000000000000000000000000000010000)); t.testSetStreamBalanceWithdrawAllShouldNotRevert(93);
    }
    // i-0eeac9664aa2ffaf4-recon-v0.4.18: invariantAccountingVsTokenBalance (7 calls)
    function test_23_invariantAccountingVsTokenBalance() public {
        vm.warp(block.timestamp + 168); vm.roll(block.number + 162527); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.addSplitsReceiverWithClamping(12, 0, 665) {} catch {}
        vm.warp(block.timestamp + 562); vm.roll(block.number + 272891); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreams(159, 255, 1145333352462322803382290810029418275299132501613, 839, 4233075658, 381) {} catch {}
        vm.warp(block.timestamp + 741); vm.roll(block.number + 271671); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addStreamImmediatelySqueezable(25, 77, 509801742566568858947906772195430992443666853320) {} catch {}
        vm.warp(block.timestamp + 4); vm.roll(block.number + 27963); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.addStreamImmediatelySqueezable(19, 54, 1461501637330902918203684832716283019655932542974) {} catch {}
        vm.warp(block.timestamp + 325); vm.roll(block.number + 114187); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.splitAndCollectToSelf(128) {} catch {}
        vm.warp(block.timestamp + 77); vm.roll(block.number + 48036); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantWithdrawAllTokens() {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 30784); vm.prank(address(0x0000000000000000000000000000000000010000)); t.invariantAccountingVsTokenBalance();
    }
    // i-0eeac9664aa2ffaf4-recon-v0.4.18: invariantWithdrawAllTokensShouldNotRevert (27 calls)
    function test_24_invariantWithdrawAllTokensShouldNotRevert() public {
        vm.warp(block.timestamp + 74589); vm.roll(block.number + 191594); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testCollect(126, 121) {} catch {}
        vm.warp(block.timestamp + 331); vm.roll(block.number + 94432); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testBalanceAtInFuture(253, 145, 804) {} catch {}
        vm.warp(block.timestamp + 493); vm.roll(block.number + 192660); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testAddStreamShouldNotRevert(250, 153, 5767660161345280498953033849096308411988426587, 1413723248, 237695961, 106686597047380249759535736316520785521) {} catch {}
        vm.warp(block.timestamp + 31); vm.roll(block.number + 26436); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSplitShouldNotRevert(253) {} catch {}
        vm.warp(block.timestamp + 215); vm.roll(block.number + 120404); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.assert_canary_ASSERTION_CANARY(89792499360331591202893013287966619186857880809976777804818583131267605482458) {} catch {}
        vm.warp(block.timestamp + 64); vm.roll(block.number + 44173); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezableVsReceived(222) {} catch {}
        vm.warp(block.timestamp + 149); vm.roll(block.number + 69647); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.split(194) {} catch {}
        vm.warp(block.timestamp + 286); vm.roll(block.number + 7312); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeTwice(1, 22, 65, bytes32(0x8f781f57d4bf3d08d642f45eb9aeb172593b241ed4d47fcd98db43d63061dcc7)) {} catch {}
        vm.warp(block.timestamp + 56831); vm.roll(block.number + 142358); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSplitViewVsActual(152) {} catch {}
        vm.warp(block.timestamp + 226); vm.roll(block.number + 98637); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setStreamBalanceWithdrawAll(187) {} catch {}
        vm.warp(block.timestamp + 77); vm.roll(block.number + 30128); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.assert_canary_ASSERTION_CANARY(68075793576692991266539284286349756250324635792680153239817815438584263923707) {} catch {}
        vm.warp(block.timestamp + 118); vm.roll(block.number + 65828); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addStreamWithClamping(177, 0, 1070108330440575245857363456962195779359998093365, 981641440, 4029929904, 22449448828061269816289865090503845440) {} catch {}
        vm.warp(block.timestamp + 66); vm.roll(block.number + 24253); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.collect(215, 89) {} catch {}
        vm.warp(block.timestamp + 118); vm.roll(block.number + 95957); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.split(237) {} catch {}
        vm.warp(block.timestamp + 93); vm.roll(block.number + 101992); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setStreamsWithClamping(232, 89, 391524502680721371505944339496604597780876678778, 698, 695, 101388111746706149878451433568564448646) {} catch {}
        vm.warp(block.timestamp + 88); vm.roll(block.number + 1015); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreamsViewConsistency(196, 64) {} catch {}
        vm.warp(block.timestamp + 49); vm.roll(block.number + 34022); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeViewVsActual(227, 255) {} catch {}
        vm.warp(block.timestamp + 78881); vm.roll(block.number + 35824); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testGiveShouldNotRevert(227, 0, 60) {} catch {}
        vm.warp(block.timestamp + 400); vm.roll(block.number + 270955); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.assert_canary_ASSERTION_CANARY(220839) {} catch {}
        vm.warp(block.timestamp + 59); vm.roll(block.number + 23555); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollect(199, 250) {} catch {}
        vm.warp(block.timestamp + 69); vm.roll(block.number + 19693); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeTwice(117, 53, 21162102653911427555758782553104306566693902436889082499553683571369450418134, bytes32(0x7ab37c26be96b881bffbf02674a67345b560cd6587830e75ba7e823f91919f01)) {} catch {}
        vm.warp(block.timestamp + 87); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeAllSenders(250) {} catch {}
        vm.warp(block.timestamp + 113); vm.roll(block.number + 59454); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testCollectShouldNotRevert(49, 34) {} catch {}
        vm.warp(block.timestamp + 89); vm.roll(block.number + 36251); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.invariantWithdrawShouldAlwaysFail(115792089237316195423570985008687907853269984665640564039457584007913129639932) {} catch {}
        vm.warp(block.timestamp + 140); vm.roll(block.number + 70705); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setStreamBalanceWithdrawAll(56) {} catch {}
        vm.warp(block.timestamp + 73); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollectableAfterSplit(168) {} catch {}
        vm.warp(block.timestamp + 85); vm.roll(block.number + 21294); vm.prank(address(0x0000000000000000000000000000000000020000)); t.invariantWithdrawAllTokensShouldNotRevert();
    }
    // i-0eeac9664aa2ffaf4-recon-v0.4.18: testAddStreamShouldNotRevert (67 calls)
    function test_25_testAddStreamShouldNotRevert() public {
        vm.warp(block.timestamp + 210); vm.roll(block.number + 61561); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsViewVsActual(145, 365740403) {} catch {}
        vm.warp(block.timestamp + 99); vm.roll(block.number + 15391); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testAddSplitsShouldNotRevert(167, 253, 24) {} catch {}
        vm.warp(block.timestamp + 210); vm.roll(block.number + 138288); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(49, 137) {} catch {}
        vm.warp(block.timestamp + 396); vm.roll(block.number + 142489); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeWithFullyHashedHistory(1, 234) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(5) {} catch {}
        vm.warp(block.timestamp + 94); vm.roll(block.number + 31024); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeWithDefaultHistory(22, 61) {} catch {}
        vm.warp(block.timestamp + 139); vm.roll(block.number + 7998); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addStreamImmediatelySqueezable(220, 98, 68937113809754841293168894055084746761943511007) {} catch {}
        vm.warp(block.timestamp + 13); vm.roll(block.number + 23884); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplittableAfterSplit(201) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 29236); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeViewVsActual(1, 203) {} catch {}
        vm.warp(block.timestamp + 3); vm.roll(block.number + 2952); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.removeAllSplits(1) {} catch {}
        vm.warp(block.timestamp + 46); vm.roll(block.number + 24043); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezableAmountCantBeUndone(31, 18, 727211294678282989736169006209393303446143464012, 1497922046, 2070456189, 13806978348055434996509292) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.removeStream(255, 157) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollectableAfterSplit(76) {} catch {}
        vm.warp(block.timestamp + 10); vm.roll(block.number + 3676); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setMaxEndHints(4186373503, 4294967293) {} catch {}
        vm.warp(block.timestamp + 95); vm.roll(block.number + 64459); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeToSelf(108) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 3600); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollectableAfterSplit(9) {} catch {}
        vm.warp(block.timestamp + 100); vm.roll(block.number + 24193); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiversReceivedSplit(42) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 24104); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setSplitsWithClamping(255, 64, 1320578140) {} catch {}
        vm.warp(block.timestamp + 263); vm.roll(block.number + 7003); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamsShouldNotRevert(36, 251, 333833626360305278019334305229653842751253899120, 506537600, 2346125565, 88884674206469001162768719113195926276) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 27861); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetSplitsShouldNotRevert(65, 2, 3411699135) {} catch {}
        vm.warp(block.timestamp + 73); vm.roll(block.number + 26683); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamsShouldNotRevert(7, 110, 661849533744515212629509194194340902105080838736, 2773162720, 858830837, 0) {} catch {}
        vm.warp(block.timestamp + 5); vm.roll(block.number + 56616); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeAllSenders(19) {} catch {}
        vm.warp(block.timestamp + 222); vm.roll(block.number + 50021); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithDefaultHistory(192, 53) {} catch {}
        vm.warp(block.timestamp + 13); vm.roll(block.number + 1581); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addSplitsReceiverWithClamping(151, 0, 4294967293) {} catch {}
        vm.warp(block.timestamp + 38); vm.roll(block.number + 35763); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreams(207, 2296224792) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(235) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addStreamWithClamping(203, 253, 198009099726297476247238098620965368048058077, 3759208245, 742, 464) {} catch {}
        vm.warp(block.timestamp + 119); vm.roll(block.number + 60821); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamBalanceShouldNotRevert(0, 528412276163456835895194369) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 1136); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(11, 144) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreams(123, 220, 1269546092604498896625338672058614076615425539841, 4, 140, 355404092644037512062267352) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplittableAfterSplit(0) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamsShouldNotRevert(78, 0, 42096388860408374006364310344789820719352806700, 421744280, 171392726, 0) {} catch {}
        vm.warp(block.timestamp + 17); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollect(178, 22) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 35190); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testRemoveStreamShouldNotRevert(128, 28) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollect(199, 149) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewVsActual(197, 4079372030) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 9590); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueeze(0, 0) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSplittableAfterSplit(80) {} catch {}
        vm.warp(block.timestamp + 6863); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.splitAndCollectToSelf(231) {} catch {}
        vm.warp(block.timestamp + 74); vm.roll(block.number + 22299); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollectableAfterSplit(68) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollectableAfterSplit(159) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.collectToSelf(106) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantWithdrawShouldAlwaysFail(190) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addStreamWithClamping(223, 62, 333758157383236977898517930480983670721352568972, 1688598183, 1051049805, 0) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 20969); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeToSelf(32) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueeze(210, 133) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 52949); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSplitViewVsActual(30) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollect(73, 192) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 76723); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollectShouldNotRevert(176, 30) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.removeStream(7, 17690536178954792439140205748216361646010760840639549214032549843389924198086) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsShouldNotRevert(122) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamBalance(252, 0) {} catch {}
        vm.warp(block.timestamp + 64); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addSplitsReceiverWithClamping(32, 86, 1018391) {} catch {}
        vm.warp(block.timestamp + 254); vm.roll(block.number + 95540); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.assert_canary_ASSERTION_CANARY(1952416161663971769229090059085797195256582031560342465478741000174945078412) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreams(7, 504) {} catch {}
        vm.warp(block.timestamp + 20); vm.roll(block.number + 23884); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setMaxEndHints(4294967295, 3059662557) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addStream(14, 71, 236068217844755646715504211894626825308790227108, 621392200, 966, -1022) {} catch {}
        vm.warp(block.timestamp + 16); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.receiveStreams(57, 1369303642) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantAmtPerSecVsMinAmtPerSec(213, 100) {} catch {}
        vm.warp(block.timestamp + 8); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addSplitsReceiverWithClamping(50, 197, 71098105) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addSplitsReceiver(156, 152, 404) {} catch {}
        vm.warp(block.timestamp + 28); vm.roll(block.number + 57590); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetSplitsShouldNotRevert(112, 71, 710) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 35732); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewConsistency(27, 2188477350) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 60); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithDefaultHistory(67, 0) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); t.testAddStreamShouldNotRevert(17, 0, 818, 4139778199, 2943716917, -469231731687303715884105728);
    }
    // i-0eeac9664aa2ffaf4-recon-v0.4.18: testBalanceAtInFuture (51 calls)
    function test_26_testBalanceAtInFuture() public {
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.receiveStreamsSplitAndCollectToSelf(72) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplitViewVsActual(255) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplittableAfterSplit(22) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.receiveStreamsSplitAndCollectToSelf(213) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsShouldNotRevert(124) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreams(101, 1708733114) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.receiveStreamsSplitAndCollectToSelf(191) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamsWithClamping(193, 245, 485007912559153484949507350443821279860120632309, 917, 838, 91687458850628739420061685064645310199) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsShouldNotRevert(104) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addStream(109, 220, 782865397754326465979896121541064226896481535685, 17, 3693765309, 282044209472491936952049404) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testBalanceAtInFuture(184, 0, 15674849364229) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.receiveStreamsSplitAndCollectToSelf(0) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testGiveShouldNotRevert(205, 200, 13335240348659201270207951) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.receiveStreams(85, 3666689664) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.receiveStreamsAllCycles(30) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testGiveShouldNotRevert(248, 251, 190466145251308579755905344) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeWithFullyHashedHistory(88, 152) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiversReceivedSplit(0) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollect(248, 227) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testAddSplitsShouldNotRevert(2, 25, 4294967293) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsShouldNotRevert(249) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testCollect(52, 36) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamBalanceWithdrawAllShouldNotRevert(208) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.receiveStreamsSplitAndCollectToSelf(131) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeWithDefaultHistory(162, 182) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.removeAllSplits(203) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplitShouldNotRevert(97) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezableVsReceived(228) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeWithFullyHashedHistory(72, 0) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setSplitsWithClamping(151, 18, 146) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testAddStreamShouldNotRevert(152, 104, 418869179563572713383252238097977900366087850866, 294, 2058548618, 710282254406404136834057842) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.giveClampedAmount(1, 74, 288570115672117990121044825993028199220) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamBalance(252, 968) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSplitShouldNotRevert(193) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.collectToSelf(254) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.collectToSelf(200) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testCollectableAfterSplit(197) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addStreamImmediatelySqueezable(5, 22, 806223998721784051087294268396559683916327938442) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithFuzzedHistory(191, 123, 379, bytes32(0xa58c5ce144c237b2b9585ef3adc7b29c3a84422fc76baea58743c972c1997c9a)) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollectableAfterSplit(13) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.collectToSelf(76) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeWithDefaultHistory(195, 147) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantWithdrawShouldAlwaysFail(1) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetSplitsShouldNotRevert(32, 252, 1679071680) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.splitAndCollectToSelf(8) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreamsViewVsActual(91, 4154187309) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalance(195, 158) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.giveClampedAmount(103, 39, 231007405465428200026105024385410124464) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeWithFuzzedHistory(54, 7, 189, bytes32(0x000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f)) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); t.testBalanceAtInFuture(169, 225, 5);
    }
    // i-0eeac9664aa2ffaf4-recon-v0.4.18: testReceiveStreamsShouldNotRevert (34 calls)
    function test_27_testReceiveStreamsShouldNotRevert() public {
        vm.warp(block.timestamp + 210); vm.roll(block.number + 61621); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreamsViewVsActual(145, 365740403) {} catch {}
        vm.warp(block.timestamp + 99); vm.roll(block.number + 16417); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testAddSplitsShouldNotRevert(167, 253, 24) {} catch {}
        vm.warp(block.timestamp + 484); vm.roll(block.number + 215598); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamBalanceShouldNotRevert(163, -218) {} catch {}
        vm.warp(block.timestamp + 234); vm.roll(block.number + 89097); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(5) {} catch {}
        vm.warp(block.timestamp + 94); vm.roll(block.number + 31024); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeWithDefaultHistory(103, 99) {} catch {}
        vm.warp(block.timestamp + 139); vm.roll(block.number + 26459); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addStreamImmediatelySqueezable(220, 98, 68937113809754841293168894055084746761943511007) {} catch {}
        vm.warp(block.timestamp + 28); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSplittableAfterSplit(201) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 29236); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeViewVsActual(131, 203) {} catch {}
        vm.warp(block.timestamp + 27); vm.roll(block.number + 20667); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.removeAllSplits(1) {} catch {}
        vm.warp(block.timestamp + 46); vm.roll(block.number + 24043); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezableAmountCantBeUndone(134, 127, 727211294678282989736169006209393303446143464012, 2806873450, 2556841501, 13806978348055434996509292) {} catch {}
        vm.warp(block.timestamp + 43); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 130); vm.roll(block.number + 60630); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.removeStream(255, 157) {} catch {}
        vm.warp(block.timestamp + 110); vm.roll(block.number + 34913); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setMaxEndHints(4186373503, 4294967293) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 24837); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreamsShouldNotRevert(175) {} catch {}
        vm.warp(block.timestamp + 17); vm.roll(block.number + 40129); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 41767); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeToSelf(108) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 42262); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testCollectableAfterSplit(9) {} catch {}
        vm.warp(block.timestamp + 100); vm.roll(block.number + 24193); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiversReceivedSplit(93) {} catch {}
        vm.warp(block.timestamp + 355); vm.roll(block.number + 90567); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamsShouldNotRevert(36, 251, 333833626360305278019334305229653842751253899120, 506537600, 2346125565, 88884674206469001162768719113195926276) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 27861); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetSplitsShouldNotRevert(102, 2, 3411699135) {} catch {}
        vm.warp(block.timestamp + 73); vm.roll(block.number + 26683); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamsShouldNotRevert(122, 191, 857664293554732707503382056811963161884665209645, 4294967292, 1721346823, 118265565706041848254741291) {} catch {}
        vm.warp(block.timestamp + 5); vm.roll(block.number + 56616); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeAllSenders(137) {} catch {}
        vm.warp(block.timestamp + 396); vm.roll(block.number + 106094); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreams(207, 2296224792) {} catch {}
        vm.warp(block.timestamp + 138); vm.roll(block.number + 93173); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(235) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addStreamWithClamping(203, 253, 198009099726297476247238098620965368048058077, 3759208245, 896, 464) {} catch {}
        vm.warp(block.timestamp + 178); vm.roll(block.number + 88030); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(45, 4) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setMaxEndHints(1838853480, 1843577349) {} catch {}
        vm.warp(block.timestamp + 64); vm.roll(block.number + 4803); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.split(254) {} catch {}
        vm.warp(block.timestamp + 428); vm.roll(block.number + 227502); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSplittableAfterSplit(164) {} catch {}
        vm.warp(block.timestamp + 201); vm.roll(block.number + 143973); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.receiveStreamsSplitAndCollectToSelf(48) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 5954); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueeze(21, 181) {} catch {}
        vm.warp(block.timestamp + 81); vm.roll(block.number + 20606); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeWithFuzzedHistory(255, 252, 36528253097900040217493504929499442584669545616671780311300626410835856204068, bytes32(0xc51d578d605fbf33c4840fc5bf5bb8bfccd24ed8662968c90c6ffc7dadfd6761)) {} catch {}
        vm.warp(block.timestamp + 387); vm.roll(block.number + 116819); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.addStreamImmediatelySqueezable(48, 113, 5192296858534827628530496329220095) {} catch {}
        vm.warp(block.timestamp + 372); vm.roll(block.number + 197675); vm.prank(address(0x0000000000000000000000000000000000020000)); t.testReceiveStreamsShouldNotRevert(133);
    }
    // i-0eeac9664aa2ffaf4-recon-v0.4.18: testSetStreamBalanceShouldNotRevert (66 calls)
    function test_28_testSetStreamBalanceShouldNotRevert() public {
        vm.warp(block.timestamp + 210); vm.roll(block.number + 61621); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreamsViewVsActual(145, 365740403) {} catch {}
        vm.warp(block.timestamp + 99); vm.roll(block.number + 16417); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testAddSplitsShouldNotRevert(167, 253, 24) {} catch {}
        vm.warp(block.timestamp + 210); vm.roll(block.number + 138321); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(49, 137) {} catch {}
        vm.warp(block.timestamp + 396); vm.roll(block.number + 142489); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezeWithFullyHashedHistory(59, 234) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(5) {} catch {}
        vm.warp(block.timestamp + 94); vm.roll(block.number + 31024); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeWithDefaultHistory(103, 99) {} catch {}
        vm.warp(block.timestamp + 139); vm.roll(block.number + 52638); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addStreamImmediatelySqueezable(220, 98, 68937113809754841293168894055084746761943511007) {} catch {}
        vm.warp(block.timestamp + 28); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSplittableAfterSplit(201) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 29236); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeViewVsActual(131, 203) {} catch {}
        vm.warp(block.timestamp + 27); vm.roll(block.number + 20667); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.removeAllSplits(1) {} catch {}
        vm.warp(block.timestamp + 46); vm.roll(block.number + 24043); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezableAmountCantBeUndone(31, 127, 727211294678282989736169006209393303446143464012, 2806873450, 2556841501, 13806978348055434996509292) {} catch {}
        vm.warp(block.timestamp + 43); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 60630); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.removeStream(255, 157) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollectableAfterSplit(76) {} catch {}
        vm.warp(block.timestamp + 32); vm.roll(block.number + 11028); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setMaxEndHints(4186373503, 4294967293) {} catch {}
        vm.warp(block.timestamp + 95); vm.roll(block.number + 64966); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 41767); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeToSelf(108) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 42262); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testCollectableAfterSplit(9) {} catch {}
        vm.warp(block.timestamp + 100); vm.roll(block.number + 24193); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiversReceivedSplit(93) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 24104); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setSplitsWithClamping(255, 177, 1457166987) {} catch {}
        vm.warp(block.timestamp + 280); vm.roll(block.number + 66463); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamsShouldNotRevert(36, 251, 333833626360305278019334305229653842751253899120, 506537600, 2346125565, 88884674206469001162768719113195926276) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 27861); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetSplitsShouldNotRevert(102, 2, 3411699135) {} catch {}
        vm.warp(block.timestamp + 73); vm.roll(block.number + 26683); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamsShouldNotRevert(122, 191, 857664293554732707503382056811963161884665209645, 4294967292, 1721346823, 118265565706041848254741291) {} catch {}
        vm.warp(block.timestamp + 5); vm.roll(block.number + 56616); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeAllSenders(137) {} catch {}
        vm.warp(block.timestamp + 223); vm.roll(block.number + 56876); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithDefaultHistory(192, 53) {} catch {}
        vm.warp(block.timestamp + 97); vm.roll(block.number + 11071); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addSplitsReceiverWithClamping(151, 0, 4294967293) {} catch {}
        vm.warp(block.timestamp + 76); vm.roll(block.number + 38147); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreams(207, 2296224792) {} catch {}
        vm.warp(block.timestamp + 138); vm.roll(block.number + 93173); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(235) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addStreamWithClamping(203, 253, 198009099726297476247238098620965368048058077, 3759208245, 896, 464) {} catch {}
        vm.warp(block.timestamp + 119); vm.roll(block.number + 60835); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamBalanceShouldNotRevert(0, 528412276163456835895194369) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 1136); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(213, 255) {} catch {}
        vm.warp(block.timestamp + 65); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreams(123, 220, 1269546092604498896625338672058614076615425539841, 4, 140, 355404092644037512062267352) {} catch {}
        vm.warp(block.timestamp + 2); vm.roll(block.number + 8946); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplittableAfterSplit(0) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamsShouldNotRevert(78, 0, 1117848545012717873028070424491847211371329685914, 421744280, 171392726, 968) {} catch {}
        vm.warp(block.timestamp + 17); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollect(255, 22) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 35190); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testRemoveStreamShouldNotRevert(203, 35) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 38321); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollect(199, 149) {} catch {}
        vm.warp(block.timestamp + 27); vm.roll(block.number + 83458); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreamsViewVsActual(197, 4079372030) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 9590); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueeze(1, 0) {} catch {}
        vm.warp(block.timestamp + 38100); vm.roll(block.number + 89924); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplittableAfterSplit(80) {} catch {}
        vm.warp(block.timestamp + 6863); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.splitAndCollectToSelf(231) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 22386); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollectableAfterSplit(68) {} catch {}
        vm.warp(block.timestamp + 234); vm.roll(block.number + 66750); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollectableAfterSplit(159) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.collectToSelf(255) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 35800); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantWithdrawShouldAlwaysFail(190) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addStreamWithClamping(223, 62, 335921776062856950211100523934349728410432829061, 1858109994, 1051049805, -610) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 41937); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeToSelf(32) {} catch {}
        vm.warp(block.timestamp + 91); vm.roll(block.number + 41017); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueeze(210, 133) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 52949); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSplitViewVsActual(53) {} catch {}
        vm.warp(block.timestamp + 63); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollect(73, 192) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 76723); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testCollectShouldNotRevert(201, 50) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.removeStream(30, 86006477060631616480805804244987554078675331924637781449297543843254685726337) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsShouldNotRevert(210) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamBalance(252, -372) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addSplitsReceiverWithClamping(32, 86, 1018391) {} catch {}
        vm.warp(block.timestamp + 254); vm.roll(block.number + 95540); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.assert_canary_ASSERTION_CANARY(3478428916186933249791328530398442600489271215090390586764657366656128883919) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreams(22, 567) {} catch {}
        vm.warp(block.timestamp + 90); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setMaxEndHints(4294967295, 3059662557) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addStream(27, 71, 1146276668235686364859199551408843764403346970643, 621392200, 966, -1022) {} catch {}
        vm.warp(block.timestamp + 16); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.receiveStreams(127, 3303403112) {} catch {}
        vm.warp(block.timestamp + 95); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantAmtPerSecVsMinAmtPerSec(213, 100) {} catch {}
        vm.warp(block.timestamp + 30); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addSplitsReceiverWithClamping(50, 197, 71098105) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addSplitsReceiver(156, 152, 404) {} catch {}
        vm.warp(block.timestamp + 28); vm.roll(block.number + 57590); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetSplitsShouldNotRevert(239, 71, 710) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 35732); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewConsistency(80, 2807608619) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000040000)); t.testSetStreamBalanceShouldNotRevert(50, -170141183460469231731687303715884105728);
    }
    // i-0eeac9664aa2ffaf4-recon-v0.4.18: testSetStreamBalanceWithdrawAllShouldNotRevert (41 calls)
    function test_29_testSetStreamBalanceWithdrawAllShouldNotRevert() public {
        vm.warp(block.timestamp + 309); vm.roll(block.number + 78038); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testAddSplitsShouldNotRevert(167, 253, 24) {} catch {}
        vm.warp(block.timestamp + 244); vm.roll(block.number + 138321); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(49, 137) {} catch {}
        vm.warp(block.timestamp + 73); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamBalanceWithdrawAllShouldNotRevert(247) {} catch {}
        vm.warp(block.timestamp + 167); vm.roll(block.number + 53392); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamBalanceShouldNotRevert(163, -218) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 65212); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezeWithFullyHashedHistory(59, 234) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(5) {} catch {}
        vm.warp(block.timestamp + 94); vm.roll(block.number + 31024); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeWithDefaultHistory(103, 99) {} catch {}
        vm.warp(block.timestamp + 272); vm.roll(block.number + 100247); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.removeAllSplits(1) {} catch {}
        vm.warp(block.timestamp + 46); vm.roll(block.number + 24043); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezableAmountCantBeUndone(134, 127, 727211294678282989736169006209393303446143464012, 2806873450, 2556841501, 13806978348055434996509292) {} catch {}
        vm.warp(block.timestamp + 43); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 52); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addStreamImmediatelySqueezable(255, 80, 1353611664219021117360342321807561306063960427263) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 36745); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.removeStream(255, 157) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollectableAfterSplit(76) {} catch {}
        vm.warp(block.timestamp + 110); vm.roll(block.number + 35865); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreamsShouldNotRevert(175) {} catch {}
        vm.warp(block.timestamp + 17); vm.roll(block.number + 40129); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 41767); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeToSelf(108) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 42262); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testCollectableAfterSplit(9) {} catch {}
        vm.warp(block.timestamp + 100); vm.roll(block.number + 24193); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiversReceivedSplit(93) {} catch {}
        vm.warp(block.timestamp + 355); vm.roll(block.number + 90567); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamsShouldNotRevert(36, 251, 333833626360305278019334305229653842751253899120, 506537600, 2346125565, 88884674206469001162768719113195926276) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 27861); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetSplitsShouldNotRevert(102, 2, 3411699135) {} catch {}
        vm.warp(block.timestamp + 73); vm.roll(block.number + 26683); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamsShouldNotRevert(122, 191, 857664293554732707503382056811963161884665209645, 4294967292, 1721346823, 118265565706041848254741291) {} catch {}
        vm.warp(block.timestamp + 5); vm.roll(block.number + 56616); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeAllSenders(137) {} catch {}
        vm.warp(block.timestamp + 223); vm.roll(block.number + 56876); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithDefaultHistory(192, 53) {} catch {}
        vm.warp(block.timestamp + 97); vm.roll(block.number + 11071); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addSplitsReceiverWithClamping(151, 0, 4294967293) {} catch {}
        vm.warp(block.timestamp + 76); vm.roll(block.number + 38147); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreams(207, 2296224792) {} catch {}
        vm.warp(block.timestamp + 138); vm.roll(block.number + 93173); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(235) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addStreamWithClamping(203, 253, 198009099726297476247238098620965368048058077, 3759208245, 896, 464) {} catch {}
        vm.warp(block.timestamp + 119); vm.roll(block.number + 60835); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamBalanceShouldNotRevert(0, 528412276163456835895194369) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 1136); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(213, 255) {} catch {}
        vm.warp(block.timestamp + 145); vm.roll(block.number + 52197); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamsShouldNotRevert(78, 0, 1117848545012717873028070424491847211371329685914, 421744280, 171392726, 968) {} catch {}
        vm.warp(block.timestamp + 17); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollect(255, 22) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 35190); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testRemoveStreamShouldNotRevert(203, 35) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 38321); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollect(199, 149) {} catch {}
        vm.warp(block.timestamp + 27); vm.roll(block.number + 41729); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreamsViewVsActual(197, 4079372030) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 9590); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueeze(1, 0) {} catch {}
        vm.warp(block.timestamp + 219); vm.roll(block.number + 88053); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.splitAndCollectToSelf(231) {} catch {}
        vm.warp(block.timestamp + 178); vm.roll(block.number + 62980); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.split(137) {} catch {}
        vm.warp(block.timestamp + 205); vm.roll(block.number + 73389); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplitViewVsActual(239) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 43184); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(103) {} catch {}
        vm.warp(block.timestamp + 316); vm.roll(block.number + 101373); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setStreams(253, 0, 728142202006738368820379294156941439450714578911, 252, 748, 19730705256269853234039475) {} catch {}
        vm.warp(block.timestamp + 395); vm.roll(block.number + 152843); vm.prank(address(0x0000000000000000000000000000000000020000)); t.testSetStreamBalanceWithdrawAllShouldNotRevert(0);
    }
    // i-0eeac9664aa2ffaf4-recon-v0.4.18: testSetStreamsShouldNotRevert (65 calls)
    function test_30_testSetStreamsShouldNotRevert() public {
        vm.warp(block.timestamp + 210); vm.roll(block.number + 61621); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreamsViewVsActual(145, 365740403) {} catch {}
        vm.warp(block.timestamp + 99); vm.roll(block.number + 16417); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testAddSplitsShouldNotRevert(167, 253, 24) {} catch {}
        vm.warp(block.timestamp + 210); vm.roll(block.number + 138321); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(49, 137) {} catch {}
        vm.warp(block.timestamp + 396); vm.roll(block.number + 142489); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezeWithFullyHashedHistory(59, 234) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(5) {} catch {}
        vm.warp(block.timestamp + 94); vm.roll(block.number + 31024); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeWithDefaultHistory(103, 99) {} catch {}
        vm.warp(block.timestamp + 139); vm.roll(block.number + 52638); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addStreamImmediatelySqueezable(220, 98, 68937113809754841293168894055084746761943511007) {} catch {}
        vm.warp(block.timestamp + 28); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSplittableAfterSplit(201) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 29236); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeViewVsActual(131, 203) {} catch {}
        vm.warp(block.timestamp + 27); vm.roll(block.number + 20667); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.removeAllSplits(1) {} catch {}
        vm.warp(block.timestamp + 46); vm.roll(block.number + 24043); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezableAmountCantBeUndone(31, 127, 727211294678282989736169006209393303446143464012, 2806873450, 2556841501, 13806978348055434996509292) {} catch {}
        vm.warp(block.timestamp + 43); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 60630); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.removeStream(255, 157) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollectableAfterSplit(76) {} catch {}
        vm.warp(block.timestamp + 32); vm.roll(block.number + 11028); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setMaxEndHints(4186373503, 4294967293) {} catch {}
        vm.warp(block.timestamp + 95); vm.roll(block.number + 64966); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 41767); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeToSelf(108) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 42262); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testCollectableAfterSplit(9) {} catch {}
        vm.warp(block.timestamp + 100); vm.roll(block.number + 24193); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiversReceivedSplit(93) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 24104); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setSplitsWithClamping(255, 177, 1457166987) {} catch {}
        vm.warp(block.timestamp + 280); vm.roll(block.number + 66463); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamsShouldNotRevert(36, 251, 333833626360305278019334305229653842751253899120, 506537600, 2346125565, 88884674206469001162768719113195926276) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 27861); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetSplitsShouldNotRevert(102, 2, 3411699135) {} catch {}
        vm.warp(block.timestamp + 73); vm.roll(block.number + 26683); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamsShouldNotRevert(122, 191, 857664293554732707503382056811963161884665209645, 4294967292, 1721346823, 118265565706041848254741291) {} catch {}
        vm.warp(block.timestamp + 5); vm.roll(block.number + 56616); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeAllSenders(137) {} catch {}
        vm.warp(block.timestamp + 223); vm.roll(block.number + 56876); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithDefaultHistory(192, 53) {} catch {}
        vm.warp(block.timestamp + 97); vm.roll(block.number + 11071); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addSplitsReceiverWithClamping(151, 0, 4294967293) {} catch {}
        vm.warp(block.timestamp + 76); vm.roll(block.number + 38147); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreams(207, 2296224792) {} catch {}
        vm.warp(block.timestamp + 138); vm.roll(block.number + 93173); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(235) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addStreamWithClamping(203, 253, 198009099726297476247238098620965368048058077, 3759208245, 896, 464) {} catch {}
        vm.warp(block.timestamp + 119); vm.roll(block.number + 60835); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamBalanceShouldNotRevert(0, 528412276163456835895194369) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 1136); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(213, 255) {} catch {}
        vm.warp(block.timestamp + 65); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreams(123, 220, 1269546092604498896625338672058614076615425539841, 4, 140, 355404092644037512062267352) {} catch {}
        vm.warp(block.timestamp + 2); vm.roll(block.number + 8946); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplittableAfterSplit(0) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamsShouldNotRevert(78, 0, 1117848545012717873028070424491847211371329685914, 421744280, 171392726, 968) {} catch {}
        vm.warp(block.timestamp + 17); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollect(255, 22) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 35190); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testRemoveStreamShouldNotRevert(203, 35) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 38321); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollect(199, 149) {} catch {}
        vm.warp(block.timestamp + 27); vm.roll(block.number + 83458); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreamsViewVsActual(197, 4079372030) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 9590); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueeze(1, 0) {} catch {}
        vm.warp(block.timestamp + 38100); vm.roll(block.number + 89924); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplittableAfterSplit(80) {} catch {}
        vm.warp(block.timestamp + 6863); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.splitAndCollectToSelf(231) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 22386); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollectableAfterSplit(68) {} catch {}
        vm.warp(block.timestamp + 234); vm.roll(block.number + 66750); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollectableAfterSplit(159) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.collectToSelf(255) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 35800); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantWithdrawShouldAlwaysFail(190) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addStreamWithClamping(223, 62, 335921776062856950211100523934349728410432829061, 1858109994, 1051049805, -610) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 41937); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeToSelf(32) {} catch {}
        vm.warp(block.timestamp + 91); vm.roll(block.number + 41017); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueeze(210, 133) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 52949); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSplitViewVsActual(53) {} catch {}
        vm.warp(block.timestamp + 63); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollect(73, 192) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 76723); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testCollectShouldNotRevert(201, 50) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.removeStream(30, 86006477060631616480805804244987554078675331924637781449297543843254685726337) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsShouldNotRevert(210) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamBalance(252, -372) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addSplitsReceiverWithClamping(32, 86, 1018391) {} catch {}
        vm.warp(block.timestamp + 254); vm.roll(block.number + 95540); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.assert_canary_ASSERTION_CANARY(3478428916186933249791328530398442600489271215090390586764657366656128883919) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreams(22, 567) {} catch {}
        vm.warp(block.timestamp + 90); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setMaxEndHints(4294967295, 3059662557) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addStream(27, 71, 1146276668235686364859199551408843764403346970643, 621392200, 966, -1022) {} catch {}
        vm.warp(block.timestamp + 16); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.receiveStreams(127, 3303403112) {} catch {}
        vm.warp(block.timestamp + 95); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantAmtPerSecVsMinAmtPerSec(213, 100) {} catch {}
        vm.warp(block.timestamp + 30); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addSplitsReceiverWithClamping(50, 197, 71098105) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addSplitsReceiver(156, 152, 404) {} catch {}
        vm.warp(block.timestamp + 28); vm.roll(block.number + 57590); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetSplitsShouldNotRevert(239, 71, 710) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 39834); vm.prank(address(0x0000000000000000000000000000000000030000)); t.testSetStreamsShouldNotRevert(24, 250, 11077190, 1515002639, 2072288661, -504974958029274960648848155);
    }
    // i-0eeac9664aa2ffaf4-recon-v0.4.18: testSqueezableAmountCantBeUndone (46 calls)
    function test_31_testSqueezableAmountCantBeUndone() public {
        vm.warp(block.timestamp + 67); vm.roll(block.number + 34746); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.receiveStreamsAllCycles(130) {} catch {}
        vm.warp(block.timestamp + 461); vm.roll(block.number + 105939); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addSplitsReceiverWithClamping(216, 147, 4294967295) {} catch {}
        vm.warp(block.timestamp + 64); vm.roll(block.number + 7148); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantWithdrawAllTokens() {} catch {}
        vm.warp(block.timestamp + 127); vm.roll(block.number + 89921); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantWithdrawAllTokens() {} catch {}
        vm.warp(block.timestamp + 71); vm.roll(block.number + 51615); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeTwice(214, 56, 893, bytes32(0x1a440b6adc1eba82cb47b70895561618fbc490d07ec81fc38a92198410dc0cef)) {} catch {}
        vm.warp(block.timestamp + 51); vm.roll(block.number + 29012); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewVsActual(252, 1057021148) {} catch {}
        vm.warp(block.timestamp + 79); vm.roll(block.number + 39049); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewVsActual(74, 797491) {} catch {}
        vm.warp(block.timestamp + 64); vm.roll(block.number + 75908); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeWithFullyHashedHistory(178, 255) {} catch {}
        vm.warp(block.timestamp + 30); vm.roll(block.number + 42491); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.giveClampedAmount(141, 141, 52) {} catch {}
        vm.warp(block.timestamp + 222); vm.roll(block.number + 33275); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsViewVsActual(67, 498077049) {} catch {}
        vm.warp(block.timestamp + 83); vm.roll(block.number + 86909); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeToSelf(0) {} catch {}
        vm.warp(block.timestamp + 50); vm.roll(block.number + 58686); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.assert_canary_ASSERTION_CANARY(69638972295021555329126163915172730582087320380937959110978888918209489366118) {} catch {}
        vm.warp(block.timestamp + 163); vm.roll(block.number + 74942); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithDefaultHistory(195, 3) {} catch {}
        vm.warp(block.timestamp + 33); vm.roll(block.number + 6794); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testAddSplitsShouldNotRevert(250, 64, 1953364) {} catch {}
        vm.warp(block.timestamp + 131); vm.roll(block.number + 42686); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testCollect(98, 54) {} catch {}
        vm.warp(block.timestamp + 16); vm.roll(block.number + 49843); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezableAmountCantBeWithdrawn(167, 0) {} catch {}
        vm.warp(block.timestamp + 56); vm.roll(block.number + 42619); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setStreamBalanceWithClamping(60, 124456378687515983382785205678942662347) {} catch {}
        vm.warp(block.timestamp + 139); vm.roll(block.number + 103802); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testAddStreamShouldNotRevert(94, 89, 294619690712336950361500727059561108406419806132, 735, 4294967294, -285) {} catch {}
        vm.warp(block.timestamp + 67); vm.roll(block.number + 19196); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.collectToSelf(250) {} catch {}
        vm.warp(block.timestamp + 100); vm.roll(block.number + 37567); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezeViewVsActual(141, 228) {} catch {}
        vm.warp(block.timestamp + 95); vm.roll(block.number + 13142); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.receiveStreamsSplitAndCollectToSelf(232) {} catch {}
        vm.warp(block.timestamp + 83); vm.roll(block.number + 29258); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.assert_canary_ASSERTION_CANARY(60) {} catch {}
        vm.warp(block.timestamp + 93); vm.roll(block.number + 41369); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.giveClampedAmount(149, 57, 185171402407230958820574712212532153057) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 19566); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreams(2, 887) {} catch {}
        vm.warp(block.timestamp + 44); vm.roll(block.number + 3586); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsViewVsActual(0, 2409430626) {} catch {}
        vm.warp(block.timestamp + 73); vm.roll(block.number + 32282); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setMaxEndHints(921936524, 565) {} catch {}
        vm.warp(block.timestamp + 149); vm.roll(block.number + 68798); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.collect(7, 33) {} catch {}
        vm.warp(block.timestamp + 117); vm.roll(block.number + 5616); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamBalanceShouldNotRevert(251, 134086708916579836676172340) {} catch {}
        vm.warp(block.timestamp + 81); vm.roll(block.number + 64100); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamsShouldNotRevert(85, 255, 606342618865267551695356835602288643389056509277, 1174194679, 322131991, 17414671969894762694437368297419959665) {} catch {}
        vm.warp(block.timestamp + 133); vm.roll(block.number + 23096); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplitViewVsActual(255) {} catch {}
        vm.warp(block.timestamp + 77); vm.roll(block.number + 26001); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.addStreamWithClamping(203, 168, 633, 3635018, 1834461500, -442) {} catch {}
        vm.warp(block.timestamp + 15); vm.roll(block.number + 4338); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testAddStreamShouldNotRevert(250, 153, 5767660161345280498953033849096308411988426587, 1413723248, 237695961, 106686597047380249759535736316520785521) {} catch {}
        vm.warp(block.timestamp + 27); vm.roll(block.number + 25636); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setSplitsWithClamping(166, 31, 3090536889) {} catch {}
        vm.warp(block.timestamp + 204); vm.roll(block.number + 63642); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamBalanceShouldNotRevert(120, 0) {} catch {}
        vm.warp(block.timestamp + 84); vm.roll(block.number + 43693); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeWithFullyHashedHistory(227, 39) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 38916); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeAllSenders(148) {} catch {}
        vm.warp(block.timestamp + 110); vm.roll(block.number + 39745); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsViewVsActual(182, 4238270230) {} catch {}
        vm.warp(block.timestamp + 45); vm.roll(block.number + 58996); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(145, 67) {} catch {}
        vm.warp(block.timestamp + 69); vm.roll(block.number + 50317); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.giveClampedAmount(216, 118, 0) {} catch {}
        vm.warp(block.timestamp + 53); vm.roll(block.number + 71724); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueeze(136, 251) {} catch {}
        vm.warp(block.timestamp + 195); vm.roll(block.number + 90323); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewVsActual(142, 2891360255) {} catch {}
        vm.warp(block.timestamp + 185); vm.roll(block.number + 126452); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezableVsReceived(0) {} catch {}
        vm.warp(block.timestamp + 108); vm.roll(block.number + 40588); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setStreamBalanceWithdrawAll(0) {} catch {}
        vm.warp(block.timestamp + 29); vm.roll(block.number + 2129); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testCollectShouldNotRevert(7, 81) {} catch {}
        vm.warp(block.timestamp + 88); vm.roll(block.number + 16219); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testAddStreamShouldNotRevert(250, 153, 5767660161345280498953033849096308411988426587, 1413723248, 237695961, 106686597047380249759535736316520785521) {} catch {}
        vm.warp(block.timestamp + 44); vm.roll(block.number + 10052); vm.prank(address(0x0000000000000000000000000000000000020000)); t.testSqueezableAmountCantBeUndone(236, 250, 724621961117541732115104844198240147340698958698, 950, 2481268362, 134086708916579836676172340);
    }
    // i-0eeac9664aa2ffaf4-recon-v0.4.18: testSqueezableAmountCantBeWithdrawn (10 calls)
    function test_32_testSqueezableAmountCantBeWithdrawn() public {
        vm.warp(block.timestamp + 53); vm.roll(block.number + 45423); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addSplitsReceiverWithClamping(152, 246, 3242469935) {} catch {}
        vm.warp(block.timestamp + 49); vm.roll(block.number + 13968); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantWithdrawShouldAlwaysFail(115792089237316195423570985008687907853269984665640564039457584007913129639932) {} catch {}
        vm.warp(block.timestamp + 66); vm.roll(block.number + 103136); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.addSplitsReceiverWithClamping(12, 0, 665) {} catch {}
        vm.warp(block.timestamp + 562); vm.roll(block.number + 272891); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreams(159, 255, 1145333352462322803382290810029418275299132501613, 839, 4233075658, 381) {} catch {}
        vm.warp(block.timestamp + 339); vm.roll(block.number + 164016); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplittableAfterSplit(39) {} catch {}
        vm.warp(block.timestamp + 240); vm.roll(block.number + 23109); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiversReceivedSplit(175) {} catch {}
        vm.warp(block.timestamp + 265); vm.roll(block.number + 138479); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.invariantWithdrawShouldAlwaysFail(27235869719713553858093467164862856094115832237610570783241139327031703263723) {} catch {}
        vm.warp(block.timestamp + 31); vm.roll(block.number + 34577); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplitShouldNotRevert(252) {} catch {}
        vm.warp(block.timestamp + 561); vm.roll(block.number + 220648); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeWithFuzzedHistoryShouldNotRevert(131, 117, 0, bytes32(0xb46e29a72c55b58d4910395d3a181899b4797b1055f0c905f4164a06a5d7511b)) {} catch {}
        vm.warp(block.timestamp + 369); vm.roll(block.number + 228580); vm.prank(address(0x0000000000000000000000000000000000010000)); t.testSqueezableAmountCantBeWithdrawn(249, 178);
    }
    // i-0eeac9664aa2ffaf4-recon-v0.4.18: testSqueezableVsReceived (54 calls)
    function test_33_testSqueezableVsReceived() public {
        vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(17) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addSplitsReceiverWithClamping(152, 246, 3242469935) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantWithdrawShouldAlwaysFail(115792089237316195423570985008687907853269984665640564039457584007913129639932) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.giveClampedAmount(255, 204, 340282366920938463463374607431768211452) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezeWithFullyHashedHistory(255, 12) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.addStream(160, 236, 1331787855694918622870380485470251658714652969860, 280607795, 3869459085, 968) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.collect(8, 6) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000040000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsViewConsistency(114, 3432901) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addStreamImmediatelySqueezable(250, 255, 262) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantWithdrawAllTokens() {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewVsActual(0, 2387830439) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithFuzzedHistory(47, 30, 222, bytes32(0x000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f)) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezableVsReceived(111) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreams(102, 1779223453) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000040000)); try t.receiveStreamsSplitAndCollectToSelf(105) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setSplitsWithClamping(149, 163, 2954407800) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreams(107, 4294967292) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testAddSplitsShouldNotRevert(222, 65, 1017811982) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeWithDefaultHistory(180, 101) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantSumAmtDeltaIsZero(250) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000040000)); try t.giveClampedAmount(249, 182, 878172039638870712206330482) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.giveClampedAmount(63, 253, 945750652189257131382801197) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamBalanceShouldNotRevert(0, 170141183460469231731687303715884105727) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeWithFullyHashedHistory(15, 252) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.collectToSelf(24) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.collectToSelf(213) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeToSelf(84) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.receiveStreamsSplitAndCollectToSelf(238) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezeWithFuzzedHistoryShouldNotRevert(9, 251, 5, bytes32(0x9c82beb3bd84f8da20f4c28667b90140bfb30e2aa7f3135c6885c6206b7afdf6)) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.giveClampedAmount(30, 56, 134596275542378076572546589968631350613) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setSplitsWithClamping(183, 170, 4218808415) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addStreamImmediatelySqueezable(114, 54, 1449559810451389353727183534300882999077514282161) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplitShouldNotRevert(63) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testCollect(40, 156) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setStreamBalanceWithClamping(155, 116002421070147287096714526397796342746) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setMaxEndHints(695853942, 3346020892) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreams(22, 567) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamBalance(250, -311) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.collect(21, 67) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantAmtPerSecVsMinAmtPerSec(250, 146733192082275611238431292) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(213) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.removeAllSplits(111) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSplittableAfterSplit(62) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetSplitsShouldNotRevert(11, 250, 1190070530) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueeze(251, 73) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamBalance(184, 504974958029274960648848155) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezableVsReceived(170) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSplittableAfterSplit(190) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplitViewVsActual(222) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.receiveStreamsSplitAndCollectToSelf(251) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamBalanceWithdrawAllShouldNotRevert(132) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); t.testSqueezableVsReceived(240);
    }
    // i-0eeac9664aa2ffaf4-recon-v0.4.18: testSqueezeWithDefaultHistoryShouldNotRevert (7 calls)
    function test_34_testSqueezeWithDefaultHistoryShouldNotRevert() public {
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplitShouldNotRevert(126) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplittableAfterSplit(159) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiversReceivedSplit(202) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setStreamsWithClamping(52, 133, 1328984664250362759080982059005294788465575757416, 2132522655, 555, 133687142037214791171071212) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollect(15, 21) {} catch {}
        vm.warp(block.timestamp + 1); vm.roll(block.number + 1); vm.prank(address(0x0000000000000000000000000000000000010000)); t.testSqueezeWithDefaultHistoryShouldNotRevert(171, 0);
    }
    // i-0eeac9664aa2ffaf4-recon-v0.4.18: testSqueezeWithFuzzedHistoryShouldNotRevert (45 calls)
    function test_35_testSqueezeWithFuzzedHistoryShouldNotRevert() public {
        vm.warp(block.timestamp + 78); vm.roll(block.number + 46766); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.receiveStreamsSplitAndCollectToSelf(72) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 13546); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplitViewVsActual(255) {} catch {}
        vm.warp(block.timestamp + 88); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplittableAfterSplit(22) {} catch {}
        vm.warp(block.timestamp + 554); vm.roll(block.number + 189320); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.receiveStreamsSplitAndCollectToSelf(191) {} catch {}
        vm.warp(block.timestamp + 37); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamsWithClamping(193, 245, 485007912559153484949507350443821279860120632309, 917, 838, 91687458850628739420061685064645310199) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 37074); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(127) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamBalance(255, 88313098248818087407780089) {} catch {}
        vm.warp(block.timestamp + 90); vm.roll(block.number + 36275); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsShouldNotRevert(104) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addStream(109, 220, 782865397754326465979896121541064226896481535685, 17, 3693765309, 282044209472491936952049404) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 13623); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testBalanceAtInFuture(184, 0, 15674849364229) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.receiveStreamsSplitAndCollectToSelf(0) {} catch {}
        vm.warp(block.timestamp + 79); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testGiveShouldNotRevert(205, 200, 13335240348659201270207951) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.receiveStreams(85, 3666689664) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 25958); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testGiveShouldNotRevert(248, 251, 190466145251308579755905344) {} catch {}
        vm.warp(block.timestamp + 193); vm.roll(block.number + 84906); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiversReceivedSplit(0) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollect(248, 227) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testAddSplitsShouldNotRevert(2, 25, 4294967293) {} catch {}
        vm.warp(block.timestamp + 234); vm.roll(block.number + 62625); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantWithdrawAllTokens() {} catch {}
        vm.warp(block.timestamp + 227); vm.roll(block.number + 95922); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testCollect(52, 36) {} catch {}
        vm.warp(block.timestamp + 148); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.receiveStreamsSplitAndCollectToSelf(132) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 24573); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeWithDefaultHistory(162, 182) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.removeAllSplits(203) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplitShouldNotRevert(97) {} catch {}
        vm.warp(block.timestamp + 25); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamBalance(34, -921) {} catch {}
        vm.warp(block.timestamp + 119); vm.roll(block.number + 74975); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplitShouldNotRevert(225) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.split(231) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23539); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeToSelf(251) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 41831); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testAddSplitsShouldNotRevert(200, 104, 179) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setStreamBalanceWithdrawAll(143) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(134) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 35262); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithFuzzedHistory(144, 58, 2, bytes32(0x9e9145680fc3f1331055f636bd302a30082ba7b782ae589e048f2aff9e81bb14)) {} catch {}
        vm.warp(block.timestamp + 43); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeAllAndReceiveAndSplitAndCollectToSelf(150) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewConsistency(232, 1582112490) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setStreamBalanceWithClamping(231, 809) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.split(124) {} catch {}
        vm.warp(block.timestamp + 196); vm.roll(block.number + 87081); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addSplitsReceiverWithClamping(23, 253, 436193551) {} catch {}
        vm.warp(block.timestamp + 93); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplitViewVsActual(58) {} catch {}
        vm.warp(block.timestamp + 234); vm.roll(block.number + 96251); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.receiveStreamsAllCycles(191) {} catch {}
        vm.warp(block.timestamp + 199); vm.roll(block.number + 104533); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeToSelf(14) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.receiveStreams(110, 831) {} catch {}
        vm.warp(block.timestamp + 37); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 7267); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testGiveShouldNotRevert(189, 35, 627) {} catch {}
        vm.warp(block.timestamp + 468); vm.roll(block.number + 152650); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.invariantWithdrawAllTokens() {} catch {}
        vm.warp(block.timestamp + 6); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); t.testSqueezeWithFuzzedHistoryShouldNotRevert(251, 68, 15, bytes32(0xa2aee9e4bf01540b0f99999a620cb21165d34d7c151c69cf7643f4996d0200e5));
    }
    // i-0d48a81d5d8532c0e-recon-v0.4.18: invariantAccountingVsTokenBalance (34 calls)
    function test_36_invariantAccountingVsTokenBalance() public {
        vm.warp(block.timestamp + 78); vm.roll(block.number + 2035); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollectableAfterSplit(162) {} catch {}
        vm.warp(block.timestamp + 67); vm.roll(block.number + 3127); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.split(227) {} catch {}
        vm.warp(block.timestamp + 202); vm.roll(block.number + 109182); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addStreamWithClamping(185, 146, 1236692124424060988505832313564762615842991186023, 3750114855, 1391442621, 104406235306155507040602741265341025336) {} catch {}
        vm.warp(block.timestamp + 200); vm.roll(block.number + 139234); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeWithFullyHashedHistory(243, 175) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 22567); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewVsActual(88, 1912343060) {} catch {}
        vm.warp(block.timestamp + 62); vm.roll(block.number + 46357); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsViewVsActual(253, 4213951827) {} catch {}
        vm.warp(block.timestamp + 129); vm.roll(block.number + 38929); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(11, 134) {} catch {}
        vm.warp(block.timestamp + 144); vm.roll(block.number + 123490); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.addStreamWithClamping(221, 42, 522868302238234568851623378727640861399836704625, 2236068590, 358123547, -136) {} catch {}
        vm.warp(block.timestamp + 20); vm.roll(block.number + 10409); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezableVsReceived(228) {} catch {}
        vm.warp(block.timestamp + 106); vm.roll(block.number + 79300); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiversReceivedSplit(205) {} catch {}
        vm.warp(block.timestamp + 96); vm.roll(block.number + 50894); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setSplitsWithClamping(250, 43, 367) {} catch {}
        vm.warp(block.timestamp + 46); vm.roll(block.number + 18690); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeToSelf(57) {} catch {}
        vm.warp(block.timestamp + 283); vm.roll(block.number + 106021); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplittableAfterSplit(0) {} catch {}
        vm.warp(block.timestamp + 19); vm.roll(block.number + 3690); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addStreamImmediatelySqueezable(72, 138, 1166051697450081033694493801473705740112202452428) {} catch {}
        vm.warp(block.timestamp + 159); vm.roll(block.number + 50846); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezableVsReceived(135) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 43543); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetSplitsShouldNotRevert(0, 28, 315) {} catch {}
        vm.warp(block.timestamp + 364); vm.roll(block.number + 38941); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.receiveStreamsAllCycles(253) {} catch {}
        vm.warp(block.timestamp + 58); vm.roll(block.number + 11591); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeToSelf(247) {} catch {}
        vm.warp(block.timestamp + 102); vm.roll(block.number + 30491); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeWithFullyHashedHistory(196, 2) {} catch {}
        vm.warp(block.timestamp + 183); vm.roll(block.number + 62559); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.addStream(238, 89, 1295322298948691266941296818190836447013253740575, 2652857104, 560, -224) {} catch {}
        vm.warp(block.timestamp + 155); vm.roll(block.number + 89705); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamsWithClamping(11, 252, 28781351530757321361, 1747501459, 1138297210, 39) {} catch {}
        vm.warp(block.timestamp + 115); vm.roll(block.number + 28964); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.assert_canary_ASSERTION_CANARY(99) {} catch {}
        vm.warp(block.timestamp + 25); vm.roll(block.number + 20433); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.splitAndCollectToSelf(84) {} catch {}
        vm.warp(block.timestamp + 86); vm.roll(block.number + 16434); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.receiveStreams(205, 4294967291) {} catch {}
        vm.warp(block.timestamp + 85); vm.roll(block.number + 43248); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamBalance(234, -509) {} catch {}
        vm.warp(block.timestamp + 89); vm.roll(block.number + 41326); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsViewVsActual(195, 2543993265) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 82343); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeViewVsActual(76, 255) {} catch {}
        vm.warp(block.timestamp + 144); vm.roll(block.number + 100441); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezeViewVsActual(10, 74) {} catch {}
        vm.warp(block.timestamp + 158); vm.roll(block.number + 48787); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.removeAllSplits(152) {} catch {}
        vm.warp(block.timestamp + 234); vm.roll(block.number + 57618); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreamsShouldNotRevert(0) {} catch {}
        vm.warp(block.timestamp + 170); vm.roll(block.number + 36258); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setStreamsWithClamping(42, 220, 1157374967157365569554717806468301997809499233613, 1812840372, 4193263750, 51320814541287366327870232711518766678) {} catch {}
        vm.warp(block.timestamp + 367); vm.roll(block.number + 133770); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollect(185, 113) {} catch {}
        vm.warp(block.timestamp + 134); vm.roll(block.number + 71767); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamsWithClamping(42, 216, 1157374967157365569554717806468301997809499233613, 1812840372, 4193263751, 51320814541287366327870232711518766678) {} catch {}
        vm.warp(block.timestamp + 2); vm.roll(block.number + 15003); vm.prank(address(0x0000000000000000000000000000000000040000)); t.invariantAccountingVsTokenBalance();
    }
    // i-0d48a81d5d8532c0e-recon-v0.4.18: invariantWithdrawAllTokensShouldNotRevert (36 calls)
    function test_37_invariantWithdrawAllTokensShouldNotRevert() public {
        vm.warp(block.timestamp + 94); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplitShouldNotRevert(57) {} catch {}
        vm.warp(block.timestamp + 140); vm.roll(block.number + 72526); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.removeAllSplits(130) {} catch {}
        vm.warp(block.timestamp + 210); vm.roll(block.number + 114437); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addStreamImmediatelySqueezable(85, 197, 604800) {} catch {}
        vm.warp(block.timestamp + 118); vm.roll(block.number + 38225); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiversReceivedSplit(90) {} catch {}
        vm.warp(block.timestamp + 105); vm.roll(block.number + 27454); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantWithdrawShouldAlwaysFail(1) {} catch {}
        vm.warp(block.timestamp + 69); vm.roll(block.number + 71655); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezeTwice(116, 159, 340, bytes32(0x68babdcec6ea76b12d0c5ea140818f9c492bb062d7126c8f039e9f1b7a6a523a)) {} catch {}
        vm.warp(block.timestamp + 300); vm.roll(block.number + 76740); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.collectToSelf(227) {} catch {}
        vm.warp(block.timestamp + 167); vm.roll(block.number + 65762); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeToSelf(0) {} catch {}
        vm.warp(block.timestamp + 308); vm.roll(block.number + 76376); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.invariantWithdrawAllTokens() {} catch {}
        vm.warp(block.timestamp + 241); vm.roll(block.number + 116529); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeWithFuzzedHistory(119, 73, 42653071418163763020062808651377562781635439760478403544348850082112633178696, bytes32(0xe1388abd35021c71847bbb21a34b15e118c909a1bffbc7feba43830feb4a85b1)) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantAmtPerSecVsMinAmtPerSec(252, 28578917069788722322832036926388130634548269925098535969601056087819747354242) {} catch {}
        vm.warp(block.timestamp + 71); vm.roll(block.number + 6998); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.receiveStreams(252, 593332469) {} catch {}
        vm.warp(block.timestamp + 180); vm.roll(block.number + 67406); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezeTwice(0, 164, 221, bytes32(0xdd5db63a78bdca319eee701ee1ce8f510238716ed7386efd734c2d44f85058a1)) {} catch {}
        vm.warp(block.timestamp + 94); vm.roll(block.number + 15546); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.receiveStreamsAllCycles(77) {} catch {}
        vm.warp(block.timestamp + 34); vm.roll(block.number + 31264); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.receiveStreamsSplitAndCollectToSelf(0) {} catch {}
        vm.warp(block.timestamp + 29); vm.roll(block.number + 33990); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeWithFullyHashedHistory(146, 251) {} catch {}
        vm.warp(block.timestamp + 36); vm.roll(block.number + 34742); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setMaxEndHints(1464692973, 773391452) {} catch {}
        vm.warp(block.timestamp + 247); vm.roll(block.number + 91629); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.assert_canary_ASSERTION_CANARY(1787536579132520382348721827541152170941785190) {} catch {}
        vm.warp(block.timestamp + 160); vm.roll(block.number + 35031); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testBalanceAtInFuture(196, 181, 4031355) {} catch {}
        vm.warp(block.timestamp + 218); vm.roll(block.number + 109577); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.splitAndCollectToSelf(239) {} catch {}
        vm.warp(block.timestamp + 139); vm.roll(block.number + 44916); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeViewVsActual(112, 117) {} catch {}
        vm.warp(block.timestamp + 74); vm.roll(block.number + 37129); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.assert_canary_ASSERTION_CANARY(115792089237316195423570985008687907853269984665640564039457584007913129639933) {} catch {}
        vm.warp(block.timestamp + 62); vm.roll(block.number + 27834); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setSplitsWithClamping(10, 128, 705095158) {} catch {}
        vm.warp(block.timestamp + 196); vm.roll(block.number + 69600); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithFuzzedHistory(116, 103, 999, bytes32(0x59653e927adb35a997d0b551fd53254a3433712e314c96ba8c866e3f7c72e0ac)) {} catch {}
        vm.warp(block.timestamp + 274); vm.roll(block.number + 134552); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantWithdrawShouldAlwaysFail(72213431466109754719461014607458801009899195446223134353790180104115586201457) {} catch {}
        vm.warp(block.timestamp + 35); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.receiveStreamsSplitAndCollectToSelf(46) {} catch {}
        vm.warp(block.timestamp + 83957); vm.roll(block.number + 297879); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamsShouldNotRevert(56, 114, 369011080760035192527141404138646114814836626788, 714681857, 2617196848, 8986344324486091560715970810397554712) {} catch {}
        vm.warp(block.timestamp + 112); vm.roll(block.number + 69779); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetSplitsShouldNotRevert(123, 150, 527069289) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 17386); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamBalanceShouldNotRevert(0, 69937563997532597797711606) {} catch {}
        vm.warp(block.timestamp + 45); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.assert_canary_ASSERTION_CANARY(2175177322439318067065266625469429236932) {} catch {}
        vm.warp(block.timestamp + 63); vm.roll(block.number + 61163); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueeze(250, 220) {} catch {}
        vm.warp(block.timestamp + 121); vm.roll(block.number + 39487); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetStreamsShouldNotRevert(169, 34, 306287956151134514507301570292195042803914134166, 650833856, 327, -376) {} catch {}
        vm.warp(block.timestamp + 88); vm.roll(block.number + 31816); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addStreamImmediatelySqueezable(11, 212, 1209396256720408405108647673221589278318565563049) {} catch {}
        vm.warp(block.timestamp + 212); vm.roll(block.number + 6721); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeWithDefaultHistory(200, 43) {} catch {}
        vm.warp(block.timestamp + 25); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsShouldNotRevert(1) {} catch {}
        vm.warp(block.timestamp + 53); vm.roll(block.number + 57678); vm.prank(address(0x0000000000000000000000000000000000040000)); t.invariantWithdrawAllTokensShouldNotRevert();
    }
    // i-0d48a81d5d8532c0e-recon-v0.4.18: testAddStreamShouldNotRevert (48 calls)
    function test_38_testAddStreamShouldNotRevert() public {
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.split(134) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testGiveShouldNotRevert(155, 216, 276) {} catch {}
        vm.warp(block.timestamp + 341); vm.roll(block.number + 119425); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.receiveStreamsAllCycles(245) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 35306); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueeze(9, 2) {} catch {}
        vm.warp(block.timestamp + 4); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamsShouldNotRevert(124, 107, 1205481940174272813351627614896054564443712540403, 4294967294, 1938038477, 443) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsViewConsistency(157, 29805680) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollectShouldNotRevert(130, 75) {} catch {}
        vm.warp(block.timestamp + 256); vm.roll(block.number + 72136); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamBalance(190, -861) {} catch {}
        vm.warp(block.timestamp + 117); vm.roll(block.number + 26141); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setMaxEndHints(1368626398, 3651167183) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 35193); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithDefaultHistory(86, 26) {} catch {}
        vm.warp(block.timestamp + 192); vm.roll(block.number + 50112); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.collect(203, 65) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testCollectShouldNotRevert(94, 200) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.splitAndCollectToSelf(181) {} catch {}
        vm.warp(block.timestamp + 23); vm.roll(block.number + 18335); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplitViewVsActual(253) {} catch {}
        vm.warp(block.timestamp + 37); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsShouldNotRevert(221) {} catch {}
        vm.warp(block.timestamp + 89); vm.roll(block.number + 26870); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplitShouldNotRevert(57) {} catch {}
        vm.warp(block.timestamp + 560); vm.roll(block.number + 223061); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantWithdrawAllTokens() {} catch {}
        vm.warp(block.timestamp + 48); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsViewConsistency(254, 3952503895) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 4580); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalance(10, 612879691152835276885300253) {} catch {}
        vm.warp(block.timestamp + 13); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.split(136) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(233, 186) {} catch {}
        vm.warp(block.timestamp + 203); vm.roll(block.number + 72713); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamsWithClamping(114, 13, 1223886648341305654867132607338514151885133609334, 4294967290, 3191532052, 1) {} catch {}
        vm.warp(block.timestamp + 4); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeAllSenders(60) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSplitShouldNotRevert(16) {} catch {}
        vm.warp(block.timestamp + 116); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewConsistency(230, 536870912) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 65380); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeWithFuzzedHistory(0, 253, 890199117954727427850660497952133387796185361678317508709360217144859647805, bytes32(0x6cc2daaebe631e81b85b686b8c0a8cfdb686f75c09eadb44a1899db6266d01d6)) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testAddSplitsShouldNotRevert(4, 64, 1415114751) {} catch {}
        vm.warp(block.timestamp + 37); vm.roll(block.number + 35311); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsViewConsistency(45, 110194774) {} catch {}
        vm.warp(block.timestamp + 75); vm.roll(block.number + 52699); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamsWithClamping(42, 220, 1157374967157365569554717806468301997809499233613, 1812840372, 4193263751, 51320814541287366327870232711518766678) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.giveClampedAmount(3, 252, 411) {} catch {}
        vm.warp(block.timestamp + 181); vm.roll(block.number + 75016); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplittableAfterSplit(76) {} catch {}
        vm.warp(block.timestamp + 55); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.receiveStreams(179, 899464230) {} catch {}
        vm.warp(block.timestamp + 222); vm.roll(block.number + 95540); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantWithdrawShouldAlwaysFail(30) {} catch {}
        vm.warp(block.timestamp + 95); vm.roll(block.number + 5000); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreamsViewVsActual(195, 2543993265) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 29513); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetSplitsShouldNotRevert(38, 184, 4294967294) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 83782); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setMaxEndHints(2522611871, 1006703) {} catch {}
        vm.warp(block.timestamp + 407); vm.roll(block.number + 131005); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSplitShouldNotRevert(219) {} catch {}
        vm.warp(block.timestamp + 161); vm.roll(block.number + 88379); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeTwice(0, 42, 192, bytes32(0x1cee6d23a7a6ae6538d867edec0584e7067691f1dacc790f51b73333a1e1464a)) {} catch {}
        vm.warp(block.timestamp + 492); vm.roll(block.number + 143310); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetStreamBalanceShouldNotRevert(209, -640) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreamsViewVsActual(195, 2543993265) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 77924); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setStreamsWithClamping(14, 229, 1429858710911493359183599695641800610565849029524, 1966837166, 4294967290, 614) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetStreamBalanceShouldNotRevert(40, 131074595556837455325080105739505928065) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 31277); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiversReceivedSplit(3) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.giveClampedAmount(69, 249, 28552847312569095920813879633031228366) {} catch {}
        vm.warp(block.timestamp + 51); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeToSelf(130) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.collectToSelf(62) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 14046); vm.prank(address(0x0000000000000000000000000000000000030000)); t.testAddStreamShouldNotRevert(16, 91, 901827761047389925948046990024546006143779009185, 1917265726, 3889165128, -170141183460469231731687303715884105728);
    }
    // i-0d48a81d5d8532c0e-recon-v0.4.18: testBalanceAtInFuture (40 calls)
    function test_39_testBalanceAtInFuture() public {
        vm.warp(block.timestamp + 11); vm.roll(block.number + 2985); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplitShouldNotRevert(57) {} catch {}
        vm.warp(block.timestamp + 85); vm.roll(block.number + 56211); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezableVsReceived(158) {} catch {}
        vm.warp(block.timestamp + 55); vm.roll(block.number + 16314); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.removeAllSplits(57) {} catch {}
        vm.warp(block.timestamp + 104); vm.roll(block.number + 51838); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiversReceivedSplit(52) {} catch {}
        vm.warp(block.timestamp + 72); vm.roll(block.number + 24713); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addStreamImmediatelySqueezable(47, 61, 341635) {} catch {}
        vm.warp(block.timestamp + 76789); vm.roll(block.number + 3685); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamBalanceWithdrawAll(115) {} catch {}
        vm.warp(block.timestamp + 26748); vm.roll(block.number + 34540); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiversReceivedSplit(39) {} catch {}
        vm.warp(block.timestamp + 162); vm.roll(block.number + 27454); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addStreamImmediatelySqueezable(118, 180, 774) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testGiveShouldNotRevert(0, 48, 183210536654485818047602589) {} catch {}
        vm.warp(block.timestamp + 7); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezeTwice(52, 77, 210, bytes32(0x68babdce00ea00b12d0c00a140008f9c4900000000006c8f039e001b7a6a523a)) {} catch {}
        vm.warp(block.timestamp + 26); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.removeAllSplits(142) {} catch {}
        vm.warp(block.timestamp + 234); vm.roll(block.number + 62465); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeWithDefaultHistory(46, 85) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 41414); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.removeAllSplits(51) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setStreamsWithClamping(117, 225, 467102414592631173333255290863803247930572798907, 2205196547, 2782229885, -126480212773876089918541357) {} catch {}
        vm.warp(block.timestamp + 164); vm.roll(block.number + 24002); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsShouldNotRevert(183) {} catch {}
        vm.warp(block.timestamp + 60); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetStreamBalanceShouldNotRevert(109, 18051004519759590119635709095664565832) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 41456); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezableVsReceived(237) {} catch {}
        vm.warp(block.timestamp + 66); vm.roll(block.number + 23791); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezableVsReceived(209) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueezeWithFuzzedHistoryShouldNotRevert(219, 170, 45018528709046420279160279574209921257741068329626890286371683532829429323804, bytes32(0x558eed27b4515681f014e37cee7997520747bad8fa942253d3049e46293800ad)) {} catch {}
        vm.warp(block.timestamp + 24); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.split(122) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 37844); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.split(34) {} catch {}
        vm.warp(block.timestamp + 201); vm.roll(block.number + 71655); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.receiveStreamsAllCycles(134) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 69398); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.addSplitsReceiverWithClamping(122, 7, 360) {} catch {}
        vm.warp(block.timestamp + 218); vm.roll(block.number + 53669); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testAddSplitsShouldNotRevert(0, 240, 1316986463) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.receiveStreamsAllCycles(118) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 64583); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithDefaultHistory(35, 0) {} catch {}
        vm.warp(block.timestamp + 8); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeWithFuzzedHistoryShouldNotRevert(87, 32, 267, bytes32(0x8e22f974d65a7eefa061a83d23a72b098f726e09923a64e6eb95ab880b3e6cd9)) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueeze(250, 94) {} catch {}
        vm.warp(block.timestamp + 81); vm.roll(block.number + 37335); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamBalance(216, 222) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setMaxEndHints(28761956, 2516619965) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 32217); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.assert_canary_ASSERTION_CANARY(3) {} catch {}
        vm.warp(block.timestamp + 234); vm.roll(block.number + 71655); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testAddStreamShouldNotRevert(99, 96, 956500699540368166411012899399141200542202891942, 3816940315, 801307561, 53910623337050257767193896620958095331) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamsWithClamping(46, 239, 313, 4154863494, 3414989770, 816141759085566386549727480) {} catch {}
        vm.warp(block.timestamp + 159); vm.roll(block.number + 76313); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeToSelf(253) {} catch {}
        vm.warp(block.timestamp + 117); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithFuzzedHistory(183, 19, 1024, bytes32(0xf38de6615b0b3676b502c4e776d7aa5e738730f84d00e2e859a8882568a71dfa)) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantWithdrawShouldAlwaysFail(1023) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 48335); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeWithFullyHashedHistory(252, 108) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeWithFuzzedHistoryShouldNotRevert(38, 8, 224, bytes32(0xddd07ef7307419caf1f06a264eae58032a9d3728bc0991652a5ef5114a8e73a4)) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 9080); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testCollectableAfterSplit(91) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); t.testBalanceAtInFuture(113, 184, 551);
    }
    // i-0d48a81d5d8532c0e-recon-v0.4.18: testReceiveStreamsShouldNotRevert (34 calls)
    function test_40_testReceiveStreamsShouldNotRevert() public {
        vm.warp(block.timestamp + 94); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplitShouldNotRevert(57) {} catch {}
        vm.warp(block.timestamp + 140); vm.roll(block.number + 72526); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.removeAllSplits(130) {} catch {}
        vm.warp(block.timestamp + 138); vm.roll(block.number + 89724); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiversReceivedSplit(90) {} catch {}
        vm.warp(block.timestamp + 72); vm.roll(block.number + 24713); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addStreamImmediatelySqueezable(85, 197, 604800) {} catch {}
        vm.warp(block.timestamp + 76789); vm.roll(block.number + 3685); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamBalanceWithdrawAll(190) {} catch {}
        vm.warp(block.timestamp + 225); vm.roll(block.number + 85879); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addStreamImmediatelySqueezable(118, 180, 774) {} catch {}
        vm.warp(block.timestamp + 48); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezeTwice(116, 159, 340, bytes32(0x68babdcec6ea76b12d0c5ea140818f9c492bb062d7126c8f039e9f1b7a6a523a)) {} catch {}
        vm.warp(block.timestamp + 201); vm.roll(block.number + 52855); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreamsShouldNotRevert(138) {} catch {}
        vm.warp(block.timestamp + 68602); vm.roll(block.number + 149658); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetSplitsShouldNotRevert(71, 126, 1579832671) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 14961); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setMaxEndHints(3388132175, 4294967291) {} catch {}
        vm.warp(block.timestamp + 241); vm.roll(block.number + 117933); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.squeezeWithFuzzedHistory(119, 73, 42653071418163763020062808651377562781635439760478403544348850082112633178696, bytes32(0xe1388abd35021c71847bbb21a34b15e118c909a1bffbc7feba43830feb4a85b1)) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantAmtPerSecVsMinAmtPerSec(252, 28578917069788722322832036926388130634548269925098535969601056087819747354242) {} catch {}
        vm.warp(block.timestamp + 251); vm.roll(block.number + 74404); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezeTwice(0, 164, 221, bytes32(0xdd5db63a78bdca319eee701ee1ce8f510238716ed7386efd734c2d44f85058a1)) {} catch {}
        vm.warp(block.timestamp + 94); vm.roll(block.number + 15546); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.receiveStreamsAllCycles(77) {} catch {}
        vm.warp(block.timestamp + 34); vm.roll(block.number + 31290); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.receiveStreamsSplitAndCollectToSelf(0) {} catch {}
        vm.warp(block.timestamp + 29); vm.roll(block.number + 33990); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeWithFullyHashedHistory(146, 251) {} catch {}
        vm.warp(block.timestamp + 36); vm.roll(block.number + 34742); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setMaxEndHints(1464692973, 773391452) {} catch {}
        vm.warp(block.timestamp + 26); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testCollectShouldNotRevert(0, 23) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 18243); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeWithFullyHashedHistory(164, 157) {} catch {}
        vm.warp(block.timestamp + 143); vm.roll(block.number + 49501); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.assert_canary_ASSERTION_CANARY(1787536579132520382348721827541152170941785190) {} catch {}
        vm.warp(block.timestamp + 236); vm.roll(block.number + 99634); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeViewVsActual(63, 46) {} catch {}
        vm.warp(block.timestamp + 146); vm.roll(block.number + 44965); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeWithDefaultHistory(88, 250) {} catch {}
        vm.warp(block.timestamp + 83); vm.roll(block.number + 55258); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiversReceivedSplit(0) {} catch {}
        vm.warp(block.timestamp + 337); vm.roll(block.number + 115158); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsViewVsActual(137, 2548812380) {} catch {}
        vm.warp(block.timestamp + 614); vm.roll(block.number + 370895); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamBalanceWithdrawAllShouldNotRevert(241) {} catch {}
        vm.warp(block.timestamp + 218); vm.roll(block.number + 122883); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testRemoveStreamShouldNotRevert(82, 111323023226728048604954278410107879705384134807310406321522638208760035279659) {} catch {}
        vm.warp(block.timestamp + 325); vm.roll(block.number + 126560); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.removeStream(19, 191) {} catch {}
        vm.warp(block.timestamp + 175); vm.roll(block.number + 33806); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testCollect(206, 109) {} catch {}
        vm.warp(block.timestamp + 127); vm.roll(block.number + 84367); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeWithFuzzedHistory(248, 219, 876, bytes32(0x0a8680047a8f79ce6d751e4beebd9c3e3cb5be45b3f4225ee288d81941eaaf44)) {} catch {}
        vm.warp(block.timestamp + 813); vm.roll(block.number + 316224); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamBalanceShouldNotRevert(132, 695779042215477511195350961) {} catch {}
        vm.warp(block.timestamp + 17); vm.roll(block.number + 28916); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamBalanceWithdrawAll(218) {} catch {}
        vm.warp(block.timestamp + 219); vm.roll(block.number + 54400); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setMaxEndHints(3028755906, 4066000651) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 3653); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.assert_canary_ASSERTION_CANARY(80865900712934075129573616973424340149441123718290815524514150585700297265483) {} catch {}
        vm.warp(block.timestamp + 210); vm.roll(block.number + 30973); vm.prank(address(0x0000000000000000000000000000000000040000)); t.testReceiveStreamsShouldNotRevert(221);
    }
    // i-0d48a81d5d8532c0e-recon-v0.4.18: testSetStreamBalanceShouldNotRevert (45 calls)
    function test_41_testSetStreamBalanceShouldNotRevert() public {
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.split(134) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testGiveShouldNotRevert(155, 216, 276) {} catch {}
        vm.warp(block.timestamp + 185); vm.roll(block.number + 71655); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetSplitsShouldNotRevert(6, 126, 17945737) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 316); vm.roll(block.number + 106961); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsViewConsistency(157, 29805680) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollectShouldNotRevert(130, 75) {} catch {}
        vm.warp(block.timestamp + 100); vm.roll(block.number + 47524); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setSplits(177, 250, 295228) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 727); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testCollect(167, 203) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamBalance(190, -861) {} catch {}
        vm.warp(block.timestamp + 117); vm.roll(block.number + 26141); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setMaxEndHints(1368626398, 3651167183) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 37535); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(249, 186) {} catch {}
        vm.warp(block.timestamp + 114); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.collect(203, 65) {} catch {}
        vm.warp(block.timestamp + 179); vm.roll(block.number + 66105); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplitViewVsActual(253) {} catch {}
        vm.warp(block.timestamp + 115); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantSumAmtDeltaIsZero(251) {} catch {}
        vm.warp(block.timestamp + 11); vm.roll(block.number + 2985); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplitShouldNotRevert(57) {} catch {}
        vm.warp(block.timestamp + 85); vm.roll(block.number + 56211); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezableVsReceived(158) {} catch {}
        vm.warp(block.timestamp + 55); vm.roll(block.number + 16314); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.removeAllSplits(57) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.collectToSelf(37) {} catch {}
        vm.warp(block.timestamp + 157); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueeze(49, 126) {} catch {}
        vm.warp(block.timestamp + 185); vm.roll(block.number + 78881); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantWithdrawAllTokens() {} catch {}
        vm.warp(block.timestamp + 48); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsViewConsistency(254, 3952503895) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 4580); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalance(10, 612879691152835276885300253) {} catch {}
        vm.warp(block.timestamp + 13); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.split(136) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(233, 186) {} catch {}
        vm.warp(block.timestamp + 47); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithFuzzedHistory(0, 168, 91808951518775835887516468032857535841318579062198735635432244705397373501591, bytes32(0xad0034ce2c30bfd3a5d901031d8b2ac9a315a7e1adb58ffa641bc5a80a161611)) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 48828); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamsWithClamping(114, 13, 1223886648341305654867132607338514151885133609334, 4294967290, 3191532052, 1) {} catch {}
        vm.warp(block.timestamp + 4); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeAllSenders(60) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSplitShouldNotRevert(16) {} catch {}
        vm.warp(block.timestamp + 272); vm.roll(block.number + 113150); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeWithFuzzedHistory(0, 253, 890199117954727427850660497952133387796185361678317508709360217144859647805, bytes32(0x6cc2daaebe631e81b85b686b8c0a8cfdb686f75c09eadb44a1899db6266d01d6)) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testAddSplitsShouldNotRevert(4, 64, 1415114751) {} catch {}
        vm.warp(block.timestamp + 37); vm.roll(block.number + 35311); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsViewConsistency(45, 110194774) {} catch {}
        vm.warp(block.timestamp + 75); vm.roll(block.number + 52699); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamsWithClamping(42, 220, 1157374967157365569554717806468301997809499233613, 1812840372, 4193263751, 51320814541287366327870232711518766678) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.giveClampedAmount(3, 252, 411) {} catch {}
        vm.warp(block.timestamp + 181); vm.roll(block.number + 75016); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplittableAfterSplit(76) {} catch {}
        vm.warp(block.timestamp + 121); vm.roll(block.number + 71655); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamBalanceShouldNotRevert(158, 945) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantWithdrawShouldAlwaysFail(30) {} catch {}
        vm.warp(block.timestamp + 95); vm.roll(block.number + 5000); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreamsViewVsActual(195, 2543993265) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 29513); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetSplitsShouldNotRevert(38, 184, 4294967294) {} catch {}
        vm.warp(block.timestamp + 329); vm.roll(block.number + 108472); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeToSelf(254) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 82696); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addSplitsReceiverWithClamping(200, 223, 460486999) {} catch {}
        vm.warp(block.timestamp + 239); vm.roll(block.number + 111998); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeTwice(0, 42, 192, bytes32(0x1cee6d23a7a6ae6538d867edec0584e7067691f1dacc790f51b73333a1e1464a)) {} catch {}
        vm.warp(block.timestamp + 726); vm.roll(block.number + 245119); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setStreamsWithClamping(14, 229, 1429858710911493359183599695641800610565849029524, 1966837166, 4294967290, 614) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.giveClampedAmount(131, 55, 1000000000000000000000) {} catch {}
        vm.warp(block.timestamp + 151); vm.roll(block.number + 26980); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplitViewVsActual(95) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); t.testSetStreamBalanceShouldNotRevert(46, -13705148125315781801493815503766446178);
    }
    // i-0d48a81d5d8532c0e-recon-v0.4.18: testSetStreamBalanceWithdrawAllShouldNotRevert (52 calls)
    function test_42_testSetStreamBalanceWithdrawAllShouldNotRevert() public {
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.split(134) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testGiveShouldNotRevert(155, 216, 276) {} catch {}
        vm.warp(block.timestamp + 185); vm.roll(block.number + 71655); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetSplitsShouldNotRevert(6, 126, 17945737) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.receiveStreamsAllCycles(245) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 35306); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueeze(9, 2) {} catch {}
        vm.warp(block.timestamp + 4); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamsShouldNotRevert(124, 107, 1205481940174272813351627614896054564443712540403, 4294967294, 1938038477, 443) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsViewConsistency(157, 29805680) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollectShouldNotRevert(130, 75) {} catch {}
        vm.warp(block.timestamp + 100); vm.roll(block.number + 47524); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setSplits(177, 250, 295228) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 24612); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamBalance(190, -861) {} catch {}
        vm.warp(block.timestamp + 195); vm.roll(block.number + 61334); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithDefaultHistory(86, 26) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 2342); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(249, 186) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setStreamBalanceWithdrawAll(150) {} catch {}
        vm.warp(block.timestamp + 36); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.collect(203, 65) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.splitAndCollectToSelf(181) {} catch {}
        vm.warp(block.timestamp + 60); vm.roll(block.number + 42220); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsShouldNotRevert(221) {} catch {}
        vm.warp(block.timestamp + 89); vm.roll(block.number + 26870); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplitShouldNotRevert(57) {} catch {}
        vm.warp(block.timestamp + 218); vm.roll(block.number + 96410); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.collectToSelf(37) {} catch {}
        vm.warp(block.timestamp + 342); vm.roll(block.number + 126651); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantWithdrawAllTokens() {} catch {}
        vm.warp(block.timestamp + 126); vm.roll(block.number + 28465); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalance(10, 612879691152835276885300253) {} catch {}
        vm.warp(block.timestamp + 13); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.split(136) {} catch {}
        vm.warp(block.timestamp + 125); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithFuzzedHistory(0, 168, 91808951518775835887516468032857535841318579062198735635432244705397373501591, bytes32(0xad0034ce2c30bfd3a5d901031d8b2ac9a315a7e1adb58ffa641bc5a80a161611)) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 48828); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamsWithClamping(114, 13, 1223886648341305654867132607338514151885133609334, 4294967290, 3191532052, 1) {} catch {}
        vm.warp(block.timestamp + 4); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeAllSenders(60) {} catch {}
        vm.warp(block.timestamp + 428); vm.roll(block.number + 160920); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testAddSplitsShouldNotRevert(4, 64, 1415114751) {} catch {}
        vm.warp(block.timestamp + 190); vm.roll(block.number + 111895); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.giveClampedAmount(3, 252, 411) {} catch {}
        vm.warp(block.timestamp + 181); vm.roll(block.number + 75016); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplittableAfterSplit(76) {} catch {}
        vm.warp(block.timestamp + 55); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.receiveStreams(179, 899464230) {} catch {}
        vm.warp(block.timestamp + 222); vm.roll(block.number + 95540); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantWithdrawShouldAlwaysFail(30) {} catch {}
        vm.warp(block.timestamp + 95); vm.roll(block.number + 5000); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreamsViewVsActual(195, 2543993265) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 29513); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetSplitsShouldNotRevert(38, 184, 4294967294) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testGiveShouldNotRevert(160, 247, 277583526120063479906232572) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 59897); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setMaxEndHints(2522611871, 1006703) {} catch {}
        vm.warp(block.timestamp + 329); vm.roll(block.number + 107386); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addSplitsReceiverWithClamping(200, 223, 460486999) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23619); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSplitShouldNotRevert(219) {} catch {}
        vm.warp(block.timestamp + 161); vm.roll(block.number + 88379); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeTwice(0, 42, 192, bytes32(0x1cee6d23a7a6ae6538d867edec0584e7067691f1dacc790f51b73333a1e1464a)) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.invariantWithdrawShouldAlwaysFail(1251693187682813413247461901818025669573233057027747319740985583294223423256) {} catch {}
        vm.warp(block.timestamp + 92); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.split(54) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiversReceivedSplit(56) {} catch {}
        vm.warp(block.timestamp + 322); vm.roll(block.number + 95540); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreamsViewVsActual(195, 2543993265) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 77924); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setStreamsWithClamping(14, 229, 1429858710911493359183599695641800610565849029524, 1966837166, 4294967290, 614) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.giveClampedAmount(131, 55, 1000000000000000000000) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetStreamBalanceShouldNotRevert(40, 131074595556837455325080105739505928065) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 31277); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiversReceivedSplit(3) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.giveClampedAmount(69, 249, 28552847312569095920813879633031228366) {} catch {}
        vm.warp(block.timestamp + 51); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeToSelf(130) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.collectToSelf(62) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.splitAndCollectToSelf(1) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreams(255, 3664168356) {} catch {}
        vm.warp(block.timestamp + 150); vm.roll(block.number + 104287); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezableAmountCantBeWithdrawn(107, 174) {} catch {}
        vm.warp(block.timestamp + 202); vm.roll(block.number + 52204); vm.prank(address(0x0000000000000000000000000000000000020000)); t.testSetStreamBalanceWithdrawAllShouldNotRevert(0);
    }
    // i-0d48a81d5d8532c0e-recon-v0.4.18: testSetStreamsShouldNotRevert (31 calls)
    function test_43_testSetStreamsShouldNotRevert() public {
        vm.warp(block.timestamp + 156); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testGiveShouldNotRevert(155, 216, 276) {} catch {}
        vm.warp(block.timestamp + 185); vm.roll(block.number + 71655); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetSplitsShouldNotRevert(6, 126, 17945737) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.receiveStreamsAllCycles(245) {} catch {}
        vm.warp(block.timestamp + 494); vm.roll(block.number + 155212); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testCollect(167, 203) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamBalance(190, -861) {} catch {}
        vm.warp(block.timestamp + 117); vm.roll(block.number + 26141); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setMaxEndHints(1368626398, 3651167183) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 35193); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithDefaultHistory(86, 26) {} catch {}
        vm.warp(block.timestamp + 192); vm.roll(block.number + 50112); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.collect(203, 65) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testCollectShouldNotRevert(94, 200) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.splitAndCollectToSelf(181) {} catch {}
        vm.warp(block.timestamp + 23); vm.roll(block.number + 18335); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplitViewVsActual(253) {} catch {}
        vm.warp(block.timestamp + 37); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsShouldNotRevert(221) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantSumAmtDeltaIsZero(251) {} catch {}
        vm.warp(block.timestamp + 11); vm.roll(block.number + 2985); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplitShouldNotRevert(57) {} catch {}
        vm.warp(block.timestamp + 218); vm.roll(block.number + 96410); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.collectToSelf(37) {} catch {}
        vm.warp(block.timestamp + 157); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSqueeze(49, 126) {} catch {}
        vm.warp(block.timestamp + 185); vm.roll(block.number + 78881); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantWithdrawAllTokens() {} catch {}
        vm.warp(block.timestamp + 48); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsViewConsistency(254, 3952503895) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 4580); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalance(10, 612879691152835276885300253) {} catch {}
        vm.warp(block.timestamp + 91); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(233, 186) {} catch {}
        vm.warp(block.timestamp + 203); vm.roll(block.number + 72713); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamsWithClamping(114, 13, 1223886648341305654867132607338514151885133609334, 4294967290, 3191532052, 1) {} catch {}
        vm.warp(block.timestamp + 4); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeAllSenders(60) {} catch {}
        vm.warp(block.timestamp + 428); vm.roll(block.number + 160920); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testAddSplitsShouldNotRevert(4, 64, 1415114751) {} catch {}
        vm.warp(block.timestamp + 112); vm.roll(block.number + 88010); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamsWithClamping(42, 220, 1157374967157365569554717806468301997809499233613, 1812840372, 4193263751, 51320814541287366327870232711518766678) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.giveClampedAmount(3, 252, 411) {} catch {}
        vm.warp(block.timestamp + 181); vm.roll(block.number + 75016); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSplittableAfterSplit(76) {} catch {}
        vm.warp(block.timestamp + 277); vm.roll(block.number + 119425); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantWithdrawShouldAlwaysFail(30) {} catch {}
        vm.warp(block.timestamp + 95); vm.roll(block.number + 5000); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreamsViewVsActual(195, 2543993265) {} catch {}
        vm.warp(block.timestamp + 445); vm.roll(block.number + 132028); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreamsViewConsistency(224, 2332227862) {} catch {}
        vm.warp(block.timestamp + 13); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); t.testSetStreamsShouldNotRevert(49, 121, 721111356696486865718635109072919393261678874778, 1161485054, 541160667, -170141183460469231731687303715884105728);
    }
    // i-0d48a81d5d8532c0e-recon-v0.4.18: testSqueezableAmountCantBeUndone (12 calls)
    function test_44_testSqueezableAmountCantBeUndone() public {
        vm.warp(block.timestamp + 95); vm.roll(block.number + 65457); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testReceiveStreamsShouldNotRevert(139) {} catch {}
        vm.warp(block.timestamp + 41); vm.roll(block.number + 84796); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.receiveStreamsAllCycles(17) {} catch {}
        vm.warp(block.timestamp + 99); vm.roll(block.number + 36419); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetSplitsShouldNotRevert(3, 0, 1361103704) {} catch {}
        vm.warp(block.timestamp + 38); vm.roll(block.number + 904); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.receiveStreamsSplitAndCollectToSelf(179) {} catch {}
        vm.warp(block.timestamp + 145); vm.roll(block.number + 82504); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamBalanceShouldNotRevert(65, 170141183460469231731687303715884105727) {} catch {}
        vm.warp(block.timestamp + 364); vm.roll(block.number + 117871); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplitViewVsActual(0) {} catch {}
        vm.warp(block.timestamp + 188); vm.roll(block.number + 139012); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.invariantWithdrawAllTokens() {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollectShouldNotRevert(128, 212) {} catch {}
        vm.warp(block.timestamp + 285); vm.roll(block.number + 111889); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollectShouldNotRevert(0, 0) {} catch {}
        vm.warp(block.timestamp + 235); vm.roll(block.number + 84102); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeToSelf(130) {} catch {}
        vm.warp(block.timestamp + 312); vm.roll(block.number + 89796); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.receiveStreams(86, 3304513849) {} catch {}
        vm.warp(block.timestamp + 468); vm.roll(block.number + 213683); vm.prank(address(0x0000000000000000000000000000000000020000)); t.testSqueezableAmountCantBeUndone(252, 217, 1109103725256858979312225678808865016135256995356, 1194798572, 2324481557, 0);
    }
    // i-0d48a81d5d8532c0e-recon-v0.4.18: testSqueezableAmountCantBeWithdrawn (36 calls)
    function test_45_testSqueezableAmountCantBeWithdrawn() public {
        vm.warp(block.timestamp + 68); vm.roll(block.number + 59214); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.give(71, 250, 6) {} catch {}
        vm.warp(block.timestamp + 351); vm.roll(block.number + 133957); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.warp(block.timestamp + 224); vm.roll(block.number + 40767); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.collectToSelf(77) {} catch {}
        vm.warp(block.timestamp + 142); vm.roll(block.number + 85810); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.invariantWithdrawShouldAlwaysFail(9027716848019889477215222999142804775678017343619672853613197159796390358658) {} catch {}
        vm.warp(block.timestamp + 375); vm.roll(block.number + 163353); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(11, 134) {} catch {}
        vm.warp(block.timestamp + 63); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.give(153, 0, 6) {} catch {}
        vm.warp(block.timestamp + 105); vm.roll(block.number + 63314); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamBalanceShouldNotRevert(10, 610) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 6227); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.removeAllSplits(208) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 20286); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeWithFuzzedHistoryShouldNotRevert(54, 23, 89449822422533520855311293260631877148760960791316801342097775313260234009834, bytes32(0xf5b0b8e8491afa7c7a0723eb351c30e185786b7a300a558ba2aade890354e32a)) {} catch {}
        vm.warp(block.timestamp + 16); vm.roll(block.number + 29250); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.collectToSelf(68) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 20271); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamBalanceWithClamping(246, 48111371545966351493918624729992306833) {} catch {}
        vm.warp(block.timestamp + 237); vm.roll(block.number + 174376); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setStreamBalanceWithdrawAll(26) {} catch {}
        vm.warp(block.timestamp + 195); vm.roll(block.number + 143346); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testAddStreamShouldNotRevert(252, 0, 1461501637330902918203684832716283019655932542975, 1248960060, 824159642, 4916374245344905416867762453846323577) {} catch {}
        vm.warp(block.timestamp + 16); vm.roll(block.number + 40669); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.assert_canary_ASSERTION_CANARY(35702953026158524563041157035797436019708478210799819824270925340759831428189) {} catch {}
        vm.warp(block.timestamp + 335); vm.roll(block.number + 170462); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.receiveStreams(0, 300945795) {} catch {}
        vm.warp(block.timestamp + 87); vm.roll(block.number + 2421); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezableVsReceived(104) {} catch {}
        vm.warp(block.timestamp + 157); vm.roll(block.number + 67677); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setStreams(25, 1, 1203678719053932316235340921076989139158442509573, 1698007094, 1964529823, 249) {} catch {}
        vm.warp(block.timestamp + 279); vm.roll(block.number + 80373); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSplitShouldNotRevert(0) {} catch {}
        vm.warp(block.timestamp + 61); vm.roll(block.number + 9298); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(135, 248) {} catch {}
        vm.warp(block.timestamp + 74); vm.roll(block.number + 70091); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.giveClampedAmount(254, 52, 129558374962899237088134835491897784069) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 22104); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.collectToSelf(160) {} catch {}
        vm.warp(block.timestamp + 33); vm.roll(block.number + 10142); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetStreamBalance(60, 147) {} catch {}
        vm.warp(block.timestamp + 185); vm.roll(block.number + 26105); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addStreamWithClamping(164, 3, 1270350672363964573036075500014110041040194993864, 622214436, 1716369171, 631839585732089993701582798) {} catch {}
        vm.warp(block.timestamp + 6); vm.roll(block.number + 23916); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetSplitsShouldNotRevert(255, 253, 147459741) {} catch {}
        vm.warp(block.timestamp + 142); vm.roll(block.number + 66788); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantWithdrawShouldAlwaysFail(47291475857161982261454006314546834026268852492387814585793994510694737891538) {} catch {}
        vm.warp(block.timestamp + 94); vm.roll(block.number + 62017); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollect(244, 20) {} catch {}
        vm.warp(block.timestamp + 18); vm.roll(block.number + 42861); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithFuzzedHistory(101, 123, 63315819332597572357886115697083528134046464894095182075728525928571532974506, bytes32(0x79d3055ccd7911bb1c0a3c3077ff427da1f3aa73fe5c94f984fde0d514921465)) {} catch {}
        vm.warp(block.timestamp + 24); vm.roll(block.number + 26219); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetStreamsShouldNotRevert(0, 48, 713379281524486578975157537102433160264115427644, 935833823, 544870692, 167960017547634862568183339840688948750) {} catch {}
        vm.warp(block.timestamp + 83); vm.roll(block.number + 13206); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamBalanceWithdrawAllShouldNotRevert(167) {} catch {}
        vm.warp(block.timestamp + 17); vm.roll(block.number + 4675); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setMaxEndHints(715, 324) {} catch {}
        vm.warp(block.timestamp + 217); vm.roll(block.number + 114933); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamsShouldNotRevert(118, 198, 1461501637330902918203684832716283019655932542970, 651878273, 160976794, 118) {} catch {}
        vm.warp(block.timestamp + 58); vm.roll(block.number + 6812); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeWithDefaultHistory(191, 48) {} catch {}
        vm.warp(block.timestamp + 94); vm.roll(block.number + 67535); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setStreams(180, 250, 910794250286809494526163621623543764814429350208, 730921478, 4294967290, -413) {} catch {}
        vm.warp(block.timestamp + 87); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.addStreamImmediatelySqueezable(13, 180, 900545672206886539792079017277128745389207082455) {} catch {}
        vm.warp(block.timestamp + 80); vm.roll(block.number + 9526); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.removeAllSplits(39) {} catch {}
        vm.warp(block.timestamp + 68); vm.roll(block.number + 11023); vm.prank(address(0x0000000000000000000000000000000000040000)); t.testSqueezableAmountCantBeWithdrawn(227, 168);
    }
    // i-0d48a81d5d8532c0e-recon-v0.4.18: testSqueezableVsReceived (36 calls)
    function test_46_testSqueezableVsReceived() public {
        vm.warp(block.timestamp + 548); vm.roll(block.number + 196056); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testAddStreamShouldNotRevert(125, 229, 1461501637330902918203684832716283019655932542970, 1545323452, 2089255589, 143729123857017626320617229) {} catch {}
        vm.warp(block.timestamp + 72); vm.roll(block.number + 32327); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantWithdrawAllTokens() {} catch {}
        vm.warp(block.timestamp + 229); vm.roll(block.number + 71655); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.assert_canary_ASSERTION_CANARY(159) {} catch {}
        vm.warp(block.timestamp + 228); vm.roll(block.number + 72461); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetSplitsShouldNotRevert(255, 124, 2451819063) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 47833); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.removeAllSplits(63) {} catch {}
        vm.warp(block.timestamp + 15); vm.roll(block.number + 42226); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.receiveStreamsSplitAndCollectToSelf(241) {} catch {}
        vm.warp(block.timestamp + 322); vm.roll(block.number + 128204); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setStreamBalanceWithdrawAll(1) {} catch {}
        vm.warp(block.timestamp + 47); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeAllSenders(206) {} catch {}
        vm.warp(block.timestamp + 15); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollectableAfterSplit(40) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetStreamsShouldNotRevert(31, 125, 1311996940759727463241852120985105750614108451463, 195983021, 2356891904, 161680980583797540409118855358877442474) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsViewVsActual(233, 1034366521) {} catch {}
        vm.warp(block.timestamp + 63); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setMaxEndHints(2, 1305396179) {} catch {}
        vm.warp(block.timestamp + 468); vm.roll(block.number + 138869); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiversReceivedSplit(0) {} catch {}
        vm.warp(block.timestamp + 190); vm.roll(block.number + 71655); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiversReceivedSplit(243) {} catch {}
        vm.warp(block.timestamp + 14); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testAddStreamShouldNotRevert(76, 148, 1298584849047561252966616595765892415819872029775, 155804974, 1929967653, 740) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setStreams(6, 254, 1435137495958330986506526937905057540243070102965, 1096786899, 442595261, -615) {} catch {}
        vm.warp(block.timestamp + 253); vm.roll(block.number + 52324); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantAmtPerSecVsMinAmtPerSec(30, 107644471031487655406252667357458842650870505865458708032037506817404529978877) {} catch {}
        vm.warp(block.timestamp + 186); vm.roll(block.number + 91070); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeAllSenders(255) {} catch {}
        vm.warp(block.timestamp + 153); vm.roll(block.number + 57199); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.giveClampedAmount(168, 80, 18178682098422086221015322579251489776) {} catch {}
        vm.warp(block.timestamp + 90); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 234); vm.roll(block.number + 81875); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplitViewVsActual(63) {} catch {}
        vm.warp(block.timestamp + 200); vm.roll(block.number + 71655); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setStreams(211, 251, 45096061736770025771381767900960986280150249708, 3907562874, 1335586941, -258) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalance(246, -446) {} catch {}
        vm.warp(block.timestamp + 312); vm.roll(block.number + 77795); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testRemoveStreamShouldNotRevert(200, 48498391661142578990951679548070111617130794864695359445190405921990401753328) {} catch {}
        vm.warp(block.timestamp + 148); vm.roll(block.number + 62075); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSetStreamBalanceShouldNotRevert(225, 1565411522340471744517100898403664285) {} catch {}
        vm.warp(block.timestamp + 228); vm.roll(block.number + 57707); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testGiveShouldNotRevert(171, 88, 375234733535977512855906887) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testCollect(104, 242) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.receiveStreamsAllCycles(79) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testCollect(140, 130) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.removeAllSplits(125) {} catch {}
        vm.warp(block.timestamp + 311); vm.roll(block.number + 80797); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantWithdrawShouldAlwaysFail(15) {} catch {}
        vm.warp(block.timestamp + 172); vm.roll(block.number + 48517); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.removeAllSplits(255) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.squeezeAllSenders(198) {} catch {}
        vm.warp(block.timestamp + 93); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testSqueezeWithFullyHashedHistory(68, 60) {} catch {}
        vm.warp(block.timestamp + 93); vm.roll(block.number + 25993); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantWithdrawAllTokens() {} catch {}
        vm.warp(block.timestamp + 2); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000010000)); t.testSqueezableVsReceived(244);
    }
    // i-0d48a81d5d8532c0e-recon-v0.4.18: testSqueezeWithDefaultHistoryShouldNotRevert (27 calls)
    function test_47_testSqueezeWithDefaultHistoryShouldNotRevert() public {
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.split(134) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testGiveShouldNotRevert(155, 216, 276) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetSplitsShouldNotRevert(6, 126, 17945737) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.invariantAccountingVsTokenBalance() {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.receiveStreamsAllCycles(245) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueeze(9, 2) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamsShouldNotRevert(124, 107, 1205481940174272813351627614896054564443712540403, 4294967294, 1938038477, 443) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreamsViewConsistency(157, 29805680) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testCollectShouldNotRevert(130, 75) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setSplits(177, 250, 295228) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testCollect(167, 203) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamBalance(190, -861) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setMaxEndHints(1368626398, 3651167183) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeWithDefaultHistory(86, 26) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreams(128, 156) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsViewVsActual(114, 1562126944) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.collect(64, 49) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setMaxEndHints(2174694726, 6572486) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000010000)); try t.squeezeWithDefaultHistory(229, 154) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testAddStreamShouldNotRevert(189, 0, 694078521923142495522502382873130704008251311296, 2921854676, 1270354347, -413) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSetStreamBalanceWithdrawAllShouldNotRevert(250) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.setStreamBalanceWithClamping(62, 396) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezeViewVsActual(68, 251) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000040000)); try t.setMaxEndHints(4294967293, 728281429) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testReceiveStreams(99, 4294967295) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000020000)); try t.setStreamsWithClamping(253, 228, 854608971763874651974321300583378127789812788274, 934375932, 328, 641) {} catch {}
        vm.prank(address(0x0000000000000000000000000000000000030000)); t.testSqueezeWithDefaultHistoryShouldNotRevert(221, 222);
    }
    // i-0d48a81d5d8532c0e-recon-v0.4.18: testSqueezeWithFuzzedHistoryShouldNotRevert (28 calls)
    function test_48_testSqueezeWithFuzzedHistoryShouldNotRevert() public {
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSetSplitsShouldNotRevert(225, 51, 1777379190) {} catch {}
        vm.warp(block.timestamp + 153); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setMaxEndHints(4294967295, 519) {} catch {}
        vm.warp(block.timestamp + 177); vm.roll(block.number + 71655); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.setStreamBalance(167, 806) {} catch {}
        vm.warp(block.timestamp + 234); vm.roll(block.number + 71655); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.addSplitsReceiverWithClamping(148, 253, 281) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeWithDefaultHistoryShouldNotRevert(182, 251) {} catch {}
        vm.warp(block.timestamp + 234); vm.roll(block.number + 71655); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSetStreamsShouldNotRevert(172, 15, 955789496404984563117369670144670361280581125247, 340362438, 2953241717, 40182279208143538897491898) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 44145); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.addSplitsReceiverWithClamping(249, 112, 2103351207) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testSqueezeViewVsActual(209, 1) {} catch {}
        vm.warp(block.timestamp + 137); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.give(237, 0, 19) {} catch {}
        vm.warp(block.timestamp + 345); vm.roll(block.number + 119425); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.removeAllSplits(128) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeAllSenders(0) {} catch {}
        vm.warp(block.timestamp + 165); vm.roll(block.number + 71655); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 142); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.testSplittableAfterSplit(12) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 44701); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.collect(110, 85) {} catch {}
        vm.warp(block.timestamp + 234); vm.roll(block.number + 71655); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.receiveStreams(67, 2286760129) {} catch {}
        vm.warp(block.timestamp + 99); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testAddStreamShouldNotRevert(59, 254, 779716009440172170054031094125660588776487688639, 2884894465, 1330346979, 393176660281371458938513014) {} catch {}
        vm.warp(block.timestamp + 407); vm.roll(block.number + 119425); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testCollect(254, 43) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.receiveStreams(75, 647537650) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.testReceiveStreamsShouldNotRevert(85) {} catch {}
        vm.warp(block.timestamp + 449); vm.roll(block.number + 177075); vm.prank(address(0x0000000000000000000000000000000000040000)); try t.addStreamImmediatelySqueezable(49, 9, 1461501637330902918203684832716283019655932542974) {} catch {}
        vm.warp(block.timestamp + 156); vm.roll(block.number + 57096); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.testCollect(123, 132) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 51563); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.squeezeToSelf(255) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testReceiveStreamsViewConsistency(48, 3430495148) {} catch {}
        vm.warp(block.timestamp + 242); vm.roll(block.number + 71655); vm.prank(address(0x0000000000000000000000000000000000010000)); try t.invariantWithdrawAllTokensShouldNotRevert() {} catch {}
        vm.warp(block.timestamp + 63); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testSqueezableAmountCantBeUndone(252, 217, 1109103725256858979312225678808865016135256995356, 1194798572, 2324481557, 0) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000020000)); try t.split(109) {} catch {}
        vm.warp(block.timestamp + 78); vm.roll(block.number + 23885); vm.prank(address(0x0000000000000000000000000000000000030000)); try t.testCollectableAfterSplit(145) {} catch {}
        vm.warp(block.timestamp + 81); vm.roll(block.number + 47770); vm.prank(address(0x0000000000000000000000000000000000040000)); t.testSqueezeWithFuzzedHistoryShouldNotRevert(34, 160, 62, bytes32(0x78e09956769da36c8e83cf06481e2edc0744356e0cac1c442cac66eec0b06b9d));
    }
}
