// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

// Uncomment this line to use console.log
import "hardhat/console.sol";
import "./interfaces/IElection.sol";

contract Election is IElection {
    struct Candidate {
        string candidate_name;
        string candidate_description;
        string imgHash;
        uint8 voteCount;
        string email;
    }

    event VoteConfirmed(
        address voter,
        uint256 candidateId,
        string confirmationMessage
    );

    event VoteRecorded(uint256 candidateId, uint8 newVoteCount);

    mapping(uint256 => Candidate) public candidates;
    mapping(uint256 => uint8) public voteCheckpoints;
    uint256 public candidatesCount;
    address public admin;
    string public override electionName;
    string public override electionDescription;
    bool public electionEnded;

    // Modificadores
    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }

    modifier electionActive() {
        require(!electionEnded, "Election has ended");
        _;
    }

    constructor(
        address _admin,
        string memory _electionName,
        string memory _electionDescription
    ) {
        admin = _admin;
        electionName = _electionName;
        electionDescription = _electionDescription;
        candidatesCount = 0;
        electionEnded = false;
    }

    function addCandidate(
        string memory _name,
        string memory _description,
        string memory _imgHash,
        string memory _email
    ) public onlyAdmin electionActive {
        candidates[candidatesCount] = Candidate({
            candidate_name: _name,
            candidate_description: _description,
            imgHash: _imgHash,
            voteCount: 0,
            email: _email
        });
        candidatesCount++;
    }

    function vote(uint256 _candidateId) public override electionActive {
        require(_candidateId < candidatesCount, "Invalid candidate ID");
        candidates[_candidateId].voteCount++;

        saveCheckpoint(_candidateId);

        emit VoteConfirmed(
            msg.sender,
            _candidateId,
            "Your vote has been registered successfully."
        );

        emit VoteRecorded(_candidateId, candidates[_candidateId].voteCount);
    }

    function endElection() public override onlyAdmin {
        electionEnded = true;
    }

    function getWinner()
        public
        view
        override
        returns (
            string memory,
            string memory,
            string memory,
            uint8,
            string memory
        )
    {
        require(electionEnded, "Election is still active");

        uint8 highestVotes = 0;
        uint256 winnerId = 0;
        for (uint256 i = 0; i < candidatesCount; i++) {
            if (candidates[i].voteCount > highestVotes) {
                highestVotes = candidates[i].voteCount;
                winnerId = i;
            }
        }

        Candidate memory winner = candidates[winnerId];
        return (
            winner.candidate_name,
            winner.candidate_description,
            winner.imgHash,
            winner.voteCount,
            winner.email
        );
    }

    function getAllCandidates() public view returns (Candidate[] memory) {
        Candidate[] memory allCandidates = new Candidate[](candidatesCount);
        for (uint256 i = 0; i < candidatesCount; i++) {
            allCandidates[i] = candidates[i];
        }
        return allCandidates;
    }

    function getNumOfCandidates() public view override returns (uint256) {
        return candidatesCount;
    }

    // Checkpoints para validar integridad de votos
    function saveCheckpoint(uint256 _candidateId) public onlyAdmin {
        require(_candidateId < candidatesCount, "Invalid candidate ID");
        voteCheckpoints[_candidateId] = candidates[_candidateId].voteCount;
    }

    function verifyCheckpoint(uint256 _candidateId) public view returns (bool) {
        require(_candidateId < candidatesCount, "Invalid candidate ID");
        return
            candidates[_candidateId].voteCount == voteCheckpoints[_candidateId];
    }
}
