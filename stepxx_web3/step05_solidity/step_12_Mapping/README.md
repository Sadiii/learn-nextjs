
# Mapping

Mapping is a data structure that associates a key with a value, much like a dictionary or hash table in other programming languages. 

```bash
mapping (KeyType => ValueType) public myMapping;
```
Here, `KeyType` is the data type of the keys in the mapping, and `ValueType` is the data type of the values. The `public` keyword makes the mapping readable from outside the contract.
## Features:



- Mapping commonly used to bind address with account balance.
- We can also use mappings to store and retrieve data in your contracts
- Mappings are not iterable unlike array
- Mappings are stored on the blockchain
- Mappings can be public
- Mappings can be nested. This can be useful for storing complex data, such as a map of addresses to arrays of integers.
- Key can't be of types mapping, dynamic array, enum and struct
- The values can be of any type.
## Deployment

If you haven't already know how to deploy this project locally.
Use the following commands.

```bash
  npm i @remix-project/remixd
  remixd
```
Here is a [link](https://www.npmjs.com/package/@remix-project/remixd) of remixd package.

And then connect this to your remote [Remix](https://remix.ethereum.org/)

