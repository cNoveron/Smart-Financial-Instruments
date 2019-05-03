pragma solidity >=0.4.21 <0.6.0;

import "./Position.sol";
import "./Collateralized.sol";

contract LeveragedPosition is Collateralized, Position {

  uint ratio;
  address public trader;
  address public borrower;
  uint equity;

  constructor(
    uint _ratio, address _trader, uint256 _tradersFunds,
    string memory _collateralSymbol, string memory _quoteSymbol
  )
  Collateralized(_collateralSymbol,_quoteSymbol) public payable {
    require(1 < _ratio, "Leveraged constructor: Ratio must be greater than 1");
    require(_trader != address(0), "Leveraged constructor: Address zero is universally invalid");
    uint initialBalance = _tradersFunds * ratio;
    require(initialBalance == msg.value, "Leveraged constructor: You must send the apropiate amount of margin currency");
    balance[_trader] = initialBalance;
    ratio = _ratio;
    trader = _trader;
    borrower = msg.sender;
  }

}