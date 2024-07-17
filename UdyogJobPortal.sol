// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/*
    Job Contract for 
        posting a job, 
        adding a new applicant, 
        updating applicant rating,
        applying for a job and 
        retrieving applicant details applicant type, job details and applicant rating

        Business Rule: Only Admin can add New Applicant
*/

contract UdyogJobPortal{

    //List of Applicant Types that supports today 
    enum ApplicantType{
        FRESHER,
        EXPERIENCE_WITH_WORKPERMIT,
        EXPERIENCE_WITH_WORKPERMIT_NEEDED,
        RESIDENT,
        NONRESIDENT_WITH_WORKPERMIT_NEEDED,
        NONRESIDENT_WITH_WORKPERMIT,
        CONTRACTOR_WITH_WORKPERMIT,
        CONTRACTOR_WITH_WORKPERMIT_NEEDED
    }

    //Applicant Ratings 
    enum Rating{
        NOVICE,
        BEGINNER,
        INTERMEDIATE,
        EXPERT,
        ADVANCED,
        POOR,
        NONE
    }

    //Job Details 
    struct JobDetail{
        int jobId;
        string organization;
        string field;
        string role;
        string jobDescription;
        string  skill;
        string city;
        string state;
        string country;
        ApplicantType applicantType;
    }

    //Applicant Details
    struct Applicant{
        int applicantId;
        string userId;
        string name;
        string permAddress;
        string commAddress;
        string country;
        string state;
        string city;
        string pinCode;
        string skill;
        string experience;
        ApplicantType applicantType;
        Rating rating;
    }

    //Admin address. Ie. the address that is used to deploy the contract 
    address private admin;

    //List of Jobs. Job Id and Job Details
    mapping (int => JobDetail) private _jobs;

    //List of Job applicant for each job . Job Id and list of Applicant Id
    mapping (int => int[]) private _jobApplicants;

    //List of applicants. Applicant ID and Applicant Details
    mapping (int => Applicant) private _applicants;

    //Variable for generating and tracking the latest applicant ID
    int private _applicantId;

    //Variable for generating and tracking the latest job ID
    int private _jobId;


    //Initiate the contract deployer address and set values for Job id and applicant Id to zero. 
    constructor(){
        admin = msg.sender;
        _applicantId =0;
        _jobId =0;

    }

    //Adds new applicant with default rating as NONE to the applicant list.
    function addNewApplicant(string memory userId,  string memory name, string memory permAddress,
        string memory commAddress, string memory country, string memory state, string memory city, string memory pinCode,
        string memory skill, string memory experience, ApplicantType applicantType)  onlyAdmin public returns (int){
            _applicantId = _applicantId +1;
        Applicant memory applicant = Applicant({
            applicantId : _applicantId,
            userId : userId,
            name : name,
            permAddress : permAddress,
            commAddress : commAddress,
            country : country,
            state : state,
            city : city,
            pinCode : pinCode,
            skill : skill,
            experience : experience,
            applicantType : applicantType,
            rating : Rating.NONE
        });
        _applicants[applicant.applicantId] = applicant;
        return _applicantId;
    }

    //Returns applicant type for the given applicant ID
    function getApplicantType(int applicantId)  view public returns (ApplicantType){
        return _applicants[applicantId].applicantType;
    }


    //Returns applicant details for the given applicant id
    function getApplicantDetails(int applicantId)  view public returns (Applicant memory){
        return _applicants[applicantId];
    }
    
    //Adds new job to the list of jobs
    function addNewJob(string memory organization,  string memory field,  string memory role, string memory jobDescription,
        string memory skill,  string memory city,  string memory state, string memory country, ApplicantType applicantType)  public returns (int){
        _jobId = _jobId + 1;
        JobDetail memory jobDetail = JobDetail({
            jobId : _jobId,
            organization: organization,
            field: field,
            role : role,
            jobDescription : jobDescription,
            skill : skill,
            city : city,
            state : state,
            country : country,
            applicantType : applicantType
        });
        _jobs[_jobId] = jobDetail;
        return _jobId;
    }

    //Returns specified job id details 
    function getJobDetails(int jobId)  view public returns (JobDetail memory){
        return _jobs[jobId];
    }

    //Applicant applies for the specified job id
    function applyJob(int applicantId, int jobId)  public returns (bool){
        _jobApplicants[jobId].push(applicantId);
        return true;
    }

    //Rates applicnat 
    function rateApplicant(int applicantId, Rating rating)  public returns (bool){
        _applicants[applicantId].rating = rating;
        return true;
    }

    //Returns given aplicant Id rating
    function getApplicatnRating(int applicantId)  view public returns (Rating){
        return _applicants[applicantId].rating;
    }

    modifier onlyAdmin(){
        require(admin == msg.sender, "Only Admin can perform operation");
        _;
    }
}