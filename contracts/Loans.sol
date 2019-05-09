pragma solidity >=0.4.21 <0.6.0;

import "./SafeMath.sol";
import "./Ownable.sol";

contract Loans is Ownable {

  using SafeMath for uint256;

  Loan[] list;
  uint256 listSize;
  uint256 constant MAX_LIST_SIZE = 2**256-1;

  struct Loan {
    uint256 amount;
    uint256 interest;
    uint256 balanceDue;
  }

  function issue(uint256 _amount, uint256 _interest) internal returns (uint256);

  function _issue(uint256 _amount, uint256 _interest)
  private returns (uint256) {
    listSize = list.push(
      Loan(_amount, _interest, _amount+_interest)
    );
    emit LoanIssued (_amount, _interest);
    return listSize;
  }

  event LoanIssued (
    uint256 indexed amount,
    uint256 indexed interest
  );
}