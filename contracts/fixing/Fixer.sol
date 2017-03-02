pragma solidity ^0.4.8;

import "./BrokenContract.sol";

contract Fixer is BrokenContract {
  function execute(address fixer) {
    broken = false;
  }
}
