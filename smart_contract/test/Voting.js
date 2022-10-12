
const {ethers} = require("hardhat");
const {expect} = require("chai");

describe("Task Contract", function() {
    let VotingContract
    let voting 
    
  

  beforeEach(async function() {

    VotingContract =await ethers.getContractFactory("Voting");
    [addr1,addr2]=await ethers.getSigners();
    voting= VotingContract.deploy();
   
  });

  describe("", function() {
   
  });

  
});