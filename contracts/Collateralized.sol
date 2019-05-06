pragma solidity >=0.4.21 <0.6.0;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";

contract Collateralized {

  address collateralAddress;

  constructor (address _collateralAddress) public {
    collateralAddress = _collateralAddress;
  }

}