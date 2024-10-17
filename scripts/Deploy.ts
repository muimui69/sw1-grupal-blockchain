import { ethers } from "hardhat";

async function main() {
    const [admin] = await ethers.getSigners();
    const adminAddress = await admin.getAddress();

    const Election = await ethers.getContractFactory("Election");
    const election = await Election.deploy(
        adminAddress,
        "Elección General",
        "Elección para el cargo de alcalde"
    );

    await election.waitForDeployment();
    console.log("Election deployed to:", await election.getAddress());
    console.log("Admin Address:", adminAddress);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
