// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//Event Demo
/*
Multi line comments
*/
contract valueAlert{
    uint price = 10;
    event priceEvent(bool returnValue, bool isHigerPrice);

    function higerPriceEventGenerator(uint8 inPrice) public returns (bool flag){
        if (inPrice >= price){
            emit priceEvent(true, true);
            return true;
        }
    }
}