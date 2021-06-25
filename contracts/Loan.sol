// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Credit is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    
    uint256 private _totalLoan;

    uint256 private _quotes;

    uint256 private _quotesPay;

    uint256 private _totalPay;
    
    mapping(uint256 => string) private _paymentURI;
    
    string private _loanOwnerURI;

    constructor(string memory tokenURI, uint256 amountLoan, uint256 quotes, string memory loanOwnerURI) ERC721("LoanCarPicanto2022", "CCP22") {
        _mint(msg.sender, 1);
        _mintDataLoan(amountLoan, quotes);
        _setTokenURI(1, tokenURI);
        _mintLoanOwner(loanOwnerURI);
    }

    /**
     * @dev See {_mintDataLoan}.
     */
    function _mintDataLoan(uint256 value, uint256 quotes)
    private
    {
        _quotes = quotes;
        _totalLoan = value;
    }
    
    /**
     * @dev See {_mintLoanOwner}.
     */
    function _mintLoanOwner(string memory ownerURI)
    private
    {
        _loanOwnerURI = ownerURI;
    }

    /**
     * @dev See {payQuote}.
     */
    function payQuote(string memory payURI, uint256 pay)
        public onlyOwner
        returns (uint256)
    {
        require(_totalLoan > _totalPay, "Not send more pay");
        require(pay <= _totalLoan - _totalPay, "the current debt is less");

        // se agrega el valor pagado a _totalPay
        _totalPay += pay;
        _quotesPay += 1;
        // se agrega el uri del comprobante de pago al array de pagos
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _paymentURI[newItemId] = payURI;
        
        return newItemId;
    }

    /**
     * @dev See {totalLoan}.
     */
    function totalLoan() public view virtual returns (uint256) {
        return _totalLoan;
    }

    /**
     * @dev See {totalQuotes}.
     */
    function totalQuotes() public view virtual returns (uint256) {
        return _quotes;
    }

    /**
     * @dev See {totalQuotesPay}.
     */
    function totalQuotesPay() public view virtual returns (uint256) {
        return _quotesPay;
    }

    /**
     * @dev See {totalPay}.
     */
    function totalPay() public view virtual returns (uint256) {
        return _totalPay;
    }

    /**
     * @dev See {getPayURI}.
     */
    function getPayURI(uint256 payId) public view virtual returns (string memory) {
        return _paymentURI[payId];
    }

    /**
     * @dev See {getLengthPayURI}.
     */
    function getLengthPayURI() public view virtual returns (uint256){
        return _tokenIds.current();
    }
    
    /**
     * @dev See {getPayURI}.
     */
    function getLoanOwnerURI() public view virtual returns (string memory) {
        return _loanOwnerURI;
    }

    /**
     * @dev See {burn}.
     */
    function burn(string memory tokenURI) public onlyOwner {
        require(_totalPay >= _totalLoan, "Not Burn");
        // pay debt
        _mint(msg.sender, 2);
        _setTokenURI(2, tokenURI);
        // burn Loan
        _burn(1);
    }
}