//My first program with basic data types
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArraysDemo{

    //Account that is being used for deployment of the contract
    address public sender = msg.sender;
    
    enum Brand{
        MARUTHI,
        TATA,
        MAHINDRA,
        KIA,
        HYUNDAI,
        VOLKSWAGS
    }

    enum Transmission{
        AUTO,
        MANUAL
    }

    enum BodyType{
        HATCHBACK,
        SEDAN,
        SUV,
        MPV
    }

    enum SEATING_CAPACITY{
        FIVE,
        SIX,
        SEVEN,
        EIGHT,
        ELEVEN
    }

    struct CAR{
        Brand brand;
        Transmission tansmissionType;
        SEATING_CAPACITY seating;
        BodyType bodyType;
    }
    
   

    CAR wagaonR = CAR({
        brand : Brand.MARUTHI,
        tansmissionType : Transmission.AUTO,
        seating :  SEATING_CAPACITY.FIVE,
        bodyType : BodyType.HATCHBACK
    });

    //Arrays
    CAR[] cars;

    //Brand and Cars
    mapping  (Brand => CAR) carBrands;

    //Collect Addresses
    mapping (address  => uint ) public addressess;
    
    //cars.push(wagaonR);

    function addAddresses(address add, uint num) public {
        addressess [add] = num;
        addressess [msg.sender] = num++;
    }

    function addCar(Brand brand, Transmission tansmissionType, SEATING_CAPACITY seating, BodyType bodyType) public  {
        CAR memory c = CAR(brand, tansmissionType, seating, bodyType);
        cars.push(c);
        cars.push(wagaonR);
    }

    function addBrandCars(Brand brand, CAR memory car) public {
        require(brand < Brand.MARUTHI,"Error" );
        //TODO check if the car exists then retrieve from CARS array and add to map
        carBrands[brand] = car;
    }

    function getBrandCars(Brand brand) public view returns (CAR memory){
        return carBrands[brand];
    }

    function getCar(uint index) public view returns (CAR memory){
        return cars[index];
    }

    function getCarBrandAndTransmission(uint index) public view returns (Brand, Transmission){
        CAR memory c = cars[index];
        return (c.brand, c.tansmissionType);
    }
    
    function getCarInventory() public view returns (uint){
        return cars.length;
    }

}