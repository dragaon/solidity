// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//Inheritance Demo with Visibility and modifiers
//Visibility -> Private, Public, Internal, External
//Modifier -> payable, view, pure
//Default Visibility for Variable is internal
//Default Visibility for functions is public

contract Parent{
    string name = "Dragaon";
    //Inheritable but not visible out side
    string internal uid = "UX1909";
    uint id = 32;
    

    //Inheritable and visible outside 
    string public qualification;

    function getid() public view returns (uint){
        return id;
    }

    //Not inheritable and not visible outside
    function getNameById(uint inputId) private view returns (string memory){
        if (id == inputId){
            return name;
        }
        return "Not Found";
    }
}

contract Child is Parent{
    int internal salary = 10000;
    
    function getName()  public view returns (string memory){
        return string.concat(name, " " , uid);
    }

    //Inheritable but cannot call this function internally
    function getUID() external view returns (string memory){
        return uid;
    }

    function checkExternal() external pure returns (string memory) {
       return "A0";
    }

    function getSalary() external view returns (int){
        return salary + 1000;
    }
}

contract GrandChild is Child{
    function setQualificatio(string memory qual ) public {
        string memory qual1= getQualificatio();
        qualification = string.concat(qual1, qual);
    }

    function getQualificatio() public view returns (string memory){
            return qualification;
    }
}

contract Vehicle{

}

contract Safety{

}

contract BodyType{

}

contract Tyres{

}

//Multiple Inheritance
contract RoadVehicle is Vehicle, Safety{

}

contract AQUAVehile is RoadVehicle, BodyType, Tyres{

}