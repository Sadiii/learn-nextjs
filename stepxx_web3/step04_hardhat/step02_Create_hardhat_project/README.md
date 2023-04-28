
# Creating a new Hardhat project

The Node.js package manager (npm), which serves as both a package manager and an online repository for JavaScript code, will be used to install Hardhat.


1. Open a new terminal and run these commands to create a new directory and move into that directory:

```
mkdir step03_Create_hardhat_project
cd step03_Create_hardhat_project
```
2. Initialize an npm project

```
npm init -y
```
it'll create `package.json` file with the following script.
```
{
  "name": "step03_Create_hardhat_project",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC"

```


3. Install Hardhat in the same directory.

```
npm install --save-dev hardhat

```
It'll create `package_loc.json` file and also install hardhat as a developer dependency and add following script in `package.json`.

```
"devDependencies": {
    "hardhat": "^2.14.0"
  }
  ```

3. Run Hardhat

```
npx hardhat
```
<image src ='image.png' width = '400'/>


Select `Create an empty hardhat.config.js` with your keyboard and hit enter. 
After that a new `hardhat.config.js` file will be created with the following information. It's showing compiler version.

```
/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.18",
};
```
4. Install Plugin which has everything you need for developing smart contracts.
Run following command in terminal.

```
npm install --save-dev @nomicfoundation/hardhat-toolbox

```
Now we need to add `require("@nomicfoundation/hardhat-toolbox");` this in `hardhat.config.js` file. 
After adding, the file will look like this. 

```
/** @type import('hardhat/config').HardhatUserConfig */
require("@nomicfoundation/hardhat-toolbox");
module.exports = {
  solidity: "0.8.18",
};

```