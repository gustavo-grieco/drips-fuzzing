// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Streams, StreamReceiver, StreamConfigImpl} from "src/Streams.sol";
import {IERC20} from "openzeppelin-contracts/token/ERC20/IERC20.sol";

/*
    Module-level proof of the echidna invariant `invariantAmtPerSecVsMinAmtPerSec`:
    a stream receiver with amtPerSec < minAmtPerSec can never be stored, because _setStreams
    validates every receiver via _addConfig -> require(amtPerSec >= _minAmtPerSec) (Streams.sol:921).
    forall symbolic amtPerSec < min: _setStreams reverts.
*/
contract MinAmtHarness is Streams {
    IERC20 constant ERC20 = IERC20(address(0xE12C20));
    uint256 constant ACC = 100;
    uint32 constant CYCLE = 604800;

    constructor() Streams(CYCLE, keccak256("drips.minamt.fv")) {}

    function minAmt() external view returns (uint160) {
        return _minAmtPerSec;
    }

    function trySet(uint160 aps) external {
        StreamReceiver[] memory r = new StreamReceiver[](1);
        r[0] = StreamReceiver({accountId: 42, config: StreamConfigImpl.create(0, aps, 0, 0)});
        StreamReceiver[] memory empty = new StreamReceiver[](0);
        _setStreams(ACC, ERC20, empty, int128(1000), r, 0, 0);
    }
}

contract ProveMinAmtPerSec is Test {
    MinAmtHarness h;

    function setUp() public {
        h = new MinAmtHarness();
    }

    // A stream with amtPerSec below the minimum can NEVER be set: _setStreams must revert.
    function prove_amtpersec_min_enforced(uint160 aps) public {
        require(aps < h.minAmt());
        try h.trySet(aps) {
            assert(false); // reached only if a sub-min amtPerSec was accepted
        } catch {}
    }
}
