// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24; //solidity version

contract SimpleStorage {
    uint256 public  favno1; // initialize with 0
    // uint256[] favnos; //array

    struct User {
        uint256 favno;
        string name;
    }
    mapping(string => uint256) public nametofavno;
    User[] public users; //[] , it is a dynamic array
    //Users public one = User(7,"one"); //User public one = User({favno: 7,name:"one"});
    function store(uint256 _favNo) public virtual {
        favno1 = _favNo;
        //favno1 = favno1*9; //uses more gas
        
    }
    // view -  read state from the blockchain
    function retrieve() public view returns(uint256){
        return favno1;
    }
    // pure  - allows reading and storing in blockchain

    function addUser(string memory _name,uint256 _favno) public {
        User memory newuser = User(_favno , _name);
        users.push(newuser);
        nametofavno[_name] = _favno;

    
    }
}