// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import "../src/TokenWhale.sol";

contract TokenWhaleTest is Test {
    TokenWhale public token;

    address public addr1;
    address public addr2;

    function setUp() public {
        addr1 = makeAddr("Account1");
        addr2 = makeAddr("Account2");

        token = new TokenWhale(addr1);

        targetSender(addr1);
    }

    function testTransfer() public {
        vm.prank(addr1);
        token.transfer(addr2, 100);
        require(token.balanceOf(addr1) == 900 && token.balanceOf(addr2) == 100);
    }

    function testFailTransfer() public {
        vm.prank(addr1);
        token.transfer(addr2, 2000);
    }

    // function testApprove(uint256 value) public {
    //     vm.prank(addr1);
    //     token.approve(addr2, value);
    //     require(token.allowance(addr1, addr2) == value);
    // }

    // function testTransfer(uint256 value) public {
    //     vm.assume(value < 1000);

    //     uint256 beforeBalance1 = token.balanceOf(addr1);
    //     uint256 beforeBalance2 = token.balanceOf(addr2);

    //     vm.prank(addr1);
    //     token.transfer(addr2, value);

    //     uint256 afterBalance1 = token.balanceOf(addr1);
    //     uint256 afterBalance2 = token.balanceOf(addr2);

    //     require(afterBalance1 == beforeBalance1 - value);
    //     require(afterBalance2 == beforeBalance2 + value);
    // }

    // function testTransformFrom(uint256 value) public {
    //     vm.assume(value < 1000);

    //     uint256 beforeBalance1 = token.balanceOf(addr1);
    //     uint256 beforeBalance2 = token.balanceOf(addr2);

    //     vm.prank(addr1);
    //     token.approve(address(this), value);

    //     token.transferFrom(addr1, addr2, value);

    //     uint256 afterBalance1 = token.balanceOf(addr1);
    //     uint256 afterBalance2 = token.balanceOf(addr2);

    //     require(afterBalance1 == beforeBalance1 - value);
    //     require(afterBalance2 == beforeBalance2 + value);
    // }

    // function invariantTotalBalance() public {
    //     require(
    //         token.balanceOf(addr1) +
    //             token.balanceOf(addr2) +
    //             token.balanceOf(address(this)) ==
    //             1000
    //     );
    // }
}
