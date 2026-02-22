// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24; //solidity version


import {mystorage} from "./first.sol"; // importing existing contract
    
contract storagefactory{
    //type visibility name
    mystorage[] public listofcontracts;
    function createcontract() public {
        mystorage  newcontract = new mystorage();//deploying another contract  
        listofcontracts.push(newcontract); //inserting contracts into the array
    }
    function sfstore(uint256 _index,uint256 _number) public {
        //address
        // ABI - Application Binary Interface
        mystorage newsimplestorage = mystorage(listofcontracts[_index]);
        newsimplestorage.store(_number); 
    }
    function sfget(uint _index) public view returns(uint256){
        mystorage newsimplestorage = mystorage(listofcontracts[_index]);
        return newsimplestorage.retrieve();
    }
}