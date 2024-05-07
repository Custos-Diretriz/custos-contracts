// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Agreement {

    struct Legal_Agreeement {
        address creator;
        string content;
        
    }
    constructor() {
        
    }

    modifier onlyCreator(address _sender) {
        _;
    }
}