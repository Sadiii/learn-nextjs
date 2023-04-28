// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^ 0.8.18;


contract State{
    //Here in this exmple we are linking student name with roll no, 
    // roll no is gonna be key and value we be added by setter function .
    mapping(uint => string) public roll_no ;

    function setter (uint key, string memory name) public { 
        roll_no[key] = name;
    }
}