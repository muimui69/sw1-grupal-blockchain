// import { ethers } from "hardhat";

// async function deployTenant() {
//     const [deployer] = await ethers.getSigners();
//     console.log(`Deploying Tenant contract with account: ${await deployer.getAddress()}`);

//     const Tenant = await ethers.getContractFactory("Tenant", deployer);

//     const tenant = await Tenant.deploy();

//     console.log("Deployment transaction sent, waiting for confirmation...");

//     await tenant.waitForDeployment();
//     console.log(`Tenant deployed at: ${await tenant.getAddress()}`);

//     console.log("Deployment transaction sent with 0.1 ether");

//     return tenant;
// }

// deployTenant().catch((error) => {
//     console.error("Error during deployment:", error);
//     process.exitCode = 1;
// });

// deploy/Tenant.ts
import { ethers } from "hardhat";

async function deployTenant() {
    const [deployer] = await ethers.getSigners();
    console.log(`Deploying Tenant contract with account: ${deployer.address}`);

    const Tenant = await ethers.getContractFactory("Tenant", deployer);

    const nonce = await deployer.getNonce(); // Obtén el nonce

    const tenant = await Tenant.deploy({
        gasLimit: 3000000, // Ajusta si es necesario
        gasPrice: ethers.parseUnits("10", "gwei"), // Asegúrate de ajustar si lo requieres
        nonce: nonce, // Asegúrate de que se pase el nonce correcto
    });

    console.log("Deployment transaction sent, waiting for confirmation...");

    await tenant.waitForDeployment(); // Espera la confirmación
    console.log(`Tenant deployed at: ${await tenant.getAddress()}`);

    return tenant;
}

deployTenant().catch((error) => {
    console.error("Error during deployment:", error);
    process.exit(1);
});
