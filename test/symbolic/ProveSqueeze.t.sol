// SPDX-License-Identifier: GPL-3.0-only
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {EchidnaStart} from "./EchidnaStart.sol";
import {
    Streams,
    StreamReceiver,
    StreamsHistory,
    StreamConfig,
    StreamConfigImpl
} from "src/Streams.sol";
import {IERC20} from "openzeppelin-contracts/token/ERC20/IERC20.sol";

/*
    FV of the squeeze clamp invariant (post1 style), used to DETECT the drips squeeze regression.

    Mechanism (see Streams._squeezeStreamsResult / _streamRange):
      squeezeStartCap = nextSqueezed(0)
      if (squeezeStartCap < cycleStart)  squeezeStartCap = cycleStart
      if (squeezeStartCap < updateTime)  squeezeStartCap = updateTime    <-- clamp REMOVED by the regression
    A stream whose config.start is BACKDATED (start < updateTime) is only re-clamped up to
    squeezeStartCap inside _streamRange, NOT to updateTime. So:
      CLEAN      : squeezeStartCap = updateTime          => squeeze start = updateTime (BASE)
      REGRESSION : squeezeStartCap = cycleStart < update => squeeze start = cycleStart  (over-squeeze)

    The ONLY symbolic input is the squeeze time BASE + dt, dt <= 400000 (EchidnaStart.warpBy), which
    stays inside the cycle that holds BASE = 1524785992. setUp runs at that concrete BASE, so
    _setStreams pins updateTime = BASE (mid-cycle, off = 85192). prove_ then squeezes at the
    symbolic time => a genuine forall over the squeeze time.

    Property: amt <= streamed[updateTime, ts].
      CLEAN      : squeeze start == updateTime => amt == streamed[BASE, ts]           => VERIFIED
      REGRESSION : squeeze start == cycleStart  => amt == streamed[cycleStart, ts] > ref => FALSIFIED

      make verify T=prove_no_pre_update_squeeze
*/
contract SqueezeHarness is Streams {
    IERC20 constant ERC20 = IERC20(address(0xE12C20));
    uint256 constant SENDER = 100;
    uint256 constant RECEIVER = 42;
    uint32 constant CYCLE = 604800;
    uint32 constant BASE = 1524785992; // echidna initialTimestamp == updateTime set in setUp
    uint32 constant CYCLE_START = 1524700800; // cycleStart(BASE)
    uint160 constant RATE = 1e9; // 1 token/sec after the 1e9 multiplier

    uint32 public savedMaxEnd;

    constructor() Streams(CYCLE, keccak256("drips.streams.fv.test")) {}

    // one receiver, start BACKDATED to cycleStart(BASE) (< updateTime), duration 0 => until balance runs out
    function _cfg() internal pure returns (StreamReceiver[] memory r) {
        r = new StreamReceiver[](1);
        r[0] = StreamReceiver({
            accountId: RECEIVER,
            config: StreamConfigImpl.create({
                streamId_: 0,
                amtPerSec_: RATE,
                start_: CYCLE_START,
                duration_: 0
            })
        });
    }

    function initCfg() external {
        StreamReceiver[] memory empty = new StreamReceiver[](0);
        // large balance so the stream stays active across the whole symbolic-time window
        _setStreams(SENDER, ERC20, empty, int128(10_000_000_000), _cfg(), 0, 0);
        (,,,, uint32 me) = _streamsState(SENDER, ERC20);
        savedMaxEnd = me;
    }

    function squeezeAmt() external view returns (uint128 amt) {
        StreamsHistory[] memory h = new StreamsHistory[](1);
        h[0] = StreamsHistory({
            streamsHash: bytes32(0),
            receivers: _cfg(),
            updateTime: BASE,
            maxEnd: savedMaxEnd
        });
        (amt,,,,) = _squeezeStreamsResult(RECEIVER, ERC20, SENDER, bytes32(0), h);
    }

    // exact copy of the private _streamedAmt, specialized to CYCLE / RATE, for the reference bound
    function refStreamed(uint256 start, uint256 end) public pure returns (uint256 amt) {
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

contract ProveSqueeze is EchidnaStart, Test {
    SqueezeHarness h;

    function setUp() public {
        h = new SqueezeHarness();
        h.initCfg();
    }

    // No pre-update squeeze: the squeezed amount never exceeds what could stream since updateTime.
    function prove_no_pre_update_squeeze(uint32 dt) public {
        warpBy(dt, 400000); // inside the cycle that holds START_TIMESTAMP
        uint128 amt = h.squeezeAmt();
        uint256 ref = h.refStreamed(uint256(1524785992), uint256(uint32(block.timestamp)));
        assert(uint256(amt) <= ref);
    }
}
