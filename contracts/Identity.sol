// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.5 <=0.9.0;

contract Identity
{
    string name;
    uint age;
    

    constructor(string memory givenName, uint givenAge) public {
        name = givenName;
        age = givenAge;
    }

    function getName() view public returns(string memory) {
        return name;
    }

    function getAge() view public returns(uint) {
        return age;
    }

    function setAge(uint givenAge) public{
        age = givenAge;
    }
}