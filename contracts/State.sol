// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.5.0 <= 0.9.0;

contract State{
    uint public age;

    //by default storage
    string name;

    //Fixed size array
    string[4] public cities = ["NewDelhi","Chennai", "Bangalore", "Mumbai"];

    //Dynamic sized array
    string[] public states;

    //Fixed size byte array
    bytes2 public b2;
    bytes3 public b3;

    //dynamic size byte array
    bytes public b;


    //Initializing
    constructor()  {
        age = 10;
        name="Ethereum";
        b2 = "bc";
        b3 = "xyz";
        b = "Block Chain development";
    }

    //Pure means we are not changing any state variables
    function getMonth()  public pure returns (string memory){
        string memory month = "Jan";
        uint duration = 100;
        duration = duration * 10;
        return month;
    }

   //View means we are reading any state variables
    function getMonth1()  public view returns (string memory){
        string memory month = "Jan";
        uint duration = 100;
        duration = duration * age;
        return month;
    }

    function getLenth() public view returns (uint){
        return cities.length;
    }

    function addState(string memory state ) public{
        states.push(state);
    }

    function removeState() public {
        states.pop();
    }

    function getByteLength() public view returns (uint256){
        return b.length;
    }

    function pushElToByte() public {
        b.push('a');
    }

    function getByteElAt(uint index) public view returns (bytes1){
        return b[index];
    }
}