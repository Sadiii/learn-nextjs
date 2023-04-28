// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^ 0.8.18;

contract DynamicArray{
    
    uint[] public arr = [10,5];

    function addElement(uint value) public {
        arr.push(value);
    }

    function removeElement() public {
        arr.pop();
    }

    function arrayLength()view public returns(uint) {
        return arr.length;
    }
}