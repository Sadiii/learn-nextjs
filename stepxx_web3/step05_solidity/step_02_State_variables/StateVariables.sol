// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^ 0.8.18;

contract StateVarible{
    string public name;
    uint public age = 30; // initialize variable while declaring
    uint public num;

    constructor(){
        name='John'; // initialize variable in contructor
    }

    function numset() public{
        num  = 20; //initialize variable through setter function
    }
}