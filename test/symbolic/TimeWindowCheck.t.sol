// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Streams, StreamReceiver, StreamConfigImpl} from "src/Streams.sol";
import {IERC20} from "openzeppelin-contracts/token/ERC20/IERC20.sol";

contract TWHarness is Streams {
    IERC20 constant ERC20 = IERC20(address(0xE12C20));
    uint256 constant ACC = 100;
    constructor() Streams(604800, keccak256("drips.timewindow.check")) {}
    function setBal(int128 d) external returns (int128) {
        StreamReceiver[] memory e = new StreamReceiver[](0);
        return _setStreams(ACC, ERC20, e, d, e, 0, 0);
    }
    StreamReceiver[] curr;   // track current receivers for faithful updates
    function setStream(uint160 aps, uint128 dep) external {
        StreamReceiver[] memory r = new StreamReceiver[](1);
        r[0] = StreamReceiver(42, StreamConfigImpl.create(0, aps, 0, 0));
        _setStreams(ACC, ERC20, curr, int128(dep), r, 0, 0);
        delete curr; curr.push(r[0]);
    }
    function balActive() external view returns (uint128) {
        StreamReceiver[] memory r = new StreamReceiver[](1);
        r[0] = curr[0];
        return _balanceAt(ACC, ERC20, r, uint32(block.timestamp));
    }
    function bal() external view returns (uint128) {
        StreamReceiver[] memory e = new StreamReceiver[](0);
        return _balanceAt(ACC, ERC20, e, uint32(block.timestamp));
    }
}

contract TimeWindowCheck is Test {
    function test_far_future_pre_cliff() public {
        vm.warp(uint256(type(uint32).max) - 1000);   // year ~2106, still in uint32
        TWHarness h = new TWHarness();
        h.setBal(1e18); h.setBal(type(int128).min);   // deposit + withdraw-all
        emit log("pre-cliff: setBalance OK");
    }
    function test_cross_cliff_state() public {
        vm.warp(uint256(type(uint32).max) - 1000);
        TWHarness h = new TWHarness();
        h.setBal(1e18);                               // state written pre-cliff
        vm.warp(uint256(type(uint32).max) + 5000);    // PAST the uint32 cliff: truncates to 4904
        try h.setBal(-1) returns (int128) { emit log("post-cliff setBalance: NO revert"); }
        catch Error(string memory r) { emit log_named_string("post-cliff setBalance REVERTED", r); }
        catch { emit log("post-cliff setBalance REVERTED (panic)"); }
        try h.bal() returns (uint128) { emit log("post-cliff balanceAt: NO revert"); }
        catch Error(string memory r) { emit log_named_string("post-cliff balanceAt REVERTED", r); }
        catch { emit log("post-cliff balanceAt REVERTED (panic)"); }
    }
    function test_active_stream_cross_cliff() public {
        vm.warp(uint256(type(uint32).max) - 1000);
        TWHarness h = new TWHarness();
        h.setStream(1e9, 500);                        // active stream ending at cliff-500
        vm.warp(uint256(type(uint32).max) + 5000);
        try h.setStream(2e9, 100) { emit log("post-cliff setStream: NO revert"); }
        // also probe balanceAt over the active pre-cliff stream, post-cliff
        catch Error(string memory r) { emit log_named_string("post-cliff setStream REVERTED", r); }
        catch { emit log("post-cliff setStream REVERTED (panic)"); }
        try h.balActive() returns (uint128) { emit log("post-cliff balanceAt(active): NO revert"); }
        catch Error(string memory r2) { emit log_named_string("post-cliff balanceAt(active) REVERTED", r2); }
        catch { emit log("post-cliff balanceAt(active) REVERTED (panic)"); }
    }
}
