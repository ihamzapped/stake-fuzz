pragma solidity ^0.8.1;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MockERC20 is ERC20 {
    uint public constant AMOUNT = type(uint128).max;

    constructor(address payable[] memory _users) ERC20("Mock Token", "MTK") {
        for (uint i = 0; i < _users.length; ++i) _mint(_users[i], AMOUNT);
    }
}
