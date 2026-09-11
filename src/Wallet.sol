// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Wallet {
    mapping(address => uint256) public balances;

    event Deposit(
        address indexed user,
        uint256 amount
    );

    event Withdrawal(
        address indexed user,
        uint256 amount
    );

    function deposit() public payable {
        require(
            msg.value > 0,
            "Must send ETH"
        );

        balances[msg.sender] += msg.value;

        emit Deposit(
            msg.sender,
            msg.value
        );
    }

    function balanceOf(address user)
        public
        view
        returns (uint256)
    {
        return balances[user];
    }

    function withdraw(uint256 amount) public {
        require(
            amount > 0,
            "Amount must be greater than zero"
        );

        require(
            balances[msg.sender] >= amount,
            "Insufficient balance"
        );

        // Effects
        balances[msg.sender] -= amount;

        // Interaction
        (bool success, ) =
            payable(msg.sender).call{value: amount}("");

        require(
            success,
            "Transfer failed"
        );

        emit Withdrawal(
            msg.sender,
            amount
        );
    }
}