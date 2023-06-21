// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/helloWorld.sol";

contract helloWorldTest is Test {
    helloWorld public HW;

    function setUp() public {
        HW = new helloWorld();
    }

    function testGreet() public {
        assertEq(HW.greet(), "Hello World!");
    }
}