pragma solidity >=0.4.21 <0.6.0;

contract Collateralized {

  string public collateralSymbol;
  string public quoteSymbol;

  constructor (string memory _collateralSymbol, string memory _quoteSymbol) public {
    collateralSymbol = _collateralSymbol;
    quoteSymbol = _quoteSymbol;
  }

}