// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Delegate {
    address public owner;

    constructor(address _owner) {
        owner = _owner; // 처음 오너는 delgation CA
    }

    function pwn() public {
        owner = msg.sender;
    }
}

contract Delegation {
    address public owner;
    Delegate delegate;

    constructor(address _delegateAddress) {
        delegate = Delegate(_delegateAddress);
        owner = msg.sender; // 처음 오너는 level EOA
    }

    fallback() external {
        (bool result, ) = address(delegate).delegatecall(msg.data); // Msg data에 무엇을 시킬거냐.. pwn 실행해달라 하면 Delegation owner가 내가 된다
        if (result) {
            this;
        }
    }
}
