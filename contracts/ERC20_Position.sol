pragma solidity >=0.4.21 <0.6.0;

import "./Position.sol";
import "./ERC165Checker.sol";
import "./IERC20.sol";

contract ERC20_Position is Position {

  using ERC165Checker for address;

  IERC20 ERC20_interface;

  // should be later replaced with its bytes4 interfaceId assigned to a constant variable
  // i.e. bytes4 public constant _INTERFACE_ID_ERC20 = 0xWHATEVER;
  bytes4 public _INTERFACE_ID_ERC20;

  address asset; // ERC-1455 Securities comming soon :D

  constructor (bool _positionType, address _ERC20_asset)
  Position(_positionType)
  internal {
    _INTERFACE_ID_ERC20 = ERC20_interface.transfer.selector ^
      ERC20_interface.approve.selector ^
      ERC20_interface.transferFrom.selector ^
      ERC20_interface.totalSupply.selector ^
      ERC20_interface.balanceOf.selector ^
      ERC20_interface.allowance.selector;
    require(
      _ERC20_asset._supportsInterface(_INTERFACE_ID_ERC20),
      "ERC20_Collateralized constructor: Collateral is not ERC20"
    );
    asset = _ERC20_asset;
  }

}