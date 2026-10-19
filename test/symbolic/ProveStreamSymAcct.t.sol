// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Streams, StreamReceiver, StreamConfigImpl} from "src/Streams.sol";
import {IERC20} from "openzeppelin-contracts/token/ERC20/IERC20.sol";

/*
    Symbolize the states[erc20][accountId] KEY for the Streams proofs (advisor §7).
    The symbolic account forces _setStreams INSIDE the property call, so updateTime is the
    symbolic block.timestamp; the balance is then queried in the same call. Symbolic-key
    WRITE => Pass B (symExecAbstractArith: true) per the aliasing rule.
*/
contract StreamSymAcctHarness is Streams {
    IERC20 constant ERC20 = IERC20(address(0xE12C20));
    uint256 constant RECV = 42;
    uint32 constant CYCLE = 604800;
    uint160 constant RATE = 1e9;                 // 1 token/sec
    uint32 public constant DUR = 300000;         // bounded duration, < 1 cycle
    uint128 public constant DEPOSIT = 500_000;   // covers DUR exactly at 1 token/sec

    constructor() Streams(CYCLE, keccak256("drips.streams.symacct.fv")) {}

    function _cfg(uint32 start) internal pure returns (StreamReceiver[] memory r) {
        r = new StreamReceiver[](1);
        r[0] = StreamReceiver(RECV, StreamConfigImpl.create(0, RATE, start, DUR));
    }
    // set stream for SYMBOLIC account at current (symbolic) time, query balance in same call
    function setAndBalNow(uint256 acc) external returns (uint128 bal) {
        StreamReceiver[] memory empty = new StreamReceiver[](0);
        uint32 nowTs = uint32(block.timestamp);
        // perfect maxEnd hints collapse _calcMaxEnd's binary search to one step
        _setStreams(acc, ERC20, empty, int128(uint128(DEPOSIT)), _cfg(nowTs), nowTs + DUR, nowTs + DUR + 1);
        bal = _balanceAt(acc, ERC20, _cfg(nowTs), nowTs);
    }
    // same but query at a later symbolic time t (draining projection, both times symbolic)
    function setAndBalAt(uint256 acc, uint32 t) external returns (uint128 bal) {
        StreamReceiver[] memory empty = new StreamReceiver[](0);
        uint32 nowTs = uint32(block.timestamp);
        _setStreams(acc, ERC20, empty, int128(uint128(DEPOSIT)), _cfg(nowTs), nowTs + DUR, nowTs + DUR + 1);
        bal = _balanceAt(acc, ERC20, _cfg(nowTs), t);
    }

    // EMPTY receivers => _calcMaxEnd shortcircuits CONCRETELY (configsLen==0), isolating the
    // symbolic-key states[erc20][acc] write/read (the advisor's slot) from the search.
    function setEmptyBal(uint256 acc) external returns (uint128 bal) {
        StreamReceiver[] memory empty = new StreamReceiver[](0);
        _setStreams(acc, ERC20, empty, int128(uint128(DEPOSIT)), empty, 0, 0);
        bal = _balanceAt(acc, ERC20, empty, uint32(block.timestamp));
    }
}

contract ProveStreamSymAcct is Test {
    StreamSymAcctHarness h;
    function setUp() public { h = new StreamSymAcctHarness(); }

    // SIMPLEST: right after setStreams, balance == deposit, for EVERY account
    function prove_deposit_exact_symacct(uint256 acc) public {
        assert(h.setAndBalNow(acc) == h.DEPOSIT());
    }
    // STRONG: exact draining projection ∀ account, ∀ t within the stream duration
    function prove_active_exact_symacct(uint256 acc, uint32 t) public {
        uint32 nowTs = uint32(block.timestamp);
        require(t >= nowTs && t - nowTs <= h.DUR());
        assert(h.setAndBalAt(acc, t) == h.DEPOSIT() - (t - nowTs));
    }

    // states[erc20][acc] bookkeeping for EVERY account (symbolic storage key)
    function prove_balance_symacct_empty(uint256 acc) public {
        assert(h.setEmptyBal(acc) == h.DEPOSIT());
    }
}
