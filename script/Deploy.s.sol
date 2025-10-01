// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Script, console} from "forge-std/Script.sol";
import {FHECounter} from "../src/FHECounter.sol";

contract DeployScript is Script {
    function run() public returns (FHECounter) {
        vm.startBroadcast();

        FHECounter counter = new FHECounter();
        console.log("FHECounter deployed at:", address(counter));

        vm.stopBroadcast();
        return counter;
    }
}
