pragma solidity ^0.8.0;
// SPDX-License-Identifier: MIT
contract ReadWrite{
    enum Gender{
        MALE,
        FEMALE,
        NEUTRAL
    }

    Gender _gender;
    Gender defaultGender = Gender.FEMALE;

    function setGender(Gender gender) public {
        _gender = gender;
    }

    function getDefaultGender() public view returns (Gender){
        return defaultGender;
    }

    function getGender() public view returns (Gender){
        return _gender;
    }
}