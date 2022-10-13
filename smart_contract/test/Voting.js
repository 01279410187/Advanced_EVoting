
const { ethers } = require("hardhat");
const { expect } = require("chai");

describe("Voting Contract", function () {
  let VotingContract
  let voting
  beforeEach(async function () {
    VotingContract = await ethers.getContractFactory("Voting");
    [addr1, addr2] = await ethers.getSigners();
    voting = await VotingContract.deploy();
    const candidate = [
      {
        "id": 0,
        "name": "Ahmed",
        "voteCount": 0
      },
      {
        "id": 1,
        "name": "Barakat",
        "voteCount": 0
      }
    ]
    const Candidate = ["USA Candidate", "USA Voting"]
    await expect(await voting.connect(addr1).createElecition([Candidate[0], Candidate[1]], [candidate[0], candidate[1]]))
  });


  it("create candidate", async () => {
    const candidate = [
      {
        "id": 0,
        "name": "Ahmed",
        "voteCount": 0
      },
      {
        "id": 1,
        "name": "Barakat",
        "voteCount": 0
      }
    ]
    const Candidate = ["USA Candidate", "USA Voting"]
    await expect(await voting.connect(addr1).createElecition([Candidate[0], Candidate[1]], [candidate[0], candidate[1]]))
  })
  it("Make A Vote", async ()=>{
      await expect(await voting.connect(addr1).vote(1))
      console.log( await voting.getNumberOfCandidate())
      
  })
  it("Already Voted", async ()=>{

   await expect(await voting.connect(addr1).vote(1))
   await expect(await voting.connect(addr1).vote(1))
   console.log( await voting.getAllVoters());
    
})




});