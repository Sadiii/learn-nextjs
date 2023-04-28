// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^ 0.8.18;


contract FixedArray{
    uint[5] public arr =  [10, 15, 20, 40];

    // no push & pop function will work in fixed size array

    function setArray(uint index, uint value) public {
        arr[index] = value;
    }

    function arrayLength() public view returns(uint){
        return arr.length;
    }
    function fullarray() public view returns(uint[5] memory){
        return arr;
    }
}
