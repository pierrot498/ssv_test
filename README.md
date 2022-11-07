## Salary Update

we create an updateSalary(teacherId) method to update s value of a given teacher

every time a student registers or is transferred to a course , we make a call to updateSalary to all affected teachers

## Deposit money

we add deposit payable onlyowner method for employer

## Claim Salary

we need a mapping (teacherId => amount) to keep track of last claim date per teacher

we add withdraw method for teacher

- nonReentrancy
- require teacherId is valid
- need a mapping teacherId=>address (and a setter too)

# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a script that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.js
```
