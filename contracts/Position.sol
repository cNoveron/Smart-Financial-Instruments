pragma solidity >=0.4.21 <0.6.0;

import "./Ownable.sol";

contract Positions is Ownable {

  uint256 openingCost;
  uint256 equity;
  Position[] list;
  uint256 listSize;
  uint256 constant MAX_LIST_SIZE = 2**256-1;

  struct Position {
    string positionType;
    uint256 paperProfit;
    address borrower;
  }

  constructor () internal {
  }

  function open(bool _isLong, address _borrower)
  internal returns(uint256) {
    require(
      listSize < MAX_LIST_SIZE,
      "Positions.open: MAX_LIST_SIZE reached"
    );
    return listSize = list.push(Position(_isLong ? "LONG" : "SHORT", 0, _borrower));
  }

  function settle(uint positionId) internal {
    require(
      msg.sender == list[positionId].borrower,
      "Position.settle: Only the borrower who opened this position can close it"
    );
    _settle();
  }

  function _settle() private;

}