-- Joshua Kortje and Isaiah Higgins
-- A program to implement quick sort
--
-- 4000 = # of nums to sort
-- 4004  = beginning of array of nums
-- 5000 beginning of the stack
-- 
-- R1 = Number of elements in the array
-- R3 = holds p - r
-- R4 = holds the start of data
-- R5 = holds pivot element (x)
-- R6 = holds i (also called q after the partition routine) (also a parameter in swap routine)
-- R7 = holds j (loop variable)
-- R8 = holds A[j]
-- R9 = holds x - A[j] for comparison
-- R10 = A[a] for swap routine
-- R11 = A[b] for swap routine
-- R12 = j - r
-- R20 = holds p
-- R21 = holds r 
-- R23 = b parameter of the swap function
-- R29 = holds return address for partition
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
-- initialize p to start of the array
ADDI R20, R4, 4
-- initialize r to last element of the array
ADD R21, R4, R1
-- calling quicksort subroutine 
JAL QuickSort
HALT
--
--
-- start of quicksort function
LABEL QuickSort
-- save R31 onto the stack
SW R31, 0(R30)
-- save R20 (p) to the stack
SW R20, 4(R30)
--save R21 (r) to the stack
SW R21, 8(R30)
--Increment stack pointer
ADDI R30, R30, 12
-- R20 minus R21
SUB R3, R20, R21
-- Branch if p >= r (R21 - R20) >= 0
BGEZ R3, EndSort
--
JAL Partition
--
-- the output q and is stored in R6
--
-- Set r input parameter to q-1 (indicies)
ADDI R21, R6, -4
-- call quicksort for first half of the array
JAL QuickSort
-- add 2 to q - 1 (R21) and store as p parameter
ADDI R20, R21, 8
-- Put r back in place
LW R21, -4(R30)
-- call quicksort for second half of the array
JAL QuickSort
--end of quicksort subroutine 
LABEL EndSort
-- decrement the stack pointer
ADDI R30, R30, -12
-- get the return address
LW R31, 0(R30)
-- restore R20 (p)
LW R20, 4(R30)
-- restore R21 (r)
LW R21, 8(R30)
-- Return from subroutine call
JR R31
-- 
--
-- Partition subroutine
LABEL Partition
-- Save return address in R29
ADD R29, R31, R0
-- Get pivot element (x) from at r
LW R5, 0(R21)
-- Set i = p (R6 = R20)
ADD R6, R20, R0
--
--
-- Set j (loop variable) equal to p
ADD R7, R20, R0
-- Start of Loop
LABEL Loop
-- Subtract j - r for comparison
SUB R12, R7, R21
-- Loop exit condition (j = r)
BGEZ R12, EndLoop
-- Load A[j] into R8
LW R8, 0(R7)
-- Subtraction R5 - R8 (x - A[j])
SUB R9, R5, R8
-- Branch if A[j] > x (R9 is negative)
BLTZ R9, EndIf
--
--
-- Save j as b parameter in swap function
ADD R23, R7, R0
-- Call Swap subroutine
JAL Swap
-- Increment i
ADDI R6, R6, 4
-- End of If statement 
LABEL EndIf
-- Increment the loop variable (j)
ADDI R7, R7, 4
-- Unconditional jump to start of loop
J Loop
-- End of loop
LABEL EndLoop
-- Save r as b parameter in swap function
ADD R23, R21, R0
--
--
-- Call Swap subroutine
JAL Swap
-- Load the return address back into R31
ADD R31, R29, R0
-- Return from partition
-- q is returned in register R6
JR R31
--
-- Swap subroutine
-- parameter a is always i (R6)
-- parameter b is saved in R23
-- no need to save R31 because there
-- are no recursive calls
LABEL Swap
-- Get element at A[a]
LW R10, 0(R6)
-- Get element at A[b]
LW R11, 0(R23)
-- Store element from A[a] at A[b]
SW R10, 0(R23)
-- Store element from A[b] at A[a]
SW R11, 0(R6)
-- Jump return from swap subroutine
JR R31
--
--
End Assembly
-- begin main data
Begin Data 4000 84
10
64
-14
71
33
5
-8
82
34
13
111
End Data
-- stack
Begin Data 5000 100
End Data