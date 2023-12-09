// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import {SimpleContract} from "./index.sol";

contract StorageFactory{
    // uint256 public name;

    SimpleContract public simpleContract;

    function createSimpleStorageContract() public {
        simpleContract = new SimpleContract();
    }
}