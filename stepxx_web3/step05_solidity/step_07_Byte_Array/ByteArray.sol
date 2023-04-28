// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^ 0.8.18;


contract ByteArray{
    bytes3 public arr = 'abc'; //fixed length bytes array are immutable you can't add values through index 
    // it's exactly same as fixed array

    function getArray(uint index) public view returns(bytes1){
        return arr[index];
    }

    function length() view public returns(uint){
        return arr.length;
    }
}