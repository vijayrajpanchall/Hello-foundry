// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Error.sol";

contract ErrorTest is Test {
    Error public error;

    function setUp() public {
        error = new Error();
    }

    function testFail() public {
        error.throwError();
    }

    function testThrowCustomError() public {
        vm.expectRevert();
        error.throwCustomError();
    }

    function testRequireMessage() public {
        vm.expectRevert(bytes("not authorized"));
        error.throwError();
    }

    function testCustomError() public {
        vm.expectRevert(Error.NotAuthorized.selector);
        error.throwCustomError();
    }

    function testErrorLabel() public {
        assertEq(uint256(1), uint256(1), "1 != 1");
        assertEq(uint256(1), uint256(2), "1 != 2");
        assertEq(uint256(1), uint256(1), "1 != 1");
        assertEq(uint256(1), uint256(2), "1 != 2");
        assertEq(uint256(1), uint256(1), "1 != 1");
    }
}