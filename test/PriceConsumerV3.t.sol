pragma solidity ^0.8.1;

import {Utils} from "./Utils.sol";
import {MockV3Aggregator} from "../mocks/MockV3Aggregator.sol";
import {PriceConsumerV3} from "../contracts/PriceConsumerV3.sol";
import {Test, console} from "forge-std/Test.sol";

contract Test_PriceConsumer is Test {
    Utils internal utils;

    MockV3Aggregator public v3aggr;
    PriceConsumerV3 public priceConsumer;

    uint8 public constant DECIMALS = 18;
    int public constant INIT_ANS = 1 ether;

    address payable[] internal users;
    address internal owner;
    address internal dev;

    function setUp() public virtual {
        utils = new Utils();
        users = utils.createUsers(3);
        owner = users[0];
        dev = users[1];

        vm.startPrank(owner);
        v3aggr = new MockV3Aggregator(DECIMALS, INIT_ANS);
        priceConsumer = new PriceConsumerV3(address(v3aggr));
        vm.stopPrank();
    }

    function test_getLatestPrice() public {
        startHoax(dev);
        int price = priceConsumer.getLatestPrice();
        console.logInt(price);
        assertEq(price, INIT_ANS);
    }
}
