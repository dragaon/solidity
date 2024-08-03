// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
    Voting Smart Contract supports adding new candidate, new voter, start election, end election, show results,
    view candidate information, view voter information, caste vote, delegate vote, view 
**/
contract Voting{

    struct Candidate{
        int id;
        string name;
        string proposal;
        int votesSecured;
    }

    struct Voter{
        address voter;
        string name;
        address delegate;
        bool isVoted;
        bool isDelegated;
        int votedCandidateID;
    }

    enum ElectionStatus{
        NOT_STARTED,
        ONGOING,
        STOPPED,
        COMPLETED,
        CANCELLED
    }

    //Admin of the contract
    address private admin;

    //Current Election status
    ElectionStatus public electionStatus;

    //List of candidates. Candidate ID is the key and Candidate is the value
    mapping (int => Candidate) private candidates;


    //Voters information. Voiter ID is the key and Voter is the value
    mapping (address => Voter) private voters;

    //Candidate ID tracker
    int public candidateIDCounter;

    //Voters count
    int public votersCount;


    constructor(){
        admin = msg.sender;
        electionStatus = ElectionStatus.NOT_STARTED;
        candidateIDCounter = 0;
        votersCount =0;
    }

     /**
        1.Adds new candidate
        Only admin can add before election starts or election ended
    */
    function addCandidate(string memory name, string memory proposal, address owner) public onlyAdmin beforeElectionStart returns (int){
        //Check whether the owner parameter passed is same as admin
        isOwnerOfTheContract(owner);

        //Increment Candidate ID counter;
        candidateIDCounter = candidateIDCounter +1;
        Candidate memory candidate = Candidate({
            id: candidateIDCounter,
            name: name,
            proposal : proposal,
            votesSecured: 0
        });
        candidates[candidateIDCounter] = candidate;
        return candidateIDCounter;
    }

    
    /**
        2.Adds new voter
        Only Admin can add before the elction starts or after election ended
    */
    function addVoter(address voter, string memory name, address owner) public onlyAdmin beforeElectionStart{

        //Check whether the owner parameter passed is same as admin
        isOwnerOfTheContract(owner);
      
        voters[voter] = Voter({
            voter: voter,
            name: name,
            delegate: voter,  //By default setting delegate and voter is same. 
            isVoted : false,
            isDelegated: false,
            votedCandidateID : 0
        });
        votersCount = votersCount+1;
    } 

    /**
        3.Starts election
        Only Admin can start the election after election ended
    */
    function startElection(address owner) public  onlyAdmin  returns (ElectionStatus){

        //Check whether the owner parameter passed is same as admin
        isOwnerOfTheContract(owner);

        electionStatus = ElectionStatus.ONGOING;
        return electionStatus;
    }


    /*
        4.Returns candidate id, proposal and name for the specified candidate. 

    */
    function displayCandidateDetails(int candidateId) public view returns (int, string memory, string memory){
        Candidate memory candidate = candidates[candidateId];
        return (candidate.id, candidate.proposal, candidate.name);
    }


    /*
        5.Returns the winner of the election. Candidate name, id and #votes 
        Assuming that there will be only one winner and there is no case where more than one canidate gets same number of votes
    */
    function showWinner() public  view returns (string memory, int, int){
        int highestVotes = 0;
        Candidate memory winner;
        for(int i=candidateIDCounter;i>0;i-- ){
            if (highestVotes < candidates[i].votesSecured){
                highestVotes = candidates[i].votesSecured;
                winner = candidates[i];
            }
        }
        return (winner.name, winner.id, winner.votesSecured);
    }

    /*
        6.Delegates given voter's voting right to delegate
    */
    function delegateVote(address delegate, address voter) public afterElectionStart{
        if (voters[voter].isVoted== false){
            voters[voter].delegate = delegate;
            voters[voter].isDelegated = true;
        }
    }

   /*
        7.Casts vote for the candidate by the given voter 
    */
    function vote(int candidateId, address voter) public afterElectionStart{
        voters[voter].votedCandidateID = candidateId;
        candidates[candidateId].votesSecured = candidates[candidateId].votesSecured +1;
    }


    /**
        8.Ends election
        Only Admin can end the election
    */
    function endElection() public  onlyAdmin afterElectionStart returns (ElectionStatus){
        electionStatus = ElectionStatus.COMPLETED;
        return electionStatus;
    }


     /**
        9.Shows election result for the given candidate
    */
    function showResult(int candidateId) public  view returns (int, string memory, int){
        return (candidateId, candidates[candidateId].name,  candidates[candidateId].votesSecured);
    }

    /**
        10. Returns Voter's profile - Voter's name, candidate name, is delegate or not
    */
    function getVoter(address voter) public  view returns (string memory , string memory, bool){
        return (voters[voter].name , candidates[voters[voter].votedCandidateID].name,  voters[voter].isDelegated);
    }

  
    function isOwnerOfTheContract(address owner) private view{
        require(admin == owner , "Only owner of the contract can perform this operation");
    }



    modifier onlyAdmin(){
        require(admin == msg.sender, "Only Admin can perform operation");
        _;
    }


    modifier beforeElectionStart(){
        require(electionStatus == ElectionStatus.NOT_STARTED, "Election is either ongoing or completed. Cannot perform requested operation");
        _;
    }

    modifier afterElectionStart(){
        require(electionStatus == ElectionStatus.ONGOING, "Election either not start or completed. Cannot perform requested operation");
        _;
    }
}