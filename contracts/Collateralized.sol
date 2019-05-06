pragma solidity >=0.4.21 <0.6.0;

contract Collateralized {

  address collateralAddress;

  constructor (address _collateralAddress) public {
    collateralAddress = _collateralAddress;
  }

}