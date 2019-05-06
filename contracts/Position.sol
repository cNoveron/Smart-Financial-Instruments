pragma solidity >=0.4.21 <0.6.0;

contract Position {

  string public positionType;
  uint256 public paperProfit;
  address borrower;

  constructor (bool _positionType) internal {
    positionType = _positionType ? "LONG" : "SHORT";
    paperProfit = 0;
    borrower = msg.sender;
  }

  function closePosition() public {
    require(borrower == msg.sender,"Position.closePosition: Only the borrower who opened this position can close it");
    _closePosition();
  }

  function _closePosition() private;
  
}