//Abstract Demo
// SPDX-License-Identifier: MIT
pragma solidity >=0.8.9;

//error handling : require, revert, Assert
contract ErrorHandling {
    
    function requireErrorHandling(uint a, uint b) public pure returns (uint){
        require(a >5 ,"First Number should be greater than 5");
        require(b >7 ,"Second Number should be greater than 7");
        return a+b;
    }

    function revertErrorHandling(uint a, uint b) public pure returns (uint){
        if (a <=5 || b <=7){
            revert("First Number should be greater than 5 and second number should be greater than 7");
        }
        return a+b;
    }
    
    function revertAssertHandling(uint a, uint b) public pure returns (uint){
        assert(a>5);
        return a+b;
    }
}