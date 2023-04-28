
# Enum

Enumerations help in declaring
a custom user-defined data type in Solidity. enum consists of an enumeration list – a
predetermined set of named constants.
## Features:



- An enum declaration uses the enum keyword,
- Each constant value gets an integer value, with the first one having a value of 0, and the value of each successive item increasing by 1.
- An `enum` declaration does not have a semicolon as its terminator.
- A variable of enumeration can be declared and assigned
- It is not mandatory to define `enum` in a Solidity contract.
- `enum` should be defined if there is a constant list of items that do not change.

```
enum gender {male, female}
gender _gender = gender.male ;
```
## Deployment

If you haven't already know how to deploy this project locally.
Use the following commands.

```bash
  npm i @remix-project/remixd
  remixd
```
Here is a [link](https://www.npmjs.com/package/@remix-project/remixd) of remixd package.

And then connect this to your remote [Remix](https://remix.ethereum.org/)

