
# State Variables

State variables are variables that are declared at the contract level and store the state of the contract. They are stored permanently on the blockchain and their values can be accessed by any function within the contract.

## Types

- Stored in blockchain & you have to pay gas for it.
- They are expensive.
- Storage is not dynamically allocated.
- No Null or undefined value concept here.
- 3 Ways to initialize state variables.

    *  While declaring
    *  In Constructure 
    *  Using Setter Function
- if we delcare a state variable as public specifier , it's getter function will be automatically created. 


## Deployment

If you haven't already know how to deploy this project locally.
Use the following commands.

```bash
  npm i @remix-project/remixd
  remixd
```
Here is a [link](https://www.npmjs.com/package/@remix-project/remixd) of remixd package.

And then connect this to your remote [Remix](https://remix.ethereum.org/)

