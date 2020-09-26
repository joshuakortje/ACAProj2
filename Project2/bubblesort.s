--A program to implement bubble sort
-- 4000 = # of nums to sort
-- 4004  = beginning of array of nums
-- 4000 + 4*(# of nums) = beginning of array of sorted nums
-- 
-- R1 = Number of elements in the array
-- R2 = Pointer to the beginning of the array
-- R30 = Stack Pointer
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


End Assembly
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
0
0
0
0
0
0
0
0
0
0
0
End Data
-- stack
Begin Data 5000 100
End Data