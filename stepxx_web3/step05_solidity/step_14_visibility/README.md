
# Visibility Specifier

Visibility specifiers are used to indicate the visibility of functions and state variables. There are four types of visibility specifiers.
## Types:



- `public`:  A public function or state variable can be accessed from anywhere, both internally and externally. This means that it can be called from within the contract itself, as well as from other contracts and from external accounts.

- `private`:  A private function or state variable can only be accessed from within the contract where it is defined. This means that it can't be called from other contracts or from derieved contract or from external accounts.contracts and from external accounts.

- `internal` : A private function or state variable can only be accessed from within the contract where it is defined. This means that it can't be called from other contracts or from derieved contract or from external accounts.contracts and from external accounts.

- `external`: An internal function or state variable can only be accessed from within the contract where it is defined, as well as from contracts that inherit from that contract. This means that it can't be called from external accounts.

### Accessibility

| `public`      | `private`     | `internal`     | `external`     |
| ------------- | ------------- | ------------- | ------------- |
| Outside  | x  | x | Outside  |
| Within  | Within  | Within | x |
| Derived | x  | Derived | Derived |
| Other  | x | x | Other |


## Deployment

If you haven't already know how to deploy this project locally.
Use the following commands.

```bash
  npm i @remix-project/remixd
  remixd
```
Here is a [link](https://www.npmjs.com/package/@remix-project/remixd) of remixd package.

And then connect this to your remote [Remix](https://remix.ethereum.org/)

