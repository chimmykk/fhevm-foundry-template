# FHEVM Foundry Template

A Foundry-based template for developing Fully Homomorphic Encryption (FHE) enabled Solidity smart contracts using the
FHEVM protocol by Zama.

## Quick Start

For detailed instructions see:
[FHEVM Documentation](https://docs.zama.ai/fhevm)

### Prerequisites

- **Foundry**: Version 0.2.0 or higher
- **Node.js**: Version 20 or higher 

### Installation

1. **Install Foundry**

   ```bash
   curl -L https://foundry.paradigm.xyz | bash
   foundryup
   ```

2. **Clone and setup**

   ```bash
   git clone <repository-url>
   cd fhevm-foundry-template
   forge install
   ```

3. **Set up environment variables**

   ```bash
   cp .env.example .env
   # Edit .env with your private key and RPC URL
   ```

4. **Compile and test**

   ```bash
   forge build
   forge test
   ```

5. **Deploy to Local Network (Anvil)**

   ```bash
   # Start local Anvil node
   anvil
   
   # Deploy to local network (in another terminal)
   forge script script/Deploy.s.sol --rpc-url http://localhost:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --broadcast
   ```

6. **Deploy to Sepolia Testnet**

   ```bash
   # Deploy to Sepolia
   forge script script/Deploy.s.sol --rpc-url sepolia --broadcast --verify
   ```

7. **Test on Sepolia Testnet**

   ```bash
   # Once deployed, you can run tests on Sepolia
   forge test --fork-url <SEPOLIA_RPC_URL>
   ```




## Local Development with Anvil

Anvil is Foundry's fast local Ethereum node, perfect for development and testing.

### **Start Anvil Node**

```bash
# Start Anvil with default settings
anvil

# Start with custom settings
anvil --port 8545 --host 127.0.0.1 --accounts 10 --balance 10000
```


### **Deploy to Anvil**

```bash
# Deploy using first Anvil account
forge script script/Deploy.s.sol --rpc-url http://localhost:8545 --private-key {pvtkey} --broadcast

# Test contract interaction
cast call CONTRACT_ADDRESS "getCount()" --rpc-url http://localhost:8545
```

## Project Structure

```
fhevm-foundry-template/
├── src/                # Smart contract source files
│   └── FHECounter.sol  # Example FHE counter contract
├── test/               # Test files
├── script/              # Deployment scripts
├── lib/                 # Dependencies
│   └── forge-std/      # Foundry standard library
└── foundry.toml        # Foundry configuration
```

## Available Commands

| Command              | Description              |
| -------------------- | ------------------------ |
| `forge build`        | Compile all contracts    |
| `forge test`         | Run all tests            |
| `forge coverage`     | Generate coverage report |
| `forge script`       | Run deployment scripts   |
| `forge verify`       | Verify contracts         |
| `anvil`              | Start local node         |
| `cast call`          | Call contract functions   |

## Documentation

- [FHEVM Documentation](https://docs.zama.ai/fhevm)
- [Foundry Book](https://book.getfoundry.sh/)

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Support

- **GitHub Issues**: [Report bugs or request features](https://github.com/zama-ai/fhevm/issues)
- **Documentation**: [FHEVM Docs](https://docs.zama.ai)
- **Community**: [Zama Discord](https://discord.gg/zama)

---

**Built with ❤️ by the Zama team**