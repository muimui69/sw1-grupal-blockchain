import { ethers } from "hardhat";

async function deployTenant() {
    const [deployer] = await ethers.getSigners();
    console.log(`Deploying Tenant contract with account: ${await deployer.getAddress()}`);

    const Tenant = await ethers.getContractFactory("Tenant", deployer);

    const tenant = await Tenant.deploy();

    console.log("Deployment transaction sent, waiting for confirmation...");

    await tenant.waitForDeployment();
    console.log(`Tenant deployed at: ${await tenant.getAddress()}`);

    console.log("Deployment transaction sent with 0.1 ether");

    return tenant;
}

deployTenant().catch((error) => {
    console.error("Error during deployment:", error);
    process.exitCode = 1;
});

