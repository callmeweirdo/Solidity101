// SPDX-License-Identifier: MIT

pragma solidity >="0.8.23";

contract SafeMaths {
    uint8 public number = 255;

    function add() public {
        number = number+=1; // this line of code in the add function wont be valid i solidity version 0.8.0 but will be very valid in version 0.6.0;
        unchecked {number = number+=1;} //to make it valid in verion 0.8.0 we will need to add the uncheked keyword to it and wrap it around a curly bracket
    }
}