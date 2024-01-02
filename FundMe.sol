// SPDX-License-Identifier: MIT

// Fund the donation
//withdraw from the donation
// set a minimum value of payment in Usd

pragma solidity ^0.8.23;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    address public owner;

    AggregatorV3Interface public aggregator;

    constructor(AggregatorV3Interface _aggregator)  {
        aggregator = _aggregator;
        //owner = msg.sender;
    }

    uint256 public constant MINIMUM_USD = 5e18;

    function fund() public payable {
        uint256 ethAmount = msg.value;
        require(
            PriceConverter.getPriceInUsd(aggregator, ethAmount) >= MINIMUM_USD,
            "Please top up your balance to make this transaction"
        );
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += ethAmount;
    }

    function withdraw() public ownerOnly {
        for (
            uint256 funderIndex = 0;
            funderIndex < funders.length;
            funderIndex++
        ) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        // resetting the array
        funders = new address[](0);

        // in soldity,there  are basically three ways so withraw the native coin
        //i Transfer
        //ii Send
        //iii Call

        //also to make the function sendable, the sender has to be type casted using the payable() method
        //the transfer method throws an error if it fails

        // payable(msg.sender).transfer(address(this).balance);

        // the send methods returns a boolean of true if the transaction was success or false if it fails
        /* 
            bool sendSuccess = payable(msg.sender).send(address(this).balance);
            require(sendSuccess, "Sending Failed");
        */

        // the call
        (bool callSuccess, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(callSuccess, "Call Failed");
    }

    // NOTE:: in solidity, there are two types of addresses
    // i) normal address:  msg.sender
    // ii) payable address: payable(msg.sender)

    modifier ownerOnly(){
        require(msg.sender == owner, "Only owner can withdraw");
    _   ;
    }
}


//0x5B38Da6a701c568545dCfcB03FcB875f56beddC4