// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//Basic program for conditions and loops

contract CondLoops{
    function isBalaceThere() public view returns  (bool){
        if (address(this).balance > 0){
            return true;
        }
        return false;
    }

    function isBalaceMorethan10() public view returns  (bool){
        return address(this).balance > 10 ? true : false;
    }

    function getSumOfNFor(int n) public pure returns (int){
        int sum =0;
        int iter = n>0 ? n : -n;
        for (int i=1; i <=iter;i++){
            sum = sum + i;
        }
        return n>0? sum: -sum;
    }

    function getSumOfNWhile(int n) public pure returns (int){
        int sum =0;
        int iter = n>0 ? n : -n;
        int i =1;
        while (i <=iter){
            sum = sum + i;
            i++;
        }
        return n>0? sum: -sum;
    }

    function getSumOfNDoWhile(int n) public pure returns (int){
        int sum =0;
        int iter = n>0 ? n : -n;
        int i =1;
        do{ 
            sum = sum + i;
            i++;
        }while (i <=iter);
        return n>0? sum: -sum;
    }


    function getDecOfNDoWhile(int n) public pure returns (int){
        int sum =n;
        int iter = n>0 ? n : -n;
        int i =1;
        do{ 
            sum = sum - i;
            i--;
        }while (i <=iter);
        return n>0? sum: -sum;
    }
}