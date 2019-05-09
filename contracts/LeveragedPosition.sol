pragma solidity >=0.4.21 <0.6.0;

import "./ERC20_Position.sol";

contract LeveragedPosition is ERC20_Positions {

  uint ratio;
  address public trader;
  address public borrower;
  uint equity;

  constructor(
    bool _positionType,
    address _collateralSymbol, address _ERC20_asset, address _borower,
    uint _ratio, address _trader, uint256 _tradersFunds
  )
  public payable {
    require(1 < _ratio, "Leveraged constructor: Ratio must be greater than 1");
    require(_trader != address(0), "Leveraged constructor: Address zero is universally invalid");
    uint initialBalance = _tradersFunds * ratio;
    require(initialBalance == msg.value, "Leveraged constructor: You must send the apropiate amount of margin currency");
    ratio = _ratio;
    trader = _trader;
    borrower = msg.sender;
  }

}