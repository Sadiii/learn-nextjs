
# Variable Types in Solidity

There are three main types of variables: state variables, local variables, and function parameters.


## Types

1. **State Variables:** 
    State variables are declared at the contract level and store the state of the contract. They are stored permanently on the blockchain and their values can be accessed by any function within the contract. State variables are declared using the "storage" keyword and are initialized with a default value when the contract is deployed. State variables are commonly used to represent the state of the contract, such as the balance of an account or the number of tokens held by an address.

2. **Local Variables:** 
    Local variables are declared within a function and only exist for the duration of the function execution. They are used to store temporary values and are not stored on the blockchain. Local variables are declared using the "memory" keyword.

3. **Function Parameters:** 
    Function parameters are variables that are passed into a function. They are used to provide input to the function and can be of any data type. Function parameters are also declared using the "memory" keyword.

## Variable Storage
storage, memory, and the stack are three different places where variables can be stored. Each has its own purpose and characteristics.

### **Storage**: 
 - Storage is a persistent, on-chain data storage area where variables declared .
 - It is where variables with state or contract-level scope are stored.
 - Storage variables are written to the blockchain
 - So they have a permanent existence .
 - It can be accessed by any function within the contract, as well as other contracts on the blockchain.
 - Storage is the most expensive of the three types of storage in terms of gas usage. This is because every write operation to storage requires a transaction to be sent to the blockchain, which can be costly in terms of gas fees.
### **Memory**: 
 - Memory is a temporary storage area that is used to hold variables.
 - Only needed during the execution of a function.
 - Memory is declared using the "memory" keyword and is not written to the blockchain.
 - Memory is cheaper to use than storage in terms of gas usage.
 - Memory is cleared after a function completes its execution. This means that variables stored in memory cannot be accessed outside of the function in which they were declared.

### **Stack**: 
 - The stack is a temporary storage area that is used to hold variables.
 - Also hold function call information during the execution of a function.
 - The stack is used to execute arithmetic and logic operations, and to keep track of function call frames.
 - The stack is automatically managed by the Ethereum Virtual Machine (EVM), and developers do not need to explicitly allocate or deallocate space on the stack.
 - Unlike memory and storage, the stack is not directly accessible to Solidity developers.

## Deployment

If you haven't already know how to deploy this project locally.
Use the following commands.

```bash
  npm i @remix-project/remixd
  remixd
```
Here is a [link](https://www.npmjs.com/package/@remix-project/remixd) of remixd package.

And then connect this to your remote [Remix](https://remix.ethereum.org/)

