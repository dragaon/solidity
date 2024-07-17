// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


//Function overloading

contract member{
    string _name;
    uint _age;

    function setDetails(string memory name, uint age) public {
        _name = name;
        _age = age;
    }

    function setDetails(string memory name) public {
        _name = name;
    }

    function setDetails( uint age) public {
        _age = age;
    }
}