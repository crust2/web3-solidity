// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import {PriceConvertor} from "./PriceConvertor.sol";
contract fundme {
    using PriceConvertor for uint256;
    uint256 public constant minUSD = 5 * 1e18; // $5 with 18 decimals
    address[] public contributors;
    mapping(address funder => uint256 amtFunded) public addresstoamtfunded;
    address public owner;
    error notowner();
    constructor(){
        owner = msg.sender;
    }
    function fund() public payable {
        require(msg.value.conversionrate() >= minUSD,"Didn't send enough ETH");
        contributors.push(msg.sender);//msg.sender = wallet address
        addresstoamtfunded[msg.sender]+=msg.value; //mapping value sent to the wallet address
       // msg.value = amount in ETH 
    }
    function withdraw() public onlyOwner {
        // using for loop here
        for(uint256 i=0;i<contributors.length;i++){
            address contributor = contributors[i];
            addresstoamtfunded[contributor]=0;
        }
        //reset the array
        contributors = new address[](0);
        //withdraw the funds
        //payable(msg.sender) -- payable address
        //transfer
        //send
        //call -- best for most contracts
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess,"Call Failed");
            }
        modifier onlyOwner(){
                    //require(msg.sender == owner,"withdraw failed");
                    if(msg.sender != owner){
                        revert notowner(); // gas efficient
                    }
                    _;    // order matters , if this is above the require , the code prior to this line will be executed first  
        }
        receive() external payable{
            fund();
        }
        fallback() external payable{
            fund();
        }
}
