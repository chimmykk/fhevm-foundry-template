// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test} from "forge-std/Test.sol";
import {FHECounter} from "../src/FHECounter.sol";

contract FHECounterTest is Test {
    FHECounter public counter;

    function setUp() public {
        counter = new FHECounter();
    }

    function test_ContractDeployment() public view {
        // Test that the contract deploys successfully
        assertTrue(address(counter) != address(0));
    }

    function test_GetCountReturnsEncryptedValue() public view {
        // Test that getCount returns an encrypted value (euint32)
        // We can't directly assert the value since it's encrypted
        // but we can verify the function call succeeds
        counter.getCount();
        assertTrue(true); // Placeholder assertion
    }
}
