// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.7.0;

contract Migrations {
    address public owner;
    uint256 public last_completed_migration;

    modifier restricted() {
        if (msg.sender == owner) _;
    }

    constructor() public {
        owner = msg.sender;
    }

    function setCompleted(uint256 completed) private restricted {
        last_completed_migration = completed;
    }

    function upgrade(address new_address) private restricted {
        Migrations upgraded = Migrations(new_address);
        upgraded.setCompleted(last_completed_migration);
    }
}
