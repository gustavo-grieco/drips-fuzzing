// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {StreamConfig, StreamConfigImpl} from "src/Streams.sol";

/*
    FV of the StreamConfig bit-packing round-trip. Pure library, fully SYMBOLIC operands --
    no state, no setUp, no concrete config needed. `create` packs
    `streamId(32) | amtPerSec(160) | start(32) | duration(32)` into a uint256; the four
    accessors unpack it. The proof: every field survives create() then its accessor, for all
    inputs. A packing/masking bug (field bleed) would falsify.

      make verify T=prove_config_roundtrip
*/
contract ProveStreamConfig is Test {
    using StreamConfigImpl for StreamConfig;

    function setUp() public {}

    function prove_config_roundtrip(uint32 id, uint160 aps, uint32 st, uint32 dur) public pure {
        StreamConfig c = StreamConfigImpl.create(id, aps, st, dur);
        assert(c.streamId() == id);
        assert(c.amtPerSec() == aps);
        assert(c.start() == st);
        assert(c.duration() == dur);
    }
}
