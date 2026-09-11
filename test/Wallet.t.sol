// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Wallet} from "../src/Wallet.sol";

contract WalletTest is Test {
    Wallet wallet;

    address alice = makeAddr("alice");
    address bob = makeAddr("bob");

    function setUp() public {
        wallet = new Wallet();

        vm.deal(alice, 10 ether);
        vm.deal(bob, 10 ether);
    }

    function testDeposit() public {
        vm.prank(alice);

        wallet.deposit{value: 1 ether}();

        assertEq(
            wallet.balanceOf(alice),
            1 ether
        );

        assertEq(
            address(wallet).balance,
            1 ether
        );
    }

    function testWithdraw() public {
        vm.startPrank(alice);

        wallet.deposit{value: 5 ether}();
        wallet.withdraw(2 ether);

        vm.stopPrank();

        assertEq(
            wallet.balanceOf(alice),
            3 ether
        );

        assertEq(
            alice.balance,
            7 ether
        );
    }

    function testCannotWithdrawTooMuch() public {
        vm.startPrank(alice);

        wallet.deposit{value: 1 ether}();

        vm.expectRevert(
            "Insufficient balance"
        );

        wallet.withdraw(2 ether);

        vm.stopPrank();
    }

    function testCannotDepositZero() public {
        vm.prank(alice);

        vm.expectRevert(
            "Must send ETH"
        );

        wallet.deposit{value: 0}();
    }

    function testCannotWithdrawZero() public {
        vm.startPrank(alice);

        wallet.deposit{value: 1 ether}();

        vm.expectRevert(
            "Amount must be greater than zero"
        );

        wallet.withdraw(0);

        vm.stopPrank();
    }

    function testMultipleUsers() public {
        vm.prank(alice);
        wallet.deposit{value: 3 ether}();

        vm.prank(bob);
        wallet.deposit{value: 2 ether}();

        assertEq(
            wallet.balanceOf(alice),
            3 ether
        );

        assertEq(
            wallet.balanceOf(bob),
            2 ether
        );

        assertEq(
            address(wallet).balance,
            5 ether
        );
    }
}