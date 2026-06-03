// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24; //solidity version

import {Script} from "forge-std/Script.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";
contract DeploySimpleStorage is Script{
    function run() external returns(SimpleStorage){
        vm.startBroadcast(); //everything after this goes to the RPC
        SimpleStorage simplestorage = new SimpleStorage();
        vm.stopBroadcast();
        return simplestorage;
    }
}