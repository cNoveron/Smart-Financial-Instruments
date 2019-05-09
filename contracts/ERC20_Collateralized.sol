pragma solidity >=0.4.21 <0.6.0;

import "./Collateralized.sol";
import "./ERC165Checker.sol";
import "./IERC20.sol";

contract ERC20_CollateralizedLoans is CollateralizedLoans {

  using ERC165Checker for address;
  IERC20 ERC20_interface;

  // should be later replaced with its bytes4 interfaceId assigned to a constant variable
  // i.e. bytes4 public constant _INTERFACE_ID_ERC20 = 0xWHATEVER;
  bytes4 public _INTERFACE_ID_ERC20;

  function issue(uint256 _amount, uint256 _interest, address _collateral)
  public returns (uint256) {
    _INTERFACE_ID_ERC20 = ERC20_interface.transfer.selector ^
      ERC20_interface.approve.selector ^
      ERC20_interface.transferFrom.selector ^
      ERC20_interface.totalSupply.selector ^
      ERC20_interface.balanceOf.selector ^
      ERC20_interface.allowance.selector;
    require(
      _collateral._supportsInterface(_INTERFACE_ID_ERC20),
      "ERC20_Collateralized constructor: Collateral is not ERC20"
    );
    return CollateralizedLoans.issue(_amount, _interest, _collateral);
  }

}