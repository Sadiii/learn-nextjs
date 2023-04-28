# Testing Contact

Writing test is a crucial part of smart contract development and is essential for ensuring that the contract functions correctly and securely. Following are some main reasons to write smart contract.

- **Ensuring functionality**: Smart contract tests help to ensure that the contract functions as expected. 
- **Catching bugs and vulnerabilities:**: Testing helps to catch bugs and vulnerabilities before they can be exploited.
- **Preventing losses**: Smart contracts often hold valuable assets, such as cryptocurrency or digital assets, and a single vulnerability can result in significant financial losses. Tests can help ensure that the contract is secure and that users' funds are protected. 
- **Facilitating upgrades:**: When developers make changes to a smart contract, it's important to ensure that the changes do not break the existing functionality.
- **Building trust:** Smart contract tests can help to build trust in the contract and the development team. By demonstrating that the contract has been thoroughly tested and is secure.
## Writing Tests

This step is an addition to step 4.

- Create a new directory called `test` and create a file inside the directory called `Token.js`
```
mkdir test
touch test/Token.js

```
 - Update Token.js with the following code to define the contract. 

 ```
const { expect } = require("chai");

describe("Token contract", function () {
  it("Deployment should assign the total supply of tokens to the owner", async function () {
    const [owner] = await ethers.getSigners();

    const Token = await ethers.getContractFactory("Token");

    const hardhatToken = await Token.deploy();

    const ownerBalance = await hardhatToken.balanceOf(owner.address);
    expect(await hardhatToken.totalSupply()).to.equal(ownerBalance);
  });
});
 ```
This is JavaScript code snippet for a unit test written using the Mocha testing framework and the Chai assertion library to test a token contract deployed on the Ethereum blockchain using the Hardhat development environment.

 ### Let's understand these Lines of codes

 ```
 const { expect } = require("chai");

 ```
This line imports the `expect` function from the Chai assertion library.

```
describe("Token contract", function () {

```
This line defines a test suite using the `describe` function from Mocha. The test suite is named `"Token contract"`.  It takes two arguments: `a string` that describes the group of tests, and a `callback` function that contains the tests. In our case, we are using it to group tests related to the `Token contract`. The callback function is where we will define our individual tests using the it function.

```
it("Deployment should assign the total supply of tokens to the owner", async function () {

```
This line defines a test case using the `it` function from Mocha. The test case is named `"Deployment should assign the total supply of tokens to the owner"`. The `async` keyword specifies that this test case is an asynchronous function.

it checks whether the total supply of tokens is assigned to the contract owner upon deployment and `expect` from Chai to assert that the total supply of tokens equals the balance of the contract owner.

```
const [owner] = await ethers.getSigners();
```

This line retrieves the owner's address using the getSigners function from the ethers library.
A `Signer` in `ethers.js` is an object that represents an Ethereum account. It's used to send transactions to contracts and other accounts.We are using the ethers.js library to get an array of all available `signers` (or accounts) on the Hardhat Network. Since we only need the first account (which is the default owner account on the Hardhat Network), we use `array destructuring` to assign it to the owner variable.

```
const Token = await ethers.getContractFactory("Token");
```
A `ContractFactory` in ethers.js is an abstraction used to deploy new smart contracts, so `Token` here is a factory for `instances` of our token contract.

```
const hardhatToken = await Token.deploy();
```
This line deploys a new instance of the token contract using the `deploy` function from the token contract factory.

```
const ownerBalance = await hardhatToken.balanceOf(owner.address);
```
The above line retrieves the owner's token balance using the `balanceOf` function from the deployed token contract instance.

```
 expect(await hardhatToken.totalSupply()).to.equal(ownerBalance);

```
This line of code is an assertion that verifies whether the total supply of tokens assigned to the owner upon deployment is equal to the owner's balance. If the two values match, the test will pass, otherwise it will fail. The `expect` function from the Chai library is used to make this assertion. It checks if the result of `hardhatToken.totalSupply()` is equal to the ownerBalance variable using the `to.equal` assertion method.


To run the test execute this `run npx hardhat test` command in your terminal. You should see the following output

```
$ npx hardhat test

  Token contract
    ✓ Deployment should assign the total supply of tokens to the owner (654ms)


  1 passing (700ms)
```

## Writing Multiple Tests

### Using Different account to transfer tokens

If you need to test your code by sending a transaction from an account (or `Signer` in ethers.js terminology) other than the default one, you can use the `connect()` method on your ethers.js Contract object to connect it to a different account, like this:

```
describe("Token contract", function () {

  // ...previous test...

  it("Should transfer tokens between accounts", async function() {
    const [owner, addr1, addr2] = await ethers.getSigners();

    const Token = await ethers.getContractFactory("Token");

    const hardhatToken = await Token.deploy();
    await hardhatToken.transfer(addr1.address, 50);
    expect(await hardhatToken.balanceOf(addr1.address)).to.equal(50);

    await hardhatToken.connect(addr1).transfer(addr2.address, 50);
    expect(await hardhatToken.balanceOf(addr2.address)).to.equal(50);
  });
});

```

This new test will be placed right after the previous test. You can guess the location by looking at the above script. 

Let's assess the code, step by step. Some of the code is previously explained, so we will only elaborate on the code that has not been covered yet. Alternatively, you may refer to the test/Token.js file for more information.

```
await hardhatToken.transfer(addr1.address, 50);

```
This line of code transfers 50 tokens from the deployer account (owner) to the account represented by `addr1.address`. It uses the `transfer` function of the token contract deployed earlier. 

```
await hardhatToken.connect(addr1).transfer(addr2.address, 50);

```
Transfers 50 tokens from the balance of `addr1` to the balance of `addr2` using the `transfer` function of the hardhatToken instance. The `.connect(addr1)` syntax specifies that this function is being called from the context of `addr1`.

```
expect(await hardhatToken.balanceOf(addr2.address)).to.equal(50);

```

This assertion expects that the balance of `addr2` after the transfer from `addr1` should be `50`. It checks whether the `balanceOf` function from the Token contract returns a value of `50` for the address of `addr2`.


### Reusing common test setups with fixtures

If we'll be writing multiple test, There'll be duplicate code. The following line of codes will be called again and again in each test. 

```
const [owner] = await ethers.getSigners();
const Token = await ethers.getContractFactory("Token");
```
Here `fixtures` comes to rescue us. 

Update `Token.js` with the following code to define the specified test.

```
const { expect } = require('chai');
const { loadFixture } = require('@nomicfoundation/hardhat-network-helpers');
describe('Token contract', function () {
  async function deployTokenFixture() {
    const Token = await ethers.getContractFactory('Token');
    const [owner, addr1, addr2] = await ethers.getSigners();
    const hardhatToken = await Token.deploy();
    await hardhatToken.deployed();
    return { Token, hardhatToken, owner, addr1, addr2 };
  }
  it('Should assign the total supply of tokens to the owner', async function () {
    const { hardhatToken, owner } = await loadFixture(deployTokenFixture);
    const ownerBalance = await hardhatToken.balanceOf(owner.address);
    expect(await hardhatToken.totalSupply()).to.equal(ownerBalance);
  });
  it('Should transfer tokens between accounts', async function () {
    const { hardhatToken, owner, addr1, addr2 } = await loadFixture(
      deployTokenFixture
    );
    await expect(
      hardhatToken.transfer(addr1.address, 50)
    ).to.changeTokenBalances(hardhatToken, [owner, addr1], [-50, 50]);
    await expect(
      hardhatToken.connect(addr1).transfer(addr2.address, 50)
    ).to.changeTokenBalances(hardhatToken, [addr1, addr2], [-50, 50]);
  });
});
```
- We define a `fixture` to reuse the same setup in every test. 
- We use `loadFixture` to run this setup once snapshot that state, and reset Hardhat Network to that snapshot in every test.

Run this `npx hardhat test` command to execute the test. And the output will looklike this.

```
 npx hardhat test

  Token contract
    Deployment
      ✓ Should set the right owner
      ✓ Should assign the total supply of tokens to the owner
    Transactions
      ✓ Should transfer tokens between accounts (199ms)
      ✓ Should fail if sender doesn’t have enough tokens
      ✓ Should update balances after transfers (111ms)


  5 passing (1s)
  ```

