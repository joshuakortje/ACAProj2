--A program to implement bubble sort
-- 4000 = # of nums to sort
-- 4004  = beginning of array of nums
-- 
-- R1 = Number of elements in the array
-- R2 = Pointer to the beginning of the array
-- R3 = outer loop variable (i)
-- R4 = holds start of data
-- R5 = last address of the array
-- R6 = inner loop variable (j)
-- R7 = Element at j
-- R8 = Element at j-1
-- R9 = R8 - R7
-- R30 = Stack Pointer
-- 
--
Begin Assembly
-- Stack will be at Org5000 - R30 is Stack Pointer
ADDI R30, R0, 5000
-- Data is at Org 4000
ADDI R4, R0, 4000
-- Load the number of elements
LW R1, 0(R4)
-- Multiply by 4 because each number is a word
SLL R1, R1, 2
-- Set R2 as the beginning of the array of numbers
ADDI R2, R4, 4
-- R5 now points to first address past array
ADD R5, R2, R1
--
--
--Initialize loop variable
ADD R3, R2, R0
LABEL OuterLoopStart
-- Loop condition
BEQ R5, R3, OuterLoopEnd
--
--
-- Initialize inner loop variable to last element of array
ADDI R6, R5, -4
LABEL InnerLoopStart
-- Inner loop condition
BEQ R6, R3, InnerLoopEnd
-- Load element at j
LW R7, 0(R6)
-- Load element at j-1
LW R8, -4(R6)
--
--
-- Subtract R7 from R8 and store in R9
SUB R9, R8, R7
-- If R7 >= R8 we don't need to swap
BLTZ R9, NoSwap
-- Store R7 in R8's spot
SW R7, -4(R6)
--Store R8 in R7's spot
SW R8, 0(R6)
LABEL NoSwap
--
--
-- Decrement Inner loop variable
ADDI R6, R6, -4
-- Unconditional jump to loop condition
J InnerLoopStart
LABEL InnerLoopEnd
--
--
-- Increment address by 4 bytes
ADDI R3, R3, 4
--Unconditional jump to top of loop
J OuterLoopStart
LABEL OuterLoopEnd
--
--
-- End Program
HALT
End Assembly
--
--
-- begin main data
Begin Data 4000 84
10
64
23
71
33
5
93
82
34
13
111
End Data
-- stack
Begin Data 5000 100
End Data