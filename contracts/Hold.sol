pragma solidity ^0.4.8;

contract Hold {
  address public owner;
  address public backup;

  uint256 backupable;

  function Hold(address _backup, uint256 _seconds) payable {
    owner = msg.sender;
    backupable = now + _seconds;
    backup = _backup;
  }

  function recover() public {
    if (msg.sender != owner) throw;
    suicide(owner);
  }

  function recoverToBackupAddress() public {
    if (msg.sender != backup) throw;
    if (now < backupable) throw;
    suicide(backup);
  }
}

// reset: 0x6720fCE9Ac0a6F7B91eF2DA8B2886459a3E18fEf
