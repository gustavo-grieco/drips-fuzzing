// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {EchidnaStart} from "./EchidnaStart.sol";
import {Streams, StreamReceiver, StreamsHistory, StreamConfigImpl} from "src/Streams.sol";
import {IERC20} from "openzeppelin-contracts/token/ERC20/IERC20.sol";

/*
    Squeeze pair (EchidnaSqueezeTests): testSqueezeViewVsActual + testSqueezeWithDefaultHistory-
    ShouldNotRevert, module-level with the single-entry (default) history the suite builds from
    stream updates. Symbolic block.timestamp within one cycle (the proven-tractable squeeze regime).
*/
contract SqueezePairHarness is Streams {
    IERC20 constant ERC20 = IERC20(address(0xE12C20));
    uint256 constant SENDER = 100;
    uint256 constant RECEIVER = 42;
    uint32 constant CYCLE = 604800;
    uint32 constant BASE = 1524785992;
    uint160 constant RATE = 1e9;
    uint32 public savedMaxEnd;

    constructor() Streams(CYCLE, keccak256("drips.squeezepair.fv")) {}

    function _cfg() internal pure returns (StreamReceiver[] memory r) {
        r = new StreamReceiver[](1);
        r[0] = StreamReceiver(RECEIVER, StreamConfigImpl.create(0, RATE, BASE, 0));
    }
    function initCfg() external {
        StreamReceiver[] memory e = new StreamReceiver[](0);
        _setStreams(SENDER, ERC20, e, int128(10_000_000_000), _cfg(), 0, 0);
        (,,,, savedMaxEnd) = _streamsState(SENDER, ERC20);
    }
    function _hist() internal view returns (StreamsHistory[] memory hh) {
        hh = new StreamsHistory[](1);
        hh[0] = StreamsHistory(bytes32(0), _cfg(), BASE, savedMaxEnd);
    }
    function squeezeView() external view returns (uint128 amt) {
        (amt,,,,) = _squeezeStreamsResult(RECEIVER, ERC20, SENDER, bytes32(0), _hist());
    }
    function squeezeActual() external returns (uint128 amt) {
        amt = _squeezeStreams(RECEIVER, ERC20, SENDER, bytes32(0), _hist());
    }
    // SYMBOLIC receiver account (symbolize the nextSqueezed[accountId]/states key)
    function squeezeViewFor(uint256 recv) external view returns (uint128 amt) {
        (amt,,,,) = _squeezeStreamsResult(recv, ERC20, SENDER, bytes32(0), _hist());
    }
    function squeezeActualFor(uint256 recv) external returns (uint128 amt) {
        amt = _squeezeStreams(recv, ERC20, SENDER, bytes32(0), _hist());
    }
}

contract ProveSqueezePair is EchidnaStart, Test {
    SqueezePairHarness h;
    function setUp() public { h = new SqueezePairHarness(); h.initCfg(); }

    // = testSqueezeViewVsActual
    function prove_squeeze_view_eq_actual(uint32 dt) public {
        warpBy(dt, 2000000000);
        uint128 v = h.squeezeView();
        uint128 a = h.squeezeActual();
        assert(v == a);
    }
    // = testSqueezeViewVsActual for EVERY receiver account (symbolic storage key)
    function prove_squeeze_view_eq_actual_symacct(uint256 recv, uint32 dt) public {
        warpBy(dt, 2000000000);
        uint128 v = h.squeezeViewFor(recv);
        uint128 a = h.squeezeActualFor(recv);
        assert(v == a);
    }
    // = testSqueezeWithDefaultHistoryShouldNotRevert
    function prove_squeeze_default_no_revert(uint32 dt) public {
        warpBy(dt, 2000000000);
        try h.squeezeActual() {} catch { assert(false); }
    }
}
