import { ethers } from "hardhat";

async function deployElection() {
    const [admin] = await ethers.getSigners();
    const adminAddress = await admin.getAddress();

    console.log(`Admin Address: ${adminAddress}`);

    const Election = await ethers.getContractFactory("Election");
    const election = await Election.deploy(adminAddress, "Election 1", "First Election");
    await election.waitForDeployment();

    console.log(`Election deployed at: ${await election.getAddress()}`);
    return election;
}

deployElection().catch((error) => {
    console.error(error);
    process.exit(1);
});