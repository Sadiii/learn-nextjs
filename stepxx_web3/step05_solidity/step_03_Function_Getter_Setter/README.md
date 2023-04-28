
# Functions (getter & setter)

Getter function and a Setter function are two different types of functions that are used to get and set the value of a state variable, respectively.

## Getter Function

- A getter function is a function that allows other contracts or external accounts to read the value of a state variable
- Getter functions are declared with the "view" or "pure" keyword and do not modify the state of the contract.
- Getter functions are used to retrieve information about the state of the contract without modifying it.
- Allow external contracts or accounts to read information about the contract
- Very small amount of gas is required to execute a getter function.

## Setter Function

- A setter function is a function that allows other contracts or external accounts to set the value of a state variable.
- Setter functions are declared with the "public" or "external" keyword and modify the state of the contract.
- Setter functions are used to modify the state of the contract. 
- Allow external contracts or accounts to interact with the contract and modify its state.
- when we call a setter function, it create a transaction that need to be mined and cost gas because it changes the blockchain. 
- Amount of gas required is much more than getter function.


## View Vs pure
Both View and Pure keywords are used to indicate that it's a getter function. And it's not going to modify the state variable. 

- **View**  indicates that function is reading the sate of variable. This means that the function only reads the contract's data and returns a value without changing anything.
- **Pure** indicates that function is neither reading nor modifying the state variable. This means that the function does not access any contract data and only returns a value based on its inputs.

## Deployment

If you haven't already know how to deploy this project locally.
Use the following commands.

```bash
  npm i @remix-project/remixd
  remixd
```
Here is a [link](https://www.npmjs.com/package/@remix-project/remixd) of remixd package.

And then connect this to your remote [Remix](https://remix.ethereum.org/)

