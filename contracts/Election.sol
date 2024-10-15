// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

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
    }

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

    function vote(uint256 _candidateId) public {
        require(_candidateId < candidatesCount, "Invalid candidate ID");
        candidates[_candidateId].voteCount++;
    }
}
