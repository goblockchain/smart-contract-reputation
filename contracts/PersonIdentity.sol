pragma solidity 0.4.24;

//rinkeby 0xBBe5932a778698F2A8ea826B7A53F1435dBead08
contract PersonIdentity {
    
    enum Status {PENDING, APPROVE, REJECTED}
    Status status;
    /**
    * @dev Return the information about uport address
    * @param _uPort idPort
    * @return address
    * @return Status    
    */   
    function getPersonByIdUport(string _uPort) public view returns(address, Status);

    /**
    * @dev Return if the address is a collaborator
    * @return bool  
    */
    function isCollaborator(address _addressColab) public view returns(bool);

    /**
    * @dev Return the total of person
    * @return uint256  
    */
    function getTotalListPerson() public view returns(uint256);
}