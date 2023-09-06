// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.2 <0.9.0;

//Public private internal external and inheritance
contract Visibility{

    function publicF() public pure returns (uint){
        return 1;
    }

    function privateF() private pure returns (uint){
        return 2;
    }

    function internalF() internal pure returns (uint){
        return 3;
    }

    function externalF() external pure returns (uint){
        return 4;
    }
}

//Only internal and Public are avaiable 
contract Child is Visibility{
    uint internalVal = internalF();
    uint publicVal = publicF();
}


//Only external and Public are avaiable 
contract ExternalContract {
    Visibility obj = new Visibility();
    uint public externalVal = obj.externalF();
}