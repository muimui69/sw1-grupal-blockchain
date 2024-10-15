// import { expect } from "chai";
// import { ethers } from "hardhat";

// describe("Election contract", function () {
//     it("Should deploy the election contract", async function () {
//         const Election = await ethers.getContractFactory("Election");
//         const election = await Election.deploy();
//         await election.deployed();
//         expect(election.address).to.proper;
//     });

//     it("Should add a candidate", async function () {
//         const Election = await ethers.getContractFactory("Election");
//         const election = await Election.deploy();
//         await election.deployed();

//         await election.addCandidate("John Doe", "A candidate", "imageHash", "email@example.com");
//         const candidate = await election.candidates(0);
//         expect(candidate.candidate_name).to.equal("John Doe");
//     });
// });
