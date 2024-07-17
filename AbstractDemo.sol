//Abstract and interface Demo
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

abstract contract Student{
    //Function declaration
    function getName() public virtual returns (string memory);
    function setAge(uint age) public virtual returns (uint);
    function setHeight(uint height) public virtual returns (uint);
}

interface  AbstractContractInterface{
    //Implicit Virtual
    function getName() external  returns (string memory);
    function setAge(uint age) external  returns (uint);
    function setHeight(uint height) external  returns (uint);
}

contract Member is Student{
    string name = "Prakash";
    uint _age ;
    uint _height;

    //Funciton declaration and definition
    function getName() public override view returns (string memory){
        return name;
    }

    function setAge(uint age) public override virtual returns (uint){
        _age = age;
        return age;
    }

    function setHeight(uint height) public override virtual returns (uint){
        _height = height;
        return height;
    }
}


contract Member1 is AbstractContractInterface{
    string name = "Prakash";
    uint _age ;
    uint _height;

    //Funciton declaration and definition and no override is needed
    function getName() public  view returns (string memory){
        return name;
    }

    function setAge(uint age) public  virtual returns (uint){
        _age = age;
        return age;
    }

    function setHeight(uint height) public  virtual returns (uint){
        _height = height;
        return height;
    }
}