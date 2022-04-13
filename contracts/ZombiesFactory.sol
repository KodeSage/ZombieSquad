//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract ZombiesFactory{

    event NewZombie (uint id, string name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    function _createZombie(string memory _name, uint _dna) private { // Create Zombie Function
            zombies.push(Zombie(_name,_dna)); // Push new zombie to array
            uint id = zombies.length - 1; // Get the ID of the new Zombie
            emit NewZombie(id, _name, _dna); // Emit event
    }
    function _getZombieDna(string memory _str) private view returns (uint){ // Get Zombie DNA Function from the name of the Zommbie
         uint random = uint(keccak256(abi.encodePacked(_str)));
            return random % dnaModulus;
    }
    function createRandomZombie(string memory _name) public { // Create Random Zombie Function
         uint dna = getZombieDna(_name);
         _createZombie(_name, dna);
    }   
}