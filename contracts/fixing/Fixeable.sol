pragma solidity ^0.4.8;

contract Fixeable {
  function execute(address fixer) {
    if (!canExecuteArbitraryCode()) throw;
    assembly {
      calldatacopy(0x0, 0x0, calldatasize)
      let a := delegatecall(sub(gas, 10000), fixer, 0x0, calldatasize, 0, 0)
      return(0, 0)
    }
  }

  function canExecuteArbitraryCode() returns (bool);
}
