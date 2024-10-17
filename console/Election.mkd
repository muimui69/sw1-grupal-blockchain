/**
 * Este script muestra los comandos para usar con "pnpm run local-node junto" a  "pnpm run console" del contrato "Election".
 */

import { ethers } from "hardhat";
import { Candidate } from '../interfaces/Election';

async function main() {

    // Obtener el contrato "Election"
    const Election = await ethers.getContractFactory("Election");
    // Desplegar el contrato
    const election = await Election.deploy();
    // Esperar a que el contrato esté desplegado
    await election.waitForDeployment();

    // Obtener la dirección del contrato desplegado
    const address = await election.getAddress();

    //Agregar candidatos
    await election.addCandidate("Alice", "Blockchain Developer", "imgHash1", "alice@example.com");
    await election.addCandidate("Alice b", "Blockchain Developer", "imgHash2", "aliceB@example.com");

    // Obtener el número de candidatos y la lista de candidatos
    const candidateCount = await election.getFunction("getNumOfCandidates")();
    const candidates = await election.getFunction("getAllCandidates")();

    console.log("Election contract deployed to:", address);
    console.log("CandidateCount:", candidateCount.toString());
    console.log("Candidates", candidates.map((c: any) => c.toString()));

    async function showCandidates() {
        const candidatesAll = await election.getAllCandidates();
        console.log("Candidates:", candidatesAll.map((c: Candidate) => c.toString()));
    }

}



