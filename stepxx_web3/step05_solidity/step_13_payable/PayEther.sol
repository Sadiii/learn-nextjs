// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^ 0.8.18;

contract Transaction{

    address payable  user = payable (0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
    function  payEther() public payable { //send ether to this smart contract

    }
    function getBalance() public view returns(uint){ //check the balance of this smart contract
        return address(this).balance;
    }

    function sendEther() public{ // send ether from this smart contract to account 
    user.transfer(1 ether);
    }
}