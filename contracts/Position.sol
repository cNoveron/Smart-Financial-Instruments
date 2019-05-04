pragma solidity >=0.4.21 <0.6.0;

contract Position {

  mapping(address => uint) balance;
  uint8 public positionType;
  uint256 public paperProfit;
  address trader;

  constructor (uint8 _positionType) public {
    require(
      0 == _positionType || 1 == _positionType,
      "Position constructor: PositionType must be either 0 (short) or 1 (long)"
    );
    positionType = _positionType;
    trader = msg.sender;
  }

  function closePosition() public {
    require(trader == msg.sender,"Position.closePosition: Only the trader who opened this position can close it");
    // more logic...
  }

}