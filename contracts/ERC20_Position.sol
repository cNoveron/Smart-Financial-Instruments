pragma solidity >=0.4.21 <0.6.0;

import "./Positions.sol";
import "./ERC165Checker.sol";
import "./IERC20.sol";

contract ERC20_Positions is Positions {

  using ERC165Checker for address;
  IERC20 ERC20_interface;

  // should be later replaced with its bytes4 interfaceId assigned to a constant variable
  // i.e. bytes4 public constant _INTERFACE_ID_ERC20 = 0xWHATEVER;
  bytes4 public _INTERFACE_ID_ERC20;

  address asset; // ERC-1455 Securities comming soon :D

  function open(address _ERC20_asset, bool _isLong, address _borrower)
  internal onlyOwner() returns(uint256) {
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
    return super.open(_ERC20_asset, _isLong, _borrower);
  }

  function paperProfit(uint positionId)
  internal returns (uint256 _paperProfit) {
    for (uint256 index = 0; index < listSize; index++) {
      if(list[positionId].open)
        _paperProfit.add(quotePrice(list[positionId].asset));
    }
  }

}