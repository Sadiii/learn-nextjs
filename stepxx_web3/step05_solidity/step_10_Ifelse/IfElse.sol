// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^ 0.8.18;

contract ControlStructure{

    function DisplayResult(int value) pure public returns(string memory){
        string memory message;
        if (value>0){
            message = 'Number is Greate than zero';
        }
        else if(value<0){
            message = 'Number is Less than zero';
        }
        else{
            message = 'Number is equal to Zero';
        }
        return message;
    }

}