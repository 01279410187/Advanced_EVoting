// SPDX-License-Identifier: MTI
pragma solidity ^0.8.17;
pragma experimental ABIEncoderV2;

import "./Voting.sol";

contract Main{

    uint public electionId=0;
    mapping(uint => address) public Elecitions;

    function createElecition(string [] memory _nda,string [] memory _candidats) public{
        Voting elecition= new Voting(_nda,_candidats);
        Elecitions[electionId]=address(elecition);
        electionId++;

    }
}