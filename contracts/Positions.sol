pragma solidity >=0.4.21 <0.6.0;

import "./SafeMath.sol";
import "./Ownable.sol";

contract Positions is Ownable {

  using SafeMath for uint256;

  uint256 openingCost;
  uint256 equity;
  Position[] list;
  uint256 listSize;
  uint256 constant MAX_LIST_SIZE = 2**256-1;

  struct Position {
    string positionType;
    uint256 paperProfit;
    address borrower;
    bool open;
  }

  constructor () internal {
    openingCost = 0;
    equity = 0;
    listSize = 0;
  }

  function open(bool _isLong, address _borrower)
  internal onlyOwner() returns(uint256) {
    require(
      listSize < MAX_LIST_SIZE,
      "Positions.open: MAX_LIST_SIZE reached"
    );
    return _open(_isLong, _borrower);
  }

  function _open(bool _isLong, address _borrower)
  private returns(uint256) {
    openingCost.add(msg.value);
    return listSize = list.push(Position(_isLong ? "LONG" : "SHORT", 0, _borrower, true));
  }

  function settle(uint positionId)
  internal {
    require(
      list[positionId].open,
      "Position.settle: Only the borrower who opened this position can close it"
    );
    require(
      msg.sender == list[positionId].borrower,
      "Position.settle: Only the borrower who opened this position can close it"
    );
    _settle(positionId);
  }

  function _settle(uint positionId)
  private {
    list[positionId].open = false;
  }

}