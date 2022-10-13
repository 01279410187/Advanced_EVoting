// SPDX-License-Identifier: MTI
pragma solidity ^0.8.17;
pragma experimental ABIEncoderV2;




contract  Voting{
   string public name;
   string public describetion;
   uint256 public numberOfCandidate=0;
     uint public electionId=0;
   

   struct Candidate{
    uint256 id;
    string name;
    uint256 voteCount;
   }
    
  

   mapping(uint=> Candidate) public candidates;
   mapping(uint => address) public Elecitions;
   mapping(address=>bool) public voters;

    function createElecition(string [] memory _nda,string [] memory _candidats) public{
          require(_candidats.length > 0, "There should be atleast 1 candidate.");
          name = _nda[0];
         describetion = _nda[1];
       for(uint i = 0; i < _candidats.length; i++) {
      addCandidate(_candidats[i]);
    }
        Elecitions[electionId]=address(this);
        electionId++;

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


   function getNumberOfCandidate()public view returns(uint num){
    num=numberOfCandidate;
    return num;
   }
   function getAllVoters()public view returns(bool ISVoted){
   // require(!voters[msg.sender],"Voter is aleardy voted");
    return voters[msg.sender];
   }

}



