// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

import "./interfaces/IElection.sol";
import "./Election.sol";

contract Tenant {
    struct TenantDetails {
        address deployedAddress;
        string electionName;
        string electionDescription;
    }

    mapping(string => TenantDetails) public elections;

    function createElection(
        string memory subdomain,
        string memory _electionName,
        string memory _electionDescription
    ) public {
        require(
            elections[subdomain].deployedAddress == address(0),
            "Election already exists for this subdomain"
        );

        address newElection = address(
            new Election(msg.sender, _electionName, _electionDescription)
        );

        elections[subdomain] = TenantDetails({
            deployedAddress: newElection,
            electionName: _electionName,
            electionDescription: _electionDescription
        });
    }

    function getElection(
        string memory subdomain
    ) public view returns (address, string memory, string memory) {
        TenantDetails memory election = elections[subdomain];
        require(
            election.deployedAddress != address(0),
            "No election found for this subdomain"
        );

        return (
            election.deployedAddress,
            election.electionName,
            election.electionDescription
        );
    }
}
