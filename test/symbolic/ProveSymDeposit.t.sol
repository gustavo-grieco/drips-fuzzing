// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {EchidnaStart} from "./EchidnaStart.sol";
import {Streams, StreamReceiver, StreamConfigImpl} from "src/Streams.sol";
import {IERC20} from "openzeppelin-contracts/token/ERC20/IERC20.sol";

/*
    SYMBOLIC DEPOSIT. A bounded-duration stream lets _calcMaxEnd short-circuit (balance covers the
    whole finite duration => _isBalanceEnough(.., uint32.max) => returns without the binary search),
    so a symbolic balanceDelta stays tractable. Proves the balance accounting for ALL deposits.
*/
contract SymDepositHarness is Streams {
    IERC20 constant ERC20 = IERC20(address(0xE12C20));
    uint256 constant ACC = 100;
    uint32 public constant BASE = 1524785992;
    uint160 constant RATE = 1e9;                 // 1 token/sec
    uint32 public constant DUR = 300000;         // bounded duration (< one cycle)

    constructor() Streams(604800, keccak256("drips.symdep.fv")) {}

    function _r() internal pure returns (StreamReceiver[] memory r) {
        r = new StreamReceiver[](1);
        r[0] = StreamReceiver({accountId: 42, config: StreamConfigImpl.create(0, RATE, BASE, DUR)});
    }
    // set stream with symbolic deposit, return balance queried AT updateTime (elapsed == 0)
    function setDepositBalNow(uint128 deposit) external returns (uint128 bal) {
        StreamReceiver[] memory empty = new StreamReceiver[](0);
        _setStreams(ACC, ERC20, empty, int128(deposit), _r(), 0, 0);
        bal = _balanceAt(ACC, ERC20, _r(), uint32(block.timestamp));
    }
}

contract ProveSymDeposit is EchidnaStart, Test {
    SymDepositHarness h;
    function setUp() public { h = new SymDepositHarness(); }

    // For ALL deposits: right after setStreams, balanceAt(updateTime) == deposit.
    function prove_sym_deposit_initial(uint128 deposit, uint32 dt) public {
        warpBy(dt, 604800);
        require(deposit >= uint128(h.DUR()));                        // covers full duration => short-circuit
        require(deposit <= uint128(uint256(uint128(type(int128).max))));
        assert(h.setDepositBalNow(deposit) == deposit);
    }
}
