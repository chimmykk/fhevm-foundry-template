// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {FHE, euint32, externalEuint32} from "@fhevm/solidity/lib/FHE.sol";
import {SepoliaConfig} from "@fhevm/solidity/config/ZamaConfig.sol";

/**
 * @title FHECounter
 * @author fhevm-foundry-template
 * @notice A very basic example contract showing how to work with encrypted data using FHEVM.
 */
contract FHECounter is SepoliaConfig {
    euint32 private _count;

    /**
     * @notice Emitted when the counter is incremented
     * @param caller The address that called the increment function
     */
    event CounterIncremented(address indexed caller);

    /**
     * @notice Emitted when the counter is decremented
     * @param caller The address that called the decrement function
     */
    event CounterDecremented(address indexed caller);

    /**
     * @notice Returns the current encrypted count
     * @return The encrypted count value
     */
    function getCount() external view returns (euint32) {
        return _count;
    }

    /**
     * @notice Increments the counter by an encrypted value
     * @param inputEuint32 The encrypted input value to add
     * @param inputProof The cryptographic proof for the input value
     */
    function increment(externalEuint32 inputEuint32, bytes calldata inputProof) external {
        euint32 encryptedEuint32 = FHE.fromExternal(inputEuint32, inputProof);
        _count = FHE.add(_count, encryptedEuint32);

        FHE.allowThis(_count);
        FHE.allow(_count, msg.sender);

        emit CounterIncremented(msg.sender);
    }

    /**
     * @notice Decrements the counter by an encrypted value
     * @param inputEuint32 The encrypted input value to subtract
     * @param inputProof The cryptographic proof for the input value
     */
    function decrement(externalEuint32 inputEuint32, bytes calldata inputProof) external {
        euint32 encryptedEuint32 = FHE.fromExternal(inputEuint32, inputProof);
        _count = FHE.sub(_count, encryptedEuint32);

        FHE.allowThis(_count);
        FHE.allow(_count, msg.sender);

        emit CounterDecremented(msg.sender);
    }
}
