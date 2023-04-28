# Debugging with Hardhat Network

Hardhat comes built-in with Hardhat Network, a local Ethereum network designed for development. It allows you to deploy your contracts, run your tests and debug your code, all within the confines of your local machine. It's the default network that Hardhat connects to, so you don't need to set up anything for it to work. Just run your tests.


## Solidity console.log

Update contract/Token.sol to import hardhat/console.sol in your contract code.

```
import "hardhat/console.sol";
```
Then you can just add some console.log calls to the transfer() function and update `transfer` function with following script after `require` statement. 

```
console.log(
        "Transferring from %s to %s %s tokens",
        msg.sender,
        to,
        amount
    );
```

The logging output will show when you run your tests using this `npx hardhat test` command.
Your output will somehow look like this, only addresses will be different.

```
$ npx hardhat test

  Token contract
    Deployment
      ✓ Should set the right owner
      ✓ Should assign the total supply of tokens to the owner
    Transactions
Transferring from 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266 to 0x70997970c51812dc3a010c7d01b50e0d17dc79c8 50 tokens
Transferring from 0x70997970c51812dc3a010c7d01b50e0d17dc79c8 to 0x3c44cdddb6a900fa2b585dd299e03d12fa4293bc 50 tokens
      ✓ Should transfer tokens between accounts (373ms)
      ✓ Should fail if sender doesn’t have enough tokens
Transferring from 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266 to 0x70997970c51812dc3a010c7d01b50e0d17dc79c8 50 tokens
Transferring from 0x70997970c51812dc3a010c7d01b50e0d17dc79c8 to 0x3c44cdddb6a900fa2b585dd299e03d12fa4293bc 50 tokens
      ✓ Should update balances after transfers (187ms)

```
