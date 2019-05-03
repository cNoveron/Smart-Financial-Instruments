pragma solidity >=0.4.21 <0.6.0;

contract Leveraged {

  uint ratio;
  address borrower;
  uint tradeBalance;
  uint equity;

  constructor(uint _ratio, address _borrower, uint256 _tradersFunds) public {
    ratio = _ratio;
    borrower = _borrower;
    tradeBalance = _tradersFunds * ratio;
  }

}
