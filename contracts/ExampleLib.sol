pragma solidity ^0.4.8;

import "./LibInterface.sol";

library ExampleLib {
  function getUint(LibInterface.S storage s) returns (uint) {
    return s.i;
  }
  function setUint(LibInterface.S storage s, uint i) {
    s.i = i;
  }
}
