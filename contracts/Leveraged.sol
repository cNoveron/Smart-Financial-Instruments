pragma solidity >=0.4.21 <0.6.0;

contract Leveraged {
  uint256 constant MIN_OPENING_COST = 1 ether;

  uint ratio;
  address trader;
  address borrower;
  uint tradeBalance;
  uint equity;

  constructor(uint _ratio, address _trader, uint256 _tradersFunds) public {
    require(1 < _ratio, "Leveraged constructor: Ratio must be greater than 1");
    require(_trader != address(0), "Leveraged constructor: Address zero is universally invalid");
    require(MIN_OPENING_COST < _tradersFunds, "Leveraged constructor: The opening cost must be greater than 1 Ether");
    ratio = _ratio;
    trader = _trader;
    borrower = msg.sender;
    tradeBalance = _tradersFunds * ratio;
  }

}