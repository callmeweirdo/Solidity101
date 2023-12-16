// SPDX-License-Identifier: MIT

// Fund the donation
//withdraw from the donation
// set a minimum value of payment in Usd

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    AggregatorV3Interface aggregator;

    constructor(AggregatorV3Interface _aggregator){
        aggregator = _aggregator;
    }

    uint256 public minimumUsd = 5e18;

    function fund() public payable {
        // send funds
        // allow users to send money
        // have a minimum $ to send
        // now how do we send Eth to this contract ?
        require(getPriceInUsd(msg.value) >= minimumUsd, "Please top up your balance to make this transaction"); // 1e18 = 1 ETH = 1000000000000000000
    }

    function getPrice() public view returns (uint256) {
        // Sepolia Eth address 0x694AA1769357215DE4FAC081bf1f309aDC325306
          (,int256 answer, , , ) = aggregator.latestRoundData();
         return uint(answer * 1e10); // 2277945563880000000000

        //(, int256 answer,,,) = aggregator.latestRoundData();
        //return uint256(answer);
    }

    function getPriceInUsd(uint256 userPrice) public view returns(uint256){
        uint256 currentPrice = getPrice(); 
        return (currentPrice * userPrice) / 1e10 ;
        // 114942289698000000000000
        //  $2304.29288149
    }
}//5000000000000000000