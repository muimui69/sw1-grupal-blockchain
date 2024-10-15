import { ethers } from "hardhat";

async function main() {
    const Election = await ethers.getContractFactory("Election");
    const election = await Election.deploy();
    await election.waitForDeployment();
    const address = await election.getAddress();
    console.log("Election contract deployed to:", address);
}

main().catch((error) => {
    console.error("Error during deployment:", error);
    process.exitCode = 1;
});
