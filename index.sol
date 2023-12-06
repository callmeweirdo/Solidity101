// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */



 contract SimpleContract {

    struct Person {
        string name;
        uint256 number;
    }

    // Person public David = Person({name: "OG", number: 101});

    Person[] public people;

 }