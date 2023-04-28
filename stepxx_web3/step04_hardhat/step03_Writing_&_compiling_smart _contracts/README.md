# Writing and compiling smart contracts

In this step, we are going to create a smart contract that implements a basic token that can be transferred. Token contracts are usually used to exchange or store value. While we won't dig too deeply into Solidity, we will gain a thorough grasp of the contract's code, there is some key logic that we are going to implement. These are:

- There is a fixed total supply of tokens that can't be changed.
- The entire supply is assigned to the address that deploys the contract.
- Anyone can receive tokens.
- Anyone with at least one token can transfer tokens.
- The token is non-divisible. You can transfer 1, 2, 3 or 37 tokens but not 2.5.
## Writing smart contract

This step is an addition to step 3.

- Create a new directory called `contracts` and create a file inside the directory called `Token.sol`
```
mkdir contracts
touch contracts/Token.sol

```
 - Update Token.sol with the following code to define the contract. 

 ```
pragma solidity ^0.8.18;

contract Token {

    string public name = "My Hardhat Token";
    string public symbol = "MHT";

    uint256 public totalSupply = 1000000;
    address public owner;
    mapping(address => uint256) balances;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    constructor() {
        balances[msg.sender] = totalSupply;
        owner = msg.sender;
    }

    function transfer(address to, uint256 amount) external {
        require(balances[msg.sender] >= amount, "Not enough tokens");

        balances[msg.sender] -= amount;
        balances[to] += amount;

        emit Transfer(msg.sender, to, amount);
    }
    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }
}
 ```

 ### Let's understand these Lines of codes

 ```
 pragma solidity ^0.8.18;

 ```
Solidity files have to start with this pragma. it's used to define compiler version. `^` symbol is called caret. it's used to define minimum limit. The above pragma script is showing that the minimum compiler version should me 0.8.18 and any version above the version mentioned but less than the next major version.

```
contract Token {
}
```
This is the main building block for smart contracts. Here we are creating `smart contract` with the name `Token`.

```
string public name = "My Hardhat Token";
string public symbol = "MHT";

```

In the above line of code, We are decalring and initializing two variables with `name` and `symbol`. `name` will store the name of token which is `My Hardhat` in our case and `symbol` will store the symbol or ticker of the token. The datatype of both variable is string and they are public. 


```
uint256 public totalSupply = 1000000;
```

Declares a public variable `totalSupply` of type `uint256`, which represents the total number of tokens that will exist in this token contract. The initial value of totalSupply is set to `1000000`. Once the value of totalSupply is set, it cannot be changed.
```
address public owner;
```
`address` datatype is used to store the address of the Ethereum account. Here we have decalred a varible `owner` with address type. But it's not initialized yet. 

```
mapping(address => uint256) balances;
```
Now `mapping` is very interesting data type. It's a key value pair. Each pair will be linked with the unique key and we'll access the pair information through key. Here we are binding our account address with the balance of the account. 
So if we need to access the balance of the account, it'll be accessed through address key.

```
event Transfer(address indexed _from, address indexed _to, uint256 _value);
```
This is an event declaration. It defines the `Transfer` event, which will be emitted every time a transfer of tokens occurs in the contract.
The `indexed` keyword is used to allow filtering of the event based on the indexed parameter. In this case, `_from` and `_to` are indexed to enable filtering based on the sender and receiver of the tokens. The third parameter, `_value`, is the amount of tokens being transferred.

```
 constructor() {
        balances[msg.sender] = totalSupply;
        owner = msg.sender;
    }
```
A `constructor` function is a special function that gets executed automatically when the contract is deployed on the blockchain. It is used to initialize the state variables of the contract.

The first line is setting the `balance` of the contract's creator `(msg.sender)` to the `total supply` of tokens. Here, balances is a mapping `(a key-value store)` that keeps track of the balance of each address. 

In the second line we're initializing the `owner` variable with the address of the contract's creator. The address is stored in global variable `msg.sender`.

```
function transfer(address to, uint256 amount) external {
        require(balances[msg.sender] >= amount, "Not enough tokens");

        balances[msg.sender] -= amount;
        balances[to] += amount;

        emit Transfer(msg.sender, to, amount);
    }
```
This function allows `transferring` tokens from the `sender's address` to another address.

we defined function with name `transfer` that takes two arguments: `to`, which is the address of the recipient of the tokens, and `amount`, which is the number of tokens to be transferred. The external keyword specifies that this function can only be called from outside the contract.

`require` line checks if the sender's balance is greater than or equal to the amount of tokens being transferred. If the condition is not met, it will `revert` the transaction and display the message `"Not enough tokens"`.

This line `balances[msg.sender] -= amount;` subtracts the transferred amount from the sender's balance.

This line `balances[to] += amount;` adds the transferred amount to the recipient's balance.

Next line `emits` an event named `Transfer`, indicating that tokens have been transferred from `msg.sender` to `to`, and the `amount` of tokens that were transferred.

```
function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }
```
The `balanceOf` function retrieves the balance of tokens of a specific address.
it takes one argument: `account`, which is the address of the account `to` retrieve the balance of. The `external` keyword specifies that this function can only be called from outside the contract. The `view` keyword specifies that this function does not modify the state of the contract.

The `return` line returns the balance of tokens for the specified `account` from the `balances mapping`, and returns it as a `uint256` value.

## Compiling contract

To compile the contract run n`px hardhat compile` in your terminal. The compile task is one of the built-in tasks.

```
$ npx hardhat compile
Compiling 1 file with 0.8.18
Compilation finished successfully
```
The contract has been successfully compiled and it's ready to be used. Now it's time to create tests. 