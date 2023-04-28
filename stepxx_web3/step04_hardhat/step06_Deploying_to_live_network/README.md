

# Contract Deployment

Deployment of a contract refers to the process of creating a new `instance` of a smart contract on the `blockchain`. This involves sending a transaction to the network that contains the `bytecode` of the contract, along with any necessary constructor arguments.

In `Hardhat`, you can deploy a contract using the deployment script. This is a `JavaScript` file that defines a function for each contract you want to deploy. The function uses the `ethers.js` library to create a new `instance` of the contract, then sends a transaction to the network to deploy it.
## Deploying to local network

create a new directory `scripts` inside the project root's directory, and create a file inside scripts directory with name `deploy.js`.

```
mkdir scripts
touch scripts/deploy.js
```

```
async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  console.log("Account balance:", (await deployer.getBalance()).toString());

  const Token = await ethers.getContractFactory("Token");
  const token = await Token.deploy();

  console.log("Token address:", token.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

  ```

we are using `ethers` library, which is used to interact with the `Ethereum network`. We then define an `async` function called `main` that does the following:

- Inside the `main` function, it calls `ethers.getSigners()` to get a list of signers, and assigns the first signer to the variable `deployer`. A signer is an account that can sign and send transactions to the network.
- It logs the `address` of the `deployer` account and its current balance to the console.
- Retrieves the contract factory for `Token` using the `getContractFactory` method of the `ethers` object.
- Deploys a new instance of `Token` using the `deploy` method of the `factory`.
- Logs the address of the newly-deployed contract to the console.

To run this script, you can use the `npx hardhat run` command followed by the path to the script:


```
$ npx hardhat run scripts/deploy.js

Compiled 2 Solidity files successfully
Deploying contracts with the account: 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
Account balance: 10000000000000000000000
Token address: 0x5FbDB2315678afecb367f032d93F642f64180aa3
```

## Deploying to remote networks

To deploy to a remote network such as mainnet or any testnet, you need to add a `network` entry to your `hardhat.config.js` file. We’ll use Sepolia for this example, but you can add any network similarly:

`Alchemy` is a blockchain infrastructure provider that offers a suite of tools and services for developers to build and deploy decentralized applications `(dApps)` on various blockchain networks, including Ethereum. Alchemy provides a range of features that can be helpful for deploying smart contracts.

- **Node infrastructure:** Alchemy offers a high-performance Ethereum node infrastructure that allows developers to quickly sync with the Ethereum network and access the latest 
- **API access:** Alchemy provides a range of API endpoints that can be used to interact with the Ethereum network. This includes JSON-RPC, WebSocket, and REST API endpoints.
- **Developer tools:** Alchemy provides a range of developer tools that can help simplify the process of deploying and managing smart contracts. Such as Ethereum transaction debugger.
- **Analytics and monitoring:** Alchemy provides a range of analytics and monitoring tools that can help developers track the performance and usage of their smart contracts.

While there are other options available, such as `Infura`, in this demonstration we chose to use `Alchemy` to deploy the smart contract to the Ethereum network.

1. SignUp on [Alchemy](https://www.alchemy.com/)

2. To begin deploying your smart contracts to the Sepolia testnet using Alchemy, you'll need to create a new project in your Alchemy dashboard specifically for this testnet. This will allow you to obtain the necessary credentials and configure your Alchemy environment to connect to the Sepolia network.

3. Grab your API key from the newly created project

4. Create an account on [metamask](https://metamask.io/)
5. You need some Sepolia faucets to deply the contract, Get from [Here](https://sepoliafaucet.com/)

6. Update hardhat.config.js to add a network entry. Updated file should look like this after adding api key and private key of your wallet

Update the code with following Script. 

```
require("@nomicfoundation/hardhat-toolbox");
const ALCHEMY_API_KEY = "KEY";
const SEPOLIA_PRIVATE_KEY = "YOUR SEPOLIA PRIVATE KEY";

module.exports = {
  solidity: "0.8.9",
  networks: {
    sepolia: {
      url: `https://eth-sepolia.g.alchemy.com/v2/${ALCHEMY_API_KEY}`,
      accounts: [SEPOLIA_PRIVATE_KEY]
    }
  }
};
```
Two keys are required. We'll get `ALCHEMY_API_KEY` from `Alchemy` dashboard and `SEPOLIA_PRIVATE_KEY` from `metamask`.

Here is some visualization representation. 


To deploy the smart contract to a live network, you can use the following command:

```
npx hardhat run scripts/deploy.js --network sepolia
```

You will be given a token address after successfully executing the command mentioned earlier and utilising Alchemy to deploy your smart contract to the Sepolia testnet. With the help of this address, you can look for your token on [Etherscan](https://sepolia.etherscan.io/), a well-liked blockchain explorer that lets you see information about transactions, account balances, and smart contract code on the Ethereum network.