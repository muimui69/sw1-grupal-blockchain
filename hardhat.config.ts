import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import "@nomicfoundation/hardhat-ethers";
import "@nomicfoundation/hardhat-chai-matchers";

import "@matterlabs/hardhat-zksync-solc";
import "@matterlabs/hardhat-zksync-deploy"
import * as dotenv from "dotenv";

dotenv.config();

const config: HardhatUserConfig = {
  solidity: "0.8.27",
  //comentar desde aqui para probar los contratos en la red de prueba,osea localhost
  networks: {
    zkSyncTestnet: {
      url: process.env.ALCHEMY_URL || "",
      accounts: process.env.PRIVATE_KEY ? [`0x${process.env.PRIVATE_KEY}`] : [],
    },
  },
  zksolc: {
    version: "1.3.5",
    compilerSource: "binary",
  },
};

export default config;
