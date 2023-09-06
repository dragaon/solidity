// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.2 <0.9.0;

enum StudentType{RESIDENTIAL, DAYSCHOLAR, REPEAT}

struct Student{
    uint id;
    string name;
    StudentType stype;
    uint rank;
}



contract Struct{
    mapping (uint => Student) public students;

    string[] public quota = ["10%","24%","36%"];


    function addStudent(uint _id, string memory _name, uint _rank, StudentType _type) public{
        Student memory s2 = Student({
            id : _id,
            name: _name,
            stype: _type,
            rank : _rank
        });

        students[_id] = s2;
    }

    function memUpdate() public view{
        string[] memory quota1 = quota;
        quota1[0] = "8%";
    }

    function storeUpdate() public{
        string[] storage quota1 = quota;
        quota1[0] = "87%";
    }
}