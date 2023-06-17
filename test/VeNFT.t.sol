//SPDX-License-Identifier: Unlicensed
pragma solidity 0.8.18;

import {BaseTest} from "./BaseTest.t.sol";
import {MockToken} from "../contracts/MockToken.sol";
import {VeNFT} from "../contracts/VeNFT.sol";
import "forge-std/console.sol";

contract VeNFTTest is BaseTest {
    uint256 public constant WEEK = 1 weeks;
    
    VeNFT public venft;
    MockToken public mockToken;

    
    modifier fundActor(uint256 actorId, uint128 value) {
        mockToken.mint(actors[actorId], value);
        _;
    }

    function setUp() override public {
        super.setUp();
        mockToken = new MockToken();
        venft = new VeNFT(address(mockToken));
        vm.warp(1687025783);
    }


    function test_createLock(uint128 value, uint256 time) public fundActor(0, value) useActor(0) {
        uint256 nextWeek = ((block.timestamp + WEEK)/WEEK) * WEEK;
        vm.assume(value > 0);
        time = uint256(bound(time, nextWeek, block.timestamp + venft.MAX_TIME()));
        mockToken.approve(address(venft), value);
        venft.createLock(value, time);
    }

    function test_revertsWhen_createLockWith0Val() public useActor(0) {
        vm.expectRevert("Cannot lock 0 tokens");
        venft.createLock(0, block.timestamp + WEEK);
    }

    function test_revertsWhen_createLockInPast() public useActor(0) {
        vm.expectRevert("Cannot lock in the past");
        venft.createLock(1e18, 0);
    }

    function test_revertsWhen_createLockGreaterThanMax() public useActor(0) {
        uint256 time = block.timestamp + venft.MAX_TIME() + 10 weeks;
        vm.expectRevert("Voting lock can be 4 years max");
        venft.createLock(1e18, time);
    }

    function test_increaseAmount(uint128 value) public fundActor(0, value) useActor(0){
        vm.assume(value >= 2);
        mockToken.approve(address(venft), value);
        venft.createLock(value/2, block.timestamp + 2 weeks);
        uint256 tokenId = venft.tokenOfOwnerByIndex(actors[0], 0);
        venft.increaseAmount(tokenId, value/2);
    }
}