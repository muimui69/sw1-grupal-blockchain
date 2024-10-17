import { ethers } from "hardhat";

async function deployTenant() {
    const Tenant = await ethers.getContractFactory("Tenant");
    const tenant = await Tenant.deploy();
    await tenant.waitForDeployment();

    console.log(`Tenant deployed at: ${await tenant.getAddress()}`);
    return tenant;
}

deployTenant().catch((error) => {
    console.error(error);
    process.exit(1);
});