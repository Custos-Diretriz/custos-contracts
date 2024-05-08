// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Test, console} from "../lib/forge-std/src/Test.sol";
import {CrimeRecord} from "../src/crime-evidence/CrimeRecord.sol";

contract CrimeTest is Test {
    CrimeRecord record;

    address owner = mkaddr('owner');

    function setUp() public {
        vm.startPrank(owner);
        record = new CrimeRecord(owner, owner); 
        vm.stopPrank();
    }

    function testCoverCrime() public {
        vm.startPrank(owner);
        record.coverCrime('uri');
        assert(record.balanceOf(owner) == 1);
        vm.stopPrank();
    }

      function mkaddr(string memory name) public returns (address) {
        address addr = address(
            uint160(uint256(keccak256(abi.encodePacked(name))))
        );
        vm.label(addr, name);
        return addr;
    }
}
