// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//Basic program for smart contract to send it to wallet
//TODO get in depth understanding of address, msg, payable, transfer and corresponding methods
//TODO understand Error Handling
contract TransferContractDemo{

    address public owner;
    
    struct Transfer{
        //payable will receive ETH
        address payable recepient;
        uint amount;
    }

    Transfer[] public transfers;

    constructor(){
        //Address of the contract deployer is msg.sender
        owner = msg.sender;
    }

    fallback() external payable { }
    function receive() public payable{} 

    function checkcontractbalance() public view returns (uint){
        //this -> address of the contract
        return address (this).balance;
    }

    function  addTransfer(address payable _receipient , uint _amount) public {
        require(msg.sender == owner,"Only owner of the Contract");
        transfers.push(Transfer(_receipient,_amount));
    }

    //Custom modifier
    function executeTransfer() public onlyOwner returns (bool){
        for (uint i=0; i<transfers.length;i++){
            transfers[i].recepient.transfer(transfers[i].amount);
        }
        return true;
    }

    //Custom modifier
    modifier onlyOwner{
        require(msg.sender == owner,"Only owner of the Contract");
        _;
    }
}