// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {Exec} from "forge-exec/Exec.sol";

contract CounterScript is Script {
    function setUp() public {}

    function run() public {
        string[] memory args = new string[](1);
        args[0] = "example.js";
        Exec.execute("node", args);
    }
}
