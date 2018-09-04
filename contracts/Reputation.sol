pragma solidity ^0.4.24;

import "./zeppelin/ownership/Ownable.sol";
import "./PersonIdentity.sol";

contract Reputation is Ownable {
    /**
    * contract address
    */
    PersonIdentity public personIdentity;
    /**
    * Profile by collaborators
    */
    enum TypeProfile{COLAB, AMBASSADOR, ESPECIALIST, ADVISOR}
    TypeProfile public retu;

    /**
    * map with id profile and range of reputation
    */
    mapping (uint8 => Profile) mapProfile;

    /**
    * map with the colab address and your profile
    */
    mapping (address => ProfileColab) mapProfileColab;    

    /**
    * Range of reputation, ex:
    * 1 until 100 is a collaborator
    * 101 until 300 is a ambassador    
    */
    struct RangeReputation {
        uint64 start;
        uint64 end;
    }
    /**
    * Profile of collaborators
    */
    struct Profile {
        TypeProfile typeProfile;
        RangeReputation range;
        bool status;
    }

    /**
    * Colab profile with the total points
    */
    struct ProfileColab {
        address addresssColab;
        Profile profile;
        int points;
    }    
    
    /**
    * @dev addReputation. Add a reputation with the range, ex: Ambassador = 100, 200
    * @param _type is the type of profile
    * @param _start the number of start range 
    * @param _end the number of end range 
    */        
    function setIdentityContract(address _contractAddress) public onlyOwner {
        require(address(_contractAddress) != 0x0, "Is necessary a valid address of contract identity");
        personIdentity = PersonIdentity(_contractAddress);
    }

    /**
    * @dev addReputation. Add a reputation with the range, ex: Ambassador = 100, 200
    * @param _type is the type of profile
    * @param _start the number of start range 
    * @param _end the number of end range 
    */    
    function addReputation(TypeProfile _type, uint64 _start, uint64 _end) 
        public onlyOwner {
        require(! mapProfile[uint8(_type)].status, "Profile exists");
        RangeReputation memory range = RangeReputation(_start, _end);
        mapProfile[uint8(_type)] = Profile(_type, range, true);
    }

    /**
    * @dev removeReputation. Remove a reputation, change the status to false
    */    
    function removeReputation(TypeProfile _type) public onlyOwner {
        require(mapProfile[uint8(_type)].status, "Profile already cancelled");
        delete mapProfile[uint8(_type)];
    }

    /**
    * @dev addPersonReputation. Add a reputation in a person
    * @TODO change the modifiers to a vote
    */       
    function addPersonReputation(address _addressColab, int8 _points) {
        // consulta se o endereço existe no Identity
        // consulta o total de pontos atuais para descobrir qual o perfil
        // adiciona os pontos no perfil do colaborador
        
    }

    /**
    * @dev removePersonReputation. Remove a reputation of the person
    * @TODO change the modifiers to a vote
    */   
    function removePersonReputation(address _addressColab, int8 _points) {
        // verifica se o endereço que esta removendo tem perfil de conselho
        
    }    

}

