// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";

import "../src/HackChallenge.sol";

contract CounterScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        HackChalenge H = new HackChalenge();
        // = new hhh(adresss(H))
        H.testExploit();
    }
}

// forge script script/Counter.s.sol:CounterScript --rpc-url https://polygon-mumbai.g.alchemy.com/v2/2uQ5W4mPPKN_smMuijn2OKKh7iWS0S8a --broadcast  -vvvv
