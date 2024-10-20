import { ethers } from "hardhat";

async function deployAndAttachElection() {
    const [deployer] = await ethers.getSigners();
    console.log(`Deploying Election contract with account: ${deployer.address}`);


    // Parámetros del constructor
    const adminAddress = deployer.address;
    const electionName = "Election 1";
    const electionDescription = "First Election";

    // Obtener la fábrica del contrato y desplegar
    const Election = await ethers.getContractFactory("Election");
    const election = await Election.deploy(adminAddress, electionName, electionDescription, {
        gasLimit: 3000000,
        gasPrice: ethers.parseUnits("10", "gwei"),
    });

    console.log("Waiting for deployment...");
    await election.waitForDeployment();

    const contractAddress = await election.getAddress();
    console.log(`Election contract deployed at: ${contractAddress}`);

}

deployAndAttachElection().catch((error) => {
    console.error("Error during deployment:", error);
    process.exit(1);
});
