// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;


import {mystorage} from "./first.sol";

contract add is mystorage {     // inheritence
    function store(uint256 _newnum) public override {
        favno1 = _newnum + 5;
    }
}