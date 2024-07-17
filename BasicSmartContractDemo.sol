// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//Basic program for smart contract to send it to wallet

contract BasicSmartContractDemo{

    address myWallet = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    //Receiving money into account
    function getPayment() public payable {}

    //fallback() external payable { }

    function transfermoney() public {
        payable (myWallet).transfer(address(this).balance);
    }

    function  transferMoney(address sender, address receiver) public {
        payable (sender).transfer(receiver.balance);
    }
}