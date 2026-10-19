// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {EchidnaStart} from "./EchidnaStart.sol";
import {Streams, StreamReceiver, StreamConfigImpl} from "src/Streams.sol";
import {IERC20} from "openzeppelin-contracts/token/ERC20/IERC20.sol";

// testBalanceAtInFuture with the MAGIC NUMBER: 3 stream receivers on one sender, one backdated
// (immediately squeezable). Continuous sender outflow vs cycle-quantized total receivable.
contract BalCons3Harness is Streams {
    IERC20 constant ERC20 = IERC20(address(0xE12C20));
    uint256 constant SENDER = 100;
    uint32 constant CYCLE = 604800;
    uint32 public constant BASE = 1524785992;
    uint32 constant CYCLE_START = 1524700800;
    uint160 constant RATE = 1e9;
    uint128 public constant DEPOSIT = 30_000_000_000;

    constructor() Streams(CYCLE, keccak256("drips.balcons3.fv")) {}

    function _cfg() internal pure returns (StreamReceiver[] memory r) {
        r = new StreamReceiver[](3);
        r[0] = StreamReceiver(42, StreamConfigImpl.create(0, RATE, BASE, 0));        // normal
        r[1] = StreamReceiver(43, StreamConfigImpl.create(0, RATE, CYCLE_START, 0)); // backdated => squeezable
        r[2] = StreamReceiver(44, StreamConfigImpl.create(0, RATE, BASE, 0));        // the "added" stream
    }
    function initCfg() external {
        StreamReceiver[] memory empty = new StreamReceiver[](0);
        _setStreams(SENDER, ERC20, empty, int128(DEPOSIT), _cfg(), 0, 0);
    }
    function senderDrained(uint32 t) external view returns (uint128) {
        return DEPOSIT - _balanceAt(SENDER, ERC20, _cfg(), t);
    }
    function receiverReceivable() external view returns (uint128 amt) {
        (uint128 a,,,,) = _receiveStreamsResult(42, ERC20, 2);
        (uint128 b,,,,) = _receiveStreamsResult(43, ERC20, 2);
        (uint128 c,,,,) = _receiveStreamsResult(44, ERC20, 2);
        amt = a + b + c;
    }
}

contract ProveBalConservation3 is EchidnaStart, Test {
    BalCons3Harness h;
    function setUp() public { h = new BalCons3Harness(); h.initCfg(); }
    function prove_balance_conservation3(uint32 dt) public {
        warpBy(dt, 1500000);
        assert(h.senderDrained(uint32(block.timestamp)) == h.receiverReceivable());
    }
}
