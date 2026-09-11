# Solidity Fundamentals Wallet

A beginner Solidity smart contract project built to learn the fundamentals of smart contract development.

This project focuses on Solidity syntax, Ethereum wallet concepts, ETH transfers, contract state, and basic smart contract security.

## Features

- ETH deposits
- ETH withdrawals
- User balance tracking
- Balance checking
- Deposit events
- Withdrawal events
- Input validation
- Checks-Effects-Interactions pattern
- Foundry tests

## Solidity Concepts

This project demonstrates:

- Contracts
- State variables
- `uint256`
- `address`
- Mappings
- Functions
- `public`
- `view`
- `payable`
- `require`
- `msg.sender`
- `msg.value`
- `address(this).balance`
- `call`
- Events
- ETH transfers
- Checks-Effects-Interactions

## Project Structure

```text
solidity-fundamentals-wallet/
├── .gitignore
├── .gitmodules
├── foundry.lock
├── foundry.toml
├── README.md
├── lib/
│   └── forge-std/
├── notes/
│   └── Solidity-Beginner-Handbook.pdf
├── src/
│   └── Wallet.sol
└── test/
    └── Wallet.t.sol