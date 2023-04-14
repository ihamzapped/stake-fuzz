pragma solidity ^0.8.1;

import {Utils} from "./Utils.sol";
import {MockERC20} from "../mocks/MockERC20.sol";
import {Stakepool} from "../contracts/Stakepool.sol";
import {Test, console} from "forge-std/Test.sol";

contract Test_Stake is Test {
    Utils internal utils;

    MockERC20 public token;
    Stakepool public stakepool;

    address payable[] internal users;
    address internal owner;
    address internal dev;

    function setUp() public virtual {
        utils = new Utils();
        users = utils.createUsers(3);
        owner = users[0];
        dev = users[1];

        vm.startPrank(owner);
        token = new MockERC20(users);
        stakepool = new Stakepool();
        vm.stopPrank();
    }

    function test_stake(uint _amount) public {
        vm.assume(_amount <= token.AMOUNT());

        startHoax(dev);

        token.approve(address(stakepool), _amount);

        bool success = stakepool.stake(_amount, address(token));

        assertTrue(success);
    }
}
