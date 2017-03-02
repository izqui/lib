pragma solidity ^0.4.8;

import "./TheContract.sol";

contract TheContractFactory {
  modifier onlyOrNone(address x) {
    if (x != 0x0 && x != msg.sender) throw;
    _;
  }

  function upload(bytes o_code) returns (bytes32) {
    return uploadCode("Basic", o_code);
  }

  function uploadCode(string identifier, bytes o_code) onlyOrNone(deployer[identifierHash(identifier)]) returns (bytes32) {
    bytes32 h = identifierHash(identifier);

    code[h] = o_code;
    deployer[h] = msg.sender;

    NewCode(identifier);
    return h;
  }

  function deploy(string identifier) {
    bytes c = code[identifierHash(identifier)];
    if (c.length == 0) throw;

    deployCode(c);
    NewContract(deployCode(c), msg.sender, identifier);
  }

  function identifierHash(string identifier) returns (bytes32) {
    return sha3(identifier);
  }

  function deployCode(bytes o_code) returns (address addr) {
    assembly {
      addr := create(0,add(o_code,0x20), mload(o_code))
      jumpi(invalidJumpLabel,iszero(extcodesize(addr)))
    }
  }

  mapping (bytes32 => address) public deployer;
  mapping (bytes32 => bytes) public code;

  event NewContract(address x, address indexed owner, string indexed identifier);
  event NewCode(string indexed identifier);
}
