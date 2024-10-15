import { ethers } from "hardhat";

async function main() {
    // Obtener el contrato "Election"
    const Election = await ethers.getContractFactory("Election");

    // Desplegar el contrato
    const election = await Election.deploy();

    // Esperar a que el contrato esté desplegado
    await election.waitForDeployment();

    // Obtener la dirección del contrato desplegado
    const address = await election.getAddress();

    // Verificar la dirección del contrato desplegado
    console.log("Election contract deployed to:", address);
}

main().catch((error) => {
    console.error("Error during deployment:", error);
    process.exitCode = 1;
});
