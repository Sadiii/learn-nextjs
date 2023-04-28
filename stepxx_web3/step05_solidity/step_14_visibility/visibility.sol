// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^ 0.8.18;

contract VisibilitySpecifier{

    // public funtions will be accessible in
    // 1 outside the contract
    // 2 within contract
    // 3 derived contract
    // 4 other contract
    function f1() public pure returns(string memory){
        return 'public';
    }
    // private funtions will only be accessible
    // 1 within contract
    // not outside contract
    // not in derived contract
    // not in other contract
    function f2() private pure returns(string memory){
        return 'private';
    }

    // Internal funtions will be accessible in 
    // 1 within contract
    // 2 in derived contract
    // 3 not in other contract 
    // 4 not outside contract 
    function f3() internal pure returns(string memory){
        // f4(); it'll generate an error because we can't access external function within the contract.
        return 'internal';
    }

    // External funtions will be accessible in 
    // 1 outside contract
    // 2 in derived contract
    // 3 in other contract 
    // 4 not within contract 
    function f4() external pure returns(string memory){
        return 'external';
    }

}

// now remix environment is outside world only public and external function will be visible at deployment. 


//let's create a new contract which will inherit main contract

contract B is VisibilitySpecifier{
    //only private function can't be accessed in derived contract

    //string x = f2(); // error because f2() is a private function
    string public x = f3();
}

contract C{
    // only public and external functions are accessible in other contracts

    // create an object of the first contract, it's an inheritance concept
    VisibilitySpecifier obj = new VisibilitySpecifier();
    string public pub = obj.f1();

    // this will generate an error because it's a private function.
    //string public pri = obj.f2(); 

    // this will generate an error because it's an Internal function.
    //string public inter = obj.f3(); 
}