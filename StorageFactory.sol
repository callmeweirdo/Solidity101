// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import {SimpleContract} from "./index.sol";

contract StorageFactory{
    // uint256 public name;

    SimpleContract[] public listOfSimpleContract;

    function createSimpleStorageContract() public {
        SimpleContract newSimpleContract = new SimpleContract();
        listOfSimpleContract.push(newSimpleContract);
    }

    function sfStore(uint256 _sfStoreIndex, uint256 _sfStoreNumber  ) public {
        SimpleContract simpleContract = listOfSimpleContract[_sfStoreIndex];
        simpleContract.store(_sfStoreNumber);
    }

    function sfGet(uint256 _sfStoreIndex ) public view returns (uint256 _sfStoreNumber){
        SimpleContract simpleContract = listOfSimpleContract[_sfStoreIndex];
        return simpleContract.retrieve();
    }

}
