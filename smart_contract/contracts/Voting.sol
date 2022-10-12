// SPDX-License-Identifier: MTI
pragma solidity ^0.8.17;
pragma experimental ABIEncoderV2;




contract Voting{
   

   string public name;
   string public describetion;
   uint256 public numberOfCandidate=0;

   struct Candidate{
    uint256 id;
    string name;
    uint256 voteCount;
   }
    
  

   mapping(uint=> Candidate) public candidates;

   mapping(address=>bool) public voters;
    constructor(string []memory _nda,string [] memory _candidates) public{ 

    require(_candidates.length>0,"There most find at least ");
    name=_nda[0];
    describetion=_nda[1];

    for(uint i=0;i<_candidates.length;i++){
         addCandidate(_candidates[i]);
    }

   }

 

   function addCandidate(string memory _name) private{
     candidates[numberOfCandidate]=Candidate(numberOfCandidate,_name,0);
     numberOfCandidate++;
   }

   
   function vote(uint _candidate)public {

    require(!voters[msg.sender],"Voter is aleardy voted");

    require(_candidate < numberOfCandidate && numberOfCandidate>0,"no Candidate to vote");

    voters[msg.sender]=true;

    candidates[_candidate].voteCount++;

   }


}


