// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <=0.9.0;

contract Loops{
    uint[] public marks ;
    uint public count;

    function whileLoop() public {
        while(count<5){
            marks[count] = count;
            count ++;
        }
    }

    function forLoop() public{
        for(uint i=0;i<10;count++){
            marks[count] = count;
        }
    }

    function doWhileLoop() public{
        do{
            marks[count] = count;
            count ++;
        }while(count<5);
    }

}