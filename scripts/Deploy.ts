import { ethers } from "hardhat";

async function main() {
    const Election = await ethers.getContractFactory("Election");
    const election = await Election.deploy();

    await election.deployed();
    console.log("Election contract deployed to:", election.address);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
