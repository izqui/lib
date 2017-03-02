pragma solidity ^0.4.6;

import "./Fixeable.sol";

contract BrokenContract is Fixeable {
  function BrokenContract() {
    broken = true;
    creator = msg.sender;
  }

  function canExecuteArbitraryCode() returns (bool) {
    return broken && msg.sender == creator;
  }

  bool public broken;
  address public creator;
}
