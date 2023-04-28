// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^ 0.8.18;

// create a fixed length arry and add value in it using loops. 

contract ControlStructure{

    uint[4] public arr ;
    uint public count ;

    function addElementsUsingFor() public {
        for (uint i=0 ; i<arr.length; i++){
            arr[i] = i;
        }
    }
    function addElementsUsingWhile() public {
        while (count<arr.length){
            arr[count] = count;
            count = count+1;
        }
    }
    function addElementsUsingDoWhile() public {
        do{
            arr[count] = count;
            count = count+1;

        }while(count<arr.length);
    }

    function length()public view returns(uint){
        return arr.length;
    }
}