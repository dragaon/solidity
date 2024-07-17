//Math Lib Demo usage
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "contracts/MathLib.sol";

contract MathLibDemo{

    MathLib m = new MathLib();

    function addTwoNumbers(uint a, uint b) public view returns (uint){
        return m.add(a,b);
    }

    function subTwoNumbers(uint a, uint b) public view returns (uint){
        return m.substract(a, b);
    }
}