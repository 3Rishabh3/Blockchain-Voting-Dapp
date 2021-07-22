// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Election {
    constructor() public {
        addCandidate("Narendra Modi");
        addCandidate("Rahul Gandhi");
    }

    struct Candidate {
        uint256 id;
        string candidateName;
        uint256 voteCount;
    }

    uint256 public candidateCount = 0;
    mapping(uint256 => Candidate) public candidates;
    mapping(address => bool) public voters;

    function addCandidate(string memory _name) private {
        candidateCount++;
        candidates[candidateCount] = Candidate(candidateCount, _name, 0);
    }

    function vote(uint256 _candidateId) public {
        require(!voters[msg.sender], "You have already voted");
        require(_candidateId > 0 && _candidateId <= candidateCount);

        candidates[_candidateId].voteCount++;
        voters[msg.sender] = true;
    }
}
