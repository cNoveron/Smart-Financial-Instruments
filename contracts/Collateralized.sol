pragma solidity >=0.4.21 <0.6.0;

contract Collateralized {

  address public collateral;

  constructor (address _collateral) internal {
    collateral = _collateral;
  }

}