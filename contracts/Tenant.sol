// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

// Uncomment this line to use console.log
import "hardhat/console.sol";

import "./Election.sol"; // Importamos el contrato Election

contract Tenant {
    struct TenantDetails {
        address deployedAddress; // Dirección del contrato Election desplegado
        string electionName;
        string electionDescription;
    }

    // Mapeo de elecciones por subdominio (tenant)
    mapping(string => TenantDetails) public elections;

    // Crear una nueva elección para un subdominio
    function createElection(
        string memory subdomain,
        string memory _electionName,
        string memory _electionDescription
    ) public {
        require(
            elections[subdomain].deployedAddress == address(0),
            "Election already exists for this subdomain"
        );

        // Despliega un nuevo contrato Election para el subdominio
        address newElection = address(
            new Election(msg.sender, _electionName, _electionDescription)
        );

        // Asocia el contrato Election desplegado al subdominio
        elections[subdomain] = TenantDetails({
            deployedAddress: newElection,
            electionName: _electionName,
            electionDescription: _electionDescription
        });
    }

    // Votar por un candidato en una elección específica
    function vote(string memory subdomain, uint256 candidateId) public {
        TenantDetails memory election = elections[subdomain];
        require(
            election.deployedAddress != address(0),
            "No election found for this subdomain"
        );

        // Delegar la votación al contrato Election correspondiente
        Election(election.deployedAddress).vote(candidateId);
    }

    // Obtener el ganador de una elección específica
    function getWinner(
        string memory subdomain
    )
        public
        view
        returns (
            string memory,
            string memory,
            string memory,
            uint8,
            string memory
        )
    {
        TenantDetails memory election = elections[subdomain];
        require(
            election.deployedAddress != address(0),
            "No election found for this subdomain"
        );

        return Election(election.deployedAddress).getWinner();
    }

    // Obtener todos los candidatos de una elección específica
    function getAllCandidates(
        string memory subdomain
    ) public view returns (Election.Candidate[] memory) {
        TenantDetails memory election = elections[subdomain];
        require(
            election.deployedAddress != address(0),
            "No election found for this subdomain"
        );

        return Election(election.deployedAddress).getAllCandidates();
    }
}
