// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^ 0.8.18;

contract VariableTypes{
    //state variable and public creates getter function by default
    string public name; 
    uint public rollNo = 10;

    constructor(){
        name = 'Sadia';
    }

    function displayAge() pure public returns(uint){
        uint age = 10; // local variable stores in stack
        return age;
        
    }
    function displayUser(string memory User) pure public returns(string memory){
        //function parameters
        //  string variable by defaut refers to storage, we use memory so that variable store in memory instead of contract storage or stack
        return string.concat('Hello ', User);
        
    }
    

}