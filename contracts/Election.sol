// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

// Uncomment this line to use console.log
import "hardhat/console.sol";

contract Election {
    struct Candidate {
        string candidate_name;
        string candidate_description;
        string imgHash;
        uint8 voteCount;
        string email;
    }

    mapping(uint256 => Candidate) public candidates;
    uint256 public candidatesCount;

    constructor() {
        candidatesCount = 0;
        console.log(
            "Election contract deployed. Initial candidates count:",
            candidatesCount
        );
    }

    // Función para agregar un candidato
    function addCandidate(
        string memory _name,
        string memory _description,
        string memory _imgHash,
        string memory _email
    ) public {
        candidates[candidatesCount] = Candidate(
            _name,
            _description,
            _imgHash,
            0,
            _email
        );
        candidatesCount++;
    }

    // Función para votar por un candidato
    function vote(uint256 _candidateId) public {
        require(_candidateId < candidatesCount, "Invalid candidate ID");
        candidates[_candidateId].voteCount++;
    }

    // Función para obtener el número de candidatos
    function getNumOfCandidates() public view returns (uint256) {
        return candidatesCount;
    }

    // Función para obtener el array de todos los candidatos
    function getAllCandidates() public view returns (Candidate[] memory) {
        Candidate[] memory allCandidates = new Candidate[](candidatesCount);
        for (uint256 i = 0; i < candidatesCount; i++) {
            allCandidates[i] = candidates[i];
        }
        return allCandidates;
    }

    // Función para obtener la información de un candidato específico
    function getCandidate(
        uint256 _candidateId
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
        require(_candidateId < candidatesCount, "Candidate does not exist");
        Candidate memory candidate = candidates[_candidateId];
        return (
            candidate.candidate_name,
            candidate.candidate_description,
            candidate.imgHash,
            candidate.voteCount,
            candidate.email
        );
    }
}
