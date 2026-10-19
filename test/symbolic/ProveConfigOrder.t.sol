// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {StreamConfig, StreamConfigImpl} from "src/Streams.sol";

/*
    Proves StreamConfigImpl.lt (an integer compare on the packed word) is EXACTLY the
    lexicographic order on (streamId, amtPerSec, start, duration). The lt docstring asserts
    "comparing them as integers is equivalent to comparing their fields left to right" but the
    suite never tests it. If the field layout/widths were wrong, integer order would diverge from
    field order and this falsifies. Fully symbolic, pure.
*/
contract ProveConfigOrder is Test {
    using StreamConfigImpl for StreamConfig;

    function _lexLess(uint32 id1, uint160 a1, uint32 s1, uint32 d1,
                      uint32 id2, uint160 a2, uint32 s2, uint32 d2) internal pure returns (bool) {
        if (id1 != id2) return id1 < id2;
        if (a1 != a2) return a1 < a2;
        if (s1 != s2) return s1 < s2;
        return d1 < d2;
    }

    function prove_config_order_lexicographic(
        uint32 id1, uint160 a1, uint32 s1, uint32 d1,
        uint32 id2, uint160 a2, uint32 s2, uint32 d2
    ) public pure {
        StreamConfig c1 = StreamConfigImpl.create(id1, a1, s1, d1);
        StreamConfig c2 = StreamConfigImpl.create(id2, a2, s2, d2);
        assert(c1.lt(c2) == _lexLess(id1, a1, s1, d1, id2, a2, s2, d2));
    }

    // strict order: irreflexive
    function prove_config_order_irreflexive(uint32 id, uint160 a, uint32 s, uint32 d) public pure {
        StreamConfig c = StreamConfigImpl.create(id, a, s, d);
        assert(!c.lt(c));
    }
}
