// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^ 0.8.18;


contract Function{
    // public create getter by default of that variable
    string public studentname; 
    uint age; // bydefault variable is private

    constructor(){
        studentname = 'David';
        age = 27;
    }

    //getter for age function
    function getAge() view public returns(uint){ 
        return age;
    }

    function ageSetter(uint newAge) public {
        age = newAge;
    }

    function addNumbers(uint _a, uint _b) public pure returns (uint) {
        return _a + _b; // add the two numbers and return the result
    }
}