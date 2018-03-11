pragma solidity ^0.4.18;

contract Ownable {
    address owner;
    modifier ownerOnly {
        require(msg.sender==owner);
        _;
    }
    function ownable() {
        owner = msg.sender;

    }
}