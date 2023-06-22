// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract TimeAuction {
    uint256 public startAt = block.timestamp + 1 days;
    uint256 public endAt = block.timestamp + 2 days;

    function bid() public payable {
        require(block.timestamp >= startAt && block.timestamp <= endAt, "not in auction time");
    }

    function end() public {
        require(block.timestamp > endAt, "auction not ended");
    }
}