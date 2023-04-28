
# Constructor

Constructor is a special function that is executed automatically when a new instance of a contract is created. It can be parameterized or without parameter. 
## Features

- The constructor function is executed only once during the deployment of the contract.
- Cannot be called again after the contract has been deployed.
- We can create only one contructor and that is optional.
- A default constructor is created by compiler if there is no explicitly defined constructor. 
- The constructor function does not have a return type, not even "void". 
- The constructor function simply initializes the state variables of the contract, and any necessary validation should be performed in the constructor function to ensure that the contract is initialized correctly.

## Deployment

If you haven't already know how to deploy this project locally.
Use the following commands.

```bash
  npm i @remix-project/remixd
  remixd
```
Here is a [link](https://www.npmjs.com/package/@remix-project/remixd) of remixd package.

And then connect this to your remote [Remix](https://remix.ethereum.org/)

