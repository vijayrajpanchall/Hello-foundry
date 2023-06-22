// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Event.sol";

contract EventTest is Test {
    Event public e;

    event Transfer(address indexed from, address indexed to, uint256 amount);

    function setUp() public {
        e = new Event();
    }

    function testEmitTransferEvent() public {
        // function expectEmit(
        //     bool checkTopic1,
        //     bool checkTopic2,
        //     bool checkTopic3,
        //     bool checkData
        // ) external ;

        // 1. Tell Foundry which data to check
        // Check index 1, index 2 and data
        vm.expectEmit(true, true, false, true);

        // 2. Emit the expected event
        emit Transfer(address(0x1), address(0x2), 100);

        // 3. Call the function that should emit the event
        e.transfer(address(0x1), address(0x2), 100);
    }

    function testEmitManyTransferEvent() public {
        address[] memory to = new address[](2);
        to[0] = address(0x2);
        to[1] = address(0x3);

        uint256[] memory amount = new uint256[](2);
        amount[0] = 100;
        amount[1] = 200;

        for(uint256 i = 0; i < to.length; i++) {
        // 1. Tell Foundry which data to check
            vm.expectEmit(true, true, false, true);
        // 2. Emit the expected event
            emit Transfer(address(0x1), to[i], amount[i]);
        }

        // 3. Call the function that should emit the event
        e.transferMany(address(0x1), to, amount);
    }
}