pragma solidity >=0.4.21 <0.6.0;

contract Position {

  mapping(address => uint) balance;
  string public positionType;
  uint256 public paperProfit;
  address trader;

  constructor (bool _positionType) public {
    positionType = _positionType ? "LONG" : "SHORT";
    trader = msg.sender;
  }

  function closePosition() public {
    require(trader == msg.sender,"Position.closePosition: Only the trader who opened this position can close it");
    // more logic...
  }

}