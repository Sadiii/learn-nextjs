// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^ 0.8.18;

contract Greeting{
    string public greet = 'Hello Crypto World';
    bool public myBool = true;
    // int data type used to represents both positive and negative values
    int public performance = 5;
    // unsigned int is used to represents only positive integers
    uint public age;
    // use to store address of the contracts
    address public owner = msg.sender;

    

}