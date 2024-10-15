
<p align="center">
  <a href="https://hardhat.org/" target="blank">
    <img src="https://seeklogo.com/images/H/hardhat-logo-888739EBB4-seeklogo.com.png" alt="Hardhat Logo" width="200"/>
  </a>
</p>

# Hardhat & Ethereum Project (TypeScript)

This project demonstrates a basic Hardhat use case with TypeScript. It comes with a sample contract, a test for that contract, and includes scripts to compile, deploy, and interact with your contract.

## Description

A starter project to work with Hardhat and Ethereum smart contracts using TypeScript. The following steps outline how to compile, deploy, and test your contract.

## Installation

Install the required dependencies:

```bash
pnpm install
```

## Commands

### 1. Compile the Contracts

```bash
pnpm run compile
```

This command compiles your Solidity contracts located in the `contracts/` directory.

### 2. Deploy the Contracts

```bash
pnpm run deploy
```

This command deploys your smart contracts to a local or specified network.

### 3. Run a Local Blockchain Node

```bash
pnpm run local-node
```

Start a local blockchain instance. Use this in a separate terminal.

### 4. Interact with the Contracts in the Console

```bash
pnpm run console
```

Open the Hardhat console and interact with the deployed contracts. You can test and execute functions directly from the console.

### 5. Testing

To run tests:

```bash
pnpm run test
```

Run automated tests for your smart contracts using Hardhat's testing environment.

## Example Usage

Here is an example of the flow you can follow to compile, deploy, and interact with your contracts:

```bash
# Step 1: Compile contracts
pnpm run compile

# Step 2: Deploy contracts
pnpm run deploy

# Step 3: Start a local node (in a separate terminal)
pnpm run local-node

# Step 4: Open console to interact with deployed contracts
pnpm run console
```

Now you can use the Hardhat console to call the functions in your smart contracts and test them.

<p align="center">
  <img src="https://img.shields.io/badge/Made_with-TypeScript-blue?logo=typescript"/>
  <img src="https://img.shields.io/badge/Powered_by-Hardhat-yellow?logo=hardhat"/>
  <img src="https://img.shields.io/badge/Smart_Contracts-Ethereum-green?logo=ethereum"/>
</p>
