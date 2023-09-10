// SPDX-License-Identifier: GPL-3.0
 
pragma solidity >=0.5.0 <= 0.9.0;

/** 
    Lottery contract with below business rules
    1. Manager is ultimate authority to select the winner through ramdomly 
    2. Participants should transter at least 1 there
    3. Based on ramdom fucntion output, lottery amount will be transferred to lottery winner
**/

contract Lottery{

    address public manager;
    address payable [] public participants ;

    constructor()  {
        manager = msg.sender;
    }

    //Special function to recieve funds 
    receive() external payable{
        require(msg.value == 0.01 ether);
        participants.push(payable(msg.sender));
    }

    function getBalace() public view returns (uint){
        require(msg.sender == manager);
        return address(this).balance;
    }

    function ramdonIndex() private view returns (uint){
       return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, participants.length)));
    }

    function selectWinner() public {
        address payable winner = participants[ramdonIndex() % participants.length];
        winner.transfer(getBalace());
    }
//prevrandao
}