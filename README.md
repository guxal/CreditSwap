# Loan Swap

[![built-with openzeppelin](https://img.shields.io/badge/built%20with-OpenZeppelin-3677FF)](https://docs.openzeppelin.com/)

In finance, a loan is the lending of money by one or more individuals, organizations, or other entities to other individuals, organizations etc. The recipient (i.e., the borrower) incurs a debt and is usually liable to pay interest on that debt until it is repaid as well as to repay the principal amount borrowed.

Acting as a provider of loans is one of the main activities of financial institutions such as banks and credit card companies.

these contracts are intended to serve as a database to keep track of payments on an ongoing loan, and in turn choose to sell this debt to other lenders in a decentralized ecosystem.


## Contracts

- Loan

- CrowdLoan - CrowdLending

- Token Payable

## Loan

Current loan with bank or credit union, keeps track of current payments, works as a database.

* features:

    - Total debt
    - Number of quotas
    - start date
    - interest rate 

### Link to the owner

In this case we use linkedin but any social network of value to the loan owner can be used.

## CrowdLending


It allows to put on sale the debt established in the credit contract, it is expected to receive a stable currency, so that it is better both to liquidate it and to repay the loan without impermanent losses.


* features:

    - Total loan
    - Number of quotas
    - Start date
    - deadline to close financing
    - interest rate


receives stable coin, and if the total is filled, transfers it to the borrower's wallet.
  

## Token Payable - NewLoan - 1155

allows the debt to be divided into participation percentages according to the amount contributed in the CrowdLending, receives the payments in a stable currency and assigns them to each wallet for later withdrawal.

* features:

    - Total Supply = 100%
    - number of quotes paid
    - total paid
    - receive debt payment
    - event to measure monthly payments
    - event to know if you are in default and to report it
    - collect earnings and principal per borrower


# Referencias

https://github.com/aarondr77/DebtStandard/issues/1

https://chronologicnetwork.medium.com/how-to-use-chronos-debt-smart-contract-dapp-guide-94e416524d32

https://www.teller.finance/

https://github.com/hazae41/ERC-Antitoken/blob/main/contracts/Antitoken.sol

https://www.reddit.com/r/ethereum/comments/n9e31y/how_will_debt_be_addressed_on_ethereum_smart/

https://www.reddit.com/r/CryptoTechnology/comments/n9hacq/lending_protocols_and_creditidentity_systems/

https://github.com/chronologic/debt-smart-contract/blob/master/contracts/DebtToken.sol

https://blog.enjincoin.io/erc-1155-the-crypto-item-standard-ac9cf1c5a226

# Bibliography

https://en.wikipedia.org/wiki/Credit

https://en.wikipedia.org/wiki/Title_loan

https://en.wikipedia.org/wiki/Loan

https://en.wikipedia.org/wiki/Contract

https://en.wikipedia.org/wiki/Loan_covenant

https://en.wikipedia.org/wiki/Bond_(finance)

