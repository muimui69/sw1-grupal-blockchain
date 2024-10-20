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
  networks: {
    zkSyncTestnet: {
      url: process.env.ALCHEMY_URL || "",
      accounts: [process.env.PRIVATE_KEY || ""],
      zksync: true,
    },
  },
  zksolc: {
    version: "1.5.6",
    settings: {},
  },
};

export default config;
