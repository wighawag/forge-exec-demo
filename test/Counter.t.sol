// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Counter.sol";
import "forge-exec/src/Exec.sol";

contract CounterTest is Test {
    Counter public counter;
    function setUp() public {
        string[] memory args = new string[](1);
        args[0] = "example.js";
        bytes memory returnData = Exec.execute("node", args);
        counter = abi.decode(returnData,(Counter));
    }

    function testIncrement() public {
        counter.increment();
        assertEq(counter.number(), 43);
    }

    function testSetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }
}
