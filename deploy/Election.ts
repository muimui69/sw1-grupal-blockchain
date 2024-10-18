import { ethers } from "hardhat";

async function deployAndAttachElection() {
    const [deployer] = await ethers.getSigners();
    console.log(`Deploying Election contract with account: ${deployer.address}`);

    // Verificar saldo enviando una transacción de prueba
    const tx = await deployer.sendTransaction({
        to: deployer.address,
        value: ethers.parseEther("0.00000001"),
    });
    console.log(`Transaction hash: ${tx.hash}`);
    await tx.wait();
    console.log("Test transaction completed.");

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

    // // Conectar al contrato ya desplegado usando attach
    // const electionContract = Election.attach(contractAddress);
    // console.log(`Election contract attached at: ${electionContract.target}`);


}

deployAndAttachElection().catch((error) => {
    console.error("Error during deployment:", error);
    process.exit(1);
});
