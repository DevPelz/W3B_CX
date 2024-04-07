// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.7;

// Become one of the owners of the contract
// Change hacked  to true for your address

contract Blocked {
    // bool hacked;
    mapping(address => bool) public hacked;
    address[] public owners;
    string[] public ownersName;

    address pwner;
    mapping(address => bool) whitelistedMinters;
    mapping(address => string) whitelistedNames;
    mapping(address => bool) public isWinner;

    function isContract(address addr) public view returns (bool) {
        uint size;
        assembly {
            size := extcodesize(addr)
        }
        return size > 0;
    }

    function addToWhitelist(address addr, string memory _name) public {
        require(!isContract(addr), "Contracts are not allowed");
        require(msg.sender != tx.origin, "You are blocked");
        whitelistedMinters[addr] = true;
        whitelistedNames[addr] = _name;
    }

    function beOwner(address addr) public {
        require(whitelistedMinters[addr], "You are not whitelisted");
        require(msg.sender == addr, "address must be msg.sender");
        require(addr != address(0), "Zero address");
        owners.push(addr);
    }

    function pwn(address addr) external payable {
        require(isContract(msg.sender), "only Contracts are allowed");
        require(msg.sender == addr, "address must be msg.sender");
        require(getValidOwner(msg.sender), "Must be owner");
        require(!hacked[addr], "you have hacked already");
        hacked[addr] = true;
        if (isWinner[tx.origin] == false && ownersName.length < 10) {
            ownersName.push(whitelistedNames[addr]);
        }
        isWinner[tx.origin] = true;
    }

    function pwn() external payable {
        require(msg.sender == pwner);
        hacked[msg.sender] = true;
    }

    function isHacked() public view returns (bool) {
        return hacked[msg.sender];
    }

    function getValidOwner(address addr) public returns (bool) {
        require(addr != address(0), "Zero address");
        address[] memory _owners = owners;
        for (uint i; i < _owners.length; i++) {
            if (owners[i] == addr) {
                return true;
            }
        }
    }

    function returnOwners() public view returns (address[] memory) {
        return owners;
    }

    function returnOwnerName() public view returns (string[] memory) {
        return ownersName;
    }
}
