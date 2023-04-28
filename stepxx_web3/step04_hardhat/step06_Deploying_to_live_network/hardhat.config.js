/** @type import('hardhat/config').HardhatUserConfig */
require("@nomicfoundation/hardhat-toolbox");

const ALCHEMY_API_KEY = "ejIsnO5Yw3pEx3DDOqmCf7KpUNdDBJSr";
const SEPOLIA_PRIVATE_KEY = "3f8a3a2469ca5e17db87f630abec93c8c87536b9d6640ec4b346336ed3b55c34";


module.exports = {
  solidity: "0.8.18",
  networks: {
    sepolia: {
      url: `https://eth-sepolia.g.alchemy.com/v2/${ALCHEMY_API_KEY}`,
      accounts: [SEPOLIA_PRIVATE_KEY]
    }
  }
};
