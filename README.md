# Part A

see contract Course.sol

# Part B

Let's define amount to claim for a teacher by = s \*(nb of blocks since job last job)

with s=salary=nb_of_student\*c

c = constant of earning fixed per student

we need mapping ( teacherId => s) to keep track of all s values per teacher

## Salary Update

we create an updateSalary(teacherId) method to update s value of a given teacher

every time a student registers or is transferred to a course , we make a call to updateSalary to all affected teachers

## Deposit money

we add deposit payable onlyowner method for employer

## Claim Salary

we need a mapping (teacherId => last_block_claim) to keep track of last block_claim date per teacher

we add withdraw() method for teacher

- nonReentrancy
- require address matches to a valid teacherId (need a mapping address => teacherId)
  -require that there is enough money to claim (need to handle edge cases)

- amount is calculated following the formula : amount=(current_block - last_block_claim)\*s

## More to do

prioritize teacher who haven't claim salary over others ?
