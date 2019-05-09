pragma solidity >=0.4.21 <0.6.0;

import "./SafeMath.sol";
import "./Ownable.sol";

contract Positions is Ownable {

  using SafeMath for uint256;

  Position[] list;
  uint256 listSize;
  uint256 constant MAX_LIST_SIZE = 2**256-1;
  uint256 openingCost;

  struct Position {
    address asset;
    string positionType;
    address borrower;
    bool open;
  }

  constructor () internal {
    openingCost = 0;
    listSize = 0;
  }

  function open(address _asset, bool _isLong, address _borrower)
  internal returns(uint256) {
    require(
      listSize < MAX_LIST_SIZE,
      "Positions.open: MAX_LIST_SIZE reached"
    );
    return _open(_asset, _isLong, _borrower);
  }

  function _open(address _asset, bool _isLong, address _borrower)
  private returns(uint256) {
    openingCost.add(msg.value);
    return listSize = list.push(
      Position(_asset, _isLong ? "LONG" : "SHORT", _borrower, true)
    );
  }

  function paperProfit(uint positionId) internal returns(uint256);
  function quotePrice(address _asset) internal returns(uint256);

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
    openingCost.sub(quotePrice(list[positionId].asset));
    list[positionId].open = false;
  }

}