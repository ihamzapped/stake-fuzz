pragma solidity ^0.8.1;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

error Staking_Failed();

contract Stakepool {
    mapping(address => uint) public balances;

    function stake(uint _amount, address _token) external returns (bool) {
        balances[msg.sender] += _amount;

        bool _success = IERC20(_token).transferFrom(
            msg.sender,
            address(this),
            _amount
        );

        if (!_success) revert Staking_Failed();
        return true;
    }
}
