// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.5.0;

contract Overflow {
    uint8 public money = 255;

    //Overflow issue. When this is called with any positive number > 0 then money will become zero
    //This is not there in solidity version 0.8.0 or higher 
    function addMoney(uint8 moneyToAdd) public {
        money = money + moneyToAdd;
    }
}