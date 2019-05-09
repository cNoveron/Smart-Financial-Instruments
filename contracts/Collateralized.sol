pragma solidity >=0.4.21 <0.6.0;

import "./Loans.sol";

contract CollateralizedLoans is Loans {

  mapping (uint256 => address) internal collaterals;

  function issue(uint256 _amount, uint256 _interest, address _collateral)
  internal returns (uint256) {
    collaterals[Loans.issue(_amount, _interest)] = _collateral;
  }
}