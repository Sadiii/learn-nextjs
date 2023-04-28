// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^ 0.8.18;

contract ByteArray{
    bytes public arr = 'abcd';


    function pushArray() public{
        arr.push('2');
    }
    function popArray() public{
        arr.pop();
    }

    function arrayLength() public view returns(uint){
        return arr.length;
    }
}