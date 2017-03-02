pragma solidity ^0.4.6;

contract Basic {
  event Hello(string h, address x);

  function Basic(address x) {
    Hello("world", x);
  }

  function b() returns (uint) {
    return 1;
  }
}
