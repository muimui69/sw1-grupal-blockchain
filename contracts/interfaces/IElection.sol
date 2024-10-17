// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

interface IElection {
    function electionName() external view returns (string memory);
    function electionDescription() external view returns (string memory);
    function getNumOfCandidates() external view returns (uint256);
    function vote(uint256 _candidateId) external;
    function endElection() external;
    function getWinner()
        external
        view
        returns (
            string memory,
            string memory,
            string memory,
            uint8,
            string memory
        );
}
