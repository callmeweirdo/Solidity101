// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {

    function getPrice(AggregatorV3Interface aggregator) public view returns (uint256) {
        // Sepolia Eth address 0x694AA1769357215DE4FAC081bf1f309aDC325306
          (,int256 answer, , , ) = aggregator.latestRoundData();
         return uint(answer * 1e10); // 2277945563880000000000

        //(, int256 answer,,,) = aggregator.latestRoundData();
        //return uint256(answer);
    }

    function getPriceInUsd(AggregatorV3Interface aggregator, uint256 userPrice) public view returns(uint256){
        uint256 currentPrice = getPrice( aggregator); 
        return (currentPrice * userPrice) / 1e10 ;
        // 114942289698000000000000
        //  $2304.29288149
    }
}