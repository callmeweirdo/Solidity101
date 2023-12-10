// SPDX-License-Identifier: MIT

// Fund the donation
//withdraw from the donation
// set a minimum value of payment in Usd

pragma solidity ^0.8.18;

contract FundMe {
    function fund() public payable {
        // send funds
        // allow users to send money
        // have a minimum $ to send
        // now how do we send Eth to this contract ?
        require(msg.value >= 1e18, "Please top up your balance to make this transaction"); // 1e18 = 1 ETH = 1000000000000000000
    }
}
