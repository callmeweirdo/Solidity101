// SPDX-License-Identifier: MIT

// Fund the donation
//withdraw from the donation
// set a minimum value of payment in Usd

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    AggregatorV3Interface public aggregator;

    constructor(AggregatorV3Interface _aggregator) {
        aggregator = _aggregator;
    }

    uint256 public minimumUsd = 5e18;

    function fund() public payable {
    uint256 ethAmount = msg.value;
    require(PriceConverter.getPriceInUsd(aggregator, ethAmount) >= minimumUsd, "Please top up your balance to make this transaction");
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender] += ethAmount;
    }

    function withdraw() public {
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        // resetting the array
        funders = new address[](0);

        // in soldity,there  are basically three ways so withraw the native coin
        //i Transfer
        //ii Send
        //iii Call
        payable(msg.sender).transfer(address(this).balance);
    }
}