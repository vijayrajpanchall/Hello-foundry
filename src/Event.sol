// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Event {
    event Transfer(address indexed from, address indexed to, uint256 amount);

    function transfer(address from, address to, uint256 amount) public {
        emit Transfer(from, to, amount);
    }

    function transferMany(address from, address[] memory to, uint256[] memory amount) public {
        for (uint256 i = 0; i < to.length; i++) {
            emit Transfer(from, to[i], amount[i]);
        }
    }

}