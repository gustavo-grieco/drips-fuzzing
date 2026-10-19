// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {
    Streams,
    StreamReceiver,
    StreamsHistory,
    StreamConfig,
    StreamConfigImpl
} from "src/Streams.sol";
import {IERC20} from "openzeppelin-contracts/token/ERC20/IERC20.sol";

/*
    THE "balanceOf trick" applied to drips squeeze (SLOAD -> single symbolic value).

    Instead of building state through _setStreams (or the full driver deployment, which bakes in
    33 keccak preimages and gets hevm stuck in symbolic SLOAD-aliasing BEFORE any SMT query), we
    inject the sender's StreamsState directly with vm.store into precomputed slots. The squeeze only
    reads three sender fields -- streamsHistoryHash (+0) and the packed updateTime|lastUpdatedCycleConfigs
    (+3) -- so two vm.store writes suffice. `nextSqueezed` is never written; echidna keeps the deployed
    storage concrete, so it reads back as 0 (no earlier squeeze in this cycle).

    Crucially, updateTime is injected as a SYMBOLIC value U (a prove_ parameter). This is impossible
    with _setStreams, whose setUp runs at the fixed concrete initialTimestamp. So this proves the clamp
    invariant forall updateTime U, forall block.timestamp -- with a lean store
    (few preimages) that stays tractable.

    Hash consistency with symbolic U: streamsHistoryHash = hashStreamsHistory(0, hashStreams(cfg), U, MAXEND)
    is stored AND recomputed by _verifyStreamsHistory from the passed history (same U) => identical keccak
    expr => equality simplifies to true, no preimage blowup.

      make prove_squeeze_vmstore
*/
contract SqueezeVmStoreHarness is Streams {
    IERC20 constant ERC20 = IERC20(address(0xE12C20));
    uint256 constant SENDER = 100;
    uint256 constant RECEIVER = 42;
    uint32 constant CYCLE = 604800;
    uint32 constant CYCLE_START = 1524700800; // backdated config.start (< any injected updateTime)
    uint160 constant RATE = 1e9;
    uint32 constant MAXEND = 4_000_000_000; // < 2^32, above the whole symbolic-time window
    bytes32 constant S = keccak256("drips.streams.vmstore.fv");

    constructor() Streams(CYCLE, S) {}

    function _cfg() internal pure returns (StreamReceiver[] memory r) {
        r = new StreamReceiver[](1);
        r[0] = StreamReceiver({
            accountId: RECEIVER,
            config: StreamConfigImpl.create(0, RATE, CYCLE_START, 0)
        });
    }

    // slot of states[ERC20][SENDER] (StreamsState base) -- two-level mapping keccak, computed once
    function senderBase() external pure returns (uint256) {
        bytes32 slot1 = keccak256(abi.encode(ERC20, S));
        return uint256(keccak256(abi.encode(SENDER, slot1)));
    }

    // packed slot +3: nextReceivableCycle(0..31)=0 | updateTime(32..63)=U | maxEnd(64..95)=MAXEND
    //                 | balance(96..223)=0 | lastUpdatedCycleConfigs(224..255)=1
    function packedFor(uint32 U) external pure returns (bytes32) {
        return bytes32((uint256(U) << 32) | (uint256(MAXEND) << 64) | (uint256(1) << 224));
    }

    function histHashFor(uint32 U) external view returns (bytes32) {
        return _hashStreamsHistory(bytes32(0), _hashStreams(_cfg()), U, MAXEND);
    }

    function squeezeAmt(uint32 U) external view returns (uint128 amt) {
        StreamsHistory[] memory h = new StreamsHistory[](1);
        h[0] = StreamsHistory({streamsHash: bytes32(0), receivers: _cfg(), updateTime: U, maxEnd: MAXEND});
        (amt,,,,) = _squeezeStreamsResult(RECEIVER, ERC20, SENDER, bytes32(0), h);
    }

    function refStreamed(uint256 start, uint256 end) external pure returns (uint256 amt) {
        uint256 cycleSecs = CYCLE;
        uint256 amtPerSec = RATE;
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

contract ProveSqueezeVmStore is Test {
    SqueezeVmStoreHarness h;

    function setUp() public {
        h = new SqueezeVmStoreHarness();
    }

    // forall updateTime U in [BASE, BASE+1e5], forall block.timestamp:
    // the squeezed amount never exceeds what could stream since U.
    function prove_squeeze_vmstore(uint32 U) public {
        require(U >= 1524785992 && U <= 1524885992); // U above config.start, within a bounded window
        uint256 base = h.senderBase();
        vm.store(address(h), bytes32(base + 0), h.histHashFor(U)); // streamsHistoryHash
        vm.store(address(h), bytes32(base + 3), h.packedFor(U)); // updateTime | lastUpdatedCycleConfigs
        uint128 amt = h.squeezeAmt(U);
        uint256 ref = h.refStreamed(uint256(U), uint256(uint32(block.timestamp)));
        assert(uint256(amt) <= ref);
    }
}
