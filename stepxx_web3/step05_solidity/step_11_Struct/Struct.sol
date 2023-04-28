// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^ 0.8.18;

struct Employee {
 uint id;
 string name;
 string gender;
}


contract Employees{

    Employee public emp;
    constructor(uint _id, string memory _name, string memory _gender){
        emp.id = _id;
        emp.name = _name;
        emp.gender = _gender;
    }

    function setEmployee (uint _id, string memory _name, string memory _gender) public{

        Employee memory emp2 = Employee({
            id:_id,
            name:_name,
            gender:_gender
        });
        emp = emp2;

    }
}