// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {EchidnaStart} from "./EchidnaStart.sol";
import {Streams, StreamReceiver, StreamConfigImpl} from "src/Streams.sol";
import {IERC20} from "openzeppelin-contracts/token/ERC20/IERC20.sol";

/*
    Faithful-in-spirit reproduction of the KNOWN-FAILING testBalanceAtInFuture conservation:
    a sender's balance drains CONTINUOUSLY (_balanceAt, per-second) while a receiver can only
    receive CYCLE-QUANTIZED amounts (_receiveStreamsResult sums COMPLETED cycles). Mid-cycle these
    disagree, so `senderDrained == receiverReceivable` must FALSIFY.
*/
contract BalConsHarness is Streams {
    IERC20 constant ERC20 = IERC20(address(0xE12C20));
    uint256 constant SENDER = 100;
    uint256 constant RECV = 42;
    uint32 constant CYCLE = 604800;
    uint32 public constant BASE = 1524785992;        // updateTime (echidna initialTimestamp)
    uint32 constant CYCLE_START = 1524700800;         // cycleStart(BASE)
    uint160 constant RATE = 1e9;                       // 1 token/sec
    uint128 public constant DEPOSIT = 10_000_000_000;

    constructor() Streams(CYCLE, keccak256("drips.balcons.fv")) {}

    function _cfg() internal pure returns (StreamReceiver[] memory r) {
        r = new StreamReceiver[](1);
        r[0] = StreamReceiver({accountId: RECV,
            config: StreamConfigImpl.create(0, RATE, CYCLE_START, 0)}); // backdated => immediately squeezable
    }
    function initCfg() external {
        StreamReceiver[] memory empty = new StreamReceiver[](0);
        _setStreams(SENDER, ERC20, empty, int128(DEPOSIT), _cfg(), 0, 0);
    }
    function senderDrained(uint32 t) external view returns (uint128) {
        return DEPOSIT - _balanceAt(SENDER, ERC20, _cfg(), t);
    }
    function receiverReceivable() external view returns (uint128 amt) {
        (amt,,,,) = _receiveStreamsResult(RECV, ERC20, 2);
    }
}

contract ProveBalConservation is EchidnaStart, Test {
    BalConsHarness h;
    function setUp() public { h = new BalConsHarness(); h.initCfg(); }

    // testBalanceAtInFuture core: sender outflow == receiver receivable. EXPECT FALSIFIED.
    // block.timestamp pinned to one mid-cycle instant so the receivable cycle loop is concrete.
    function prove_balance_conservation(uint32 dt) public {
        warpBy(dt, 400000);
        uint128 drained = h.senderDrained(uint32(block.timestamp));
        uint128 receivable = h.receiverReceivable();
        assert(drained == receivable);
    }
}
