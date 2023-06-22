// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/TimeAuction.sol";

contract TestTimeAuction is Test {
    TimeAuction public auction;
    uint256 private startAt;

    //vm.warp - set block.timestamp to a future timestamp
    //vm.roll - set block.number
    //skip - increment current timestamp
    //rewind - decrement current timestamp

    function setUp() public {
        auction = new TimeAuction();
        startAt = block.timestamp;
    }

    function testBidFailsBeforeStartTime() public {
        vm.expectRevert(bytes("not in auction time"));
        auction.bid{value: 1 ether}();
    }

    function testBid() public {
        vm.warp(startAt + 1 days);
        auction.bid{value: 1 ether}();
    }

    function testBidFailsAfterEndTime() public {
        console.log("hello world");
        vm.warp(startAt + 2 days + 1);
        vm.expectRevert(bytes("not in auction time"));
        auction.bid{value: 1 ether}();
    }

    function testTimestamp() public {
        uint t = block.timestamp;

        // skip - increment current timestamp
        skip(100);

        assertEq(
            block.timestamp,
            t + 100,
            "timestamp should be incremented by 100"
        );

        // rewind - decrement current timestamp
        rewind(10);

        assertEq(
            block.timestamp,
            t + 100 - 10,
            "timestamp should be decremented by 10"
        );
    }

    function testBlockNumber() public {
        // vm.roll - set block.number

        uint b = block.number;
        vm.roll(999);

        assertEq(block.number, 999, "block.number should be incremented");

    }
}
