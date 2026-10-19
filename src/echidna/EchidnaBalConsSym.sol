// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./EchidnaStreamsTests.sol";

// Full-deployment falsification harness for testBalanceAtInFuture, using ONLY the hevm `store`
// cheatcode to make the sender's stream *balance* symbolic (no hevm/echidna source changes).
//
// The counterexample state (a mid-cycle sender with an active high-amtPerSec stream whose
// continuously-drained balance exceeds the cycle-quantized receivable) is unreachable from the
// concrete deployed storage by varying calldata alone (symbolify keeps storage concrete). We
// therefore (1) establish a REAL stream USER1->USER0 through the contract's own setStreams so the
// receivers-list <-> streamsHash coupling stays consistent, then (2) overwrite ONLY the
// non-hashed `balance` scalar in the sender's StreamsState slot with a symbolic value, and
// (3) check the conservation equality across a mid-cycle warp.
contract EchidnaBalConsSym is EchidnaStreamsTests {
    // keccak256("eip1967.streams.storage") - 1024, per Managed._erc1967Slot
    function _streamsStateBaseSlot(uint256 accId) internal view returns (uint256) {
        bytes32 streamsSlot = bytes32(uint256(keccak256("eip1967.streams.storage")) - 1024);
        // StreamsStorage.states is at offset 0 -> mapping base == streamsSlot
        bytes32 byErc20 = keccak256(abi.encode(address(token), streamsSlot));
        return uint256(keccak256(abi.encode(accId, byErc20)));
    }

    function prove_balance_conservation_symbalance(
        uint160 amtPerSec,
        uint128 symBalance
    ) public {
        address from = ADDRESS_USER1;
        address to = ADDRESS_USER0;
        uint256 fromAccId = getDripsAccountId(from);

        // (1) a real stream so streamsHash matches getStreamReceivers(from)
        amtPerSec = clampAmountPerSec(amtPerSec);
        uint128 bal = uint128(amtPerSec) * SECONDS_PER_CYCLE;
        bal = uint128(clampBalanceDelta(int128(bal), from));
        require(bal / amtPerSec >= SECONDS_PER_CYCLE);
        addStream(1, 0, amtPerSec, 0, 0, int128(bal));

        // (2) symbolize ONLY the balance field (slot base+3, bits [96..223]), preserving the rest
        uint256 slot = _streamsStateBaseSlot(fromAccId) + 3;
        uint256 packed = uint256(hevm.load(address(drips), bytes32(slot)));
        uint256 mask = ((uint256(1) << 128) - 1) << 96;          // balance occupies bits 96..223
        require(symBalance <= bal);                               // reachable: no more than deposited
        packed = (packed & ~mask) | (uint256(symBalance) << 96);
        hevm.store(address(drips), bytes32(slot), bytes32(packed));

        // (3) conservation across a mid-cycle warp
        uint256 t0 = block.timestamp;
        uint128 balBefore = getStreamBalanceForUser(from, uint32(t0));
        uint128 recvBefore = getReceivableAmountForAllUsers();

        hevm.warp(getCurrentCycleEnd() + 1);
        uint128 balAfter = getStreamBalanceForUser(from, uint32(block.timestamp));
        uint128 recvAfter = getReceivableAmountForAllUsers();
        hevm.warp(t0);

        assert(balBefore >= balAfter);
        assert(recvAfter >= recvBefore);
        // the continuous drain from the sender must equal the receivers' receivable gain
        assert(balBefore - balAfter == recvAfter - recvBefore);
    }
}
