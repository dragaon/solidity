
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.2 <0.9.0;

contract Pay{

    address payable receiver = payable (0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB);

    //Transfer to the current account
    function PayEther() public payable {

    }

    function getBal() public view returns (uint){
        return address(this).balance;
    }

    /**
    * Transfer from current account to receiver
    **/
    function sendEtherToAccount() public {
        receiver.transfer(1 ether);
    }
}