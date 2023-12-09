// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */

import {SimpleContract} from "./index.sol";

contract AddFiveStorage is SimpleContract{
    function store(uint256 _newNumber) public override {
        publicNumber = _newNumber + 5;
    }
}