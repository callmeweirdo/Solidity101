// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */

contract SimpleContract {

    uint256 public publicNumber;

    struct Person {
        string name;
        uint256 number;
    }

    function store(uint256 _publicNumber) public {
        publicNumber = _publicNumber;
    }

    function retrieve() public view returns (uint256) {
        return publicNumber;
    }

    // Person public David = Person({name: "OG", number: 101});

    Person[] public people;

    mapping(string => uint256) public personNumber;

    function addPerson(string memory _name, uint256 _number) public {
        Person memory newPerson = Person(_name, _number);
        people.push(newPerson);
        personNumber[_name] = _number;

    }

    // end of lesson and will begin another one
}