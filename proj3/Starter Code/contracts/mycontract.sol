// SPDX-License-Identifier: UNLICENSED

// DO NOT MODIFY BELOW THIS
pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract Splitwise {
// DO NOT MODIFY ABOVE THIS

// ADD YOUR CONTRACT CODE BELOW
    mapping(address => mapping(address => uint32)) public debts;
    mapping(address => bool) public users;

    event IOUAdded(address indexed debtor, address indexed creditor, uint32 amount);

    function lookup(address debtor, address creditor) public view returns (uint32) {
        return debts[debtor][creditor];
    }

    function add_IOU(address creditor, uint32 amount) public {
        require(msg.sender != creditor, "You cannot owe yourself.");
        require(amount > 0, "Amount must be positive.");
    
        debts[msg.sender][creditor] += amount;
        users[msg.sender] = true;
        users[creditor] = true;

        emit IOUAdded(msg.sender, creditor, amount);
    }

}
