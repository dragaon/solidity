//Array and Map demo
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BasicSolidity{

    //Address of the smart contract
    address public myAddress=0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    uint totalValue;
    uint public userCount;
    int8 _age = 12;
    bool _isUserCountReachedMax = false;
    string public message ="Hello!! Welcome to Solidity Programming";
    string public byeMessage='Bye Visit again';
    bytes1 public b1 = 0x45;
    bytes public b ;

    //Enum are based on index. 
    enum _ageCategory {
        CHILD, //Value 0
        TEEN, 
        MIDDLEAGE, 
        SENIORCITIZEN //value 3
    }

    enum Gender{
        MALE,
        FEMALE,
        NEUTRAL
    }

    struct Patient {
        string name;
        uint8 age;
        uint128 uid;
        Gender gender;
    }

    //Maps

    _ageCategory public c1 = _ageCategory.SENIORCITIZEN;

    function add(uint valueToAdd) public returns(uint){
        totalValue = totalValue + valueToAdd;
       userCount ++;
       _isUserCountReachedMax = isUserCountReached();
        return totalValue;
    }

    function getTotalValue() public view returns (uint){
        return totalValue;
    }

    function setAge(int8 age) public{
        _age=age;
    }

    function isUserCountReached() public view returns(bool) {
        if (userCount >5){
            return true;
        }
        return false;
    }

    function getBalance() public view returns (uint256){
        return myAddress.balance;
    }
}