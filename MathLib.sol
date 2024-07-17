//Math Lib Demo
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MathLib {
    function add(uint a, uint b) public pure returns (uint){
        return a+b;
    }

    function substract(uint a, uint b) public pure returns (uint){
        require(a>b," First value should be greather second value");
        return a - b;
    }
}