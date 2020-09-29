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
      -- R10 = i - array length (for outer loop)
      -- R11 = j - i (for inner loop condition)
      -- R30 = Stack Pointer
      -- 
      --
      -- Stack will be at Org5000 - R30 is Stack Pointer
0:  ADDI R30, R0, 5000
      -- Data is at Org 4000
4:  ADDI R4, R0, 4000
      -- Load the number of elements
8:  LW R1, 0(R4)
      -- Multiply by 4 because each number is a word
12:  SLL R1, R1, 2
      -- Set R2 as the beginning of the array of numbers
16:  ADDI R2, R4, 4
      -- R5 now points to first address past array
20:  ADD R5, R2, R1
      --
      --
      --Initialize loop variable
24:  ADD R3, R2, R0
LABEL OuterLoopStart
      -- subtraction for comparsion
28:  SUB R10, R3, R5
      -- Loop condition
32:  BGEZ R10, OuterLoopEnd
      --
      --
      -- Initialize inner loop variable to last element of array
36:  ADDI R6, R5, -4
LABEL InnerLoopStart
      -- subtraction for comparison
40:  SUB R11, R6, R3
      -- Inner loop condition
44:  BLEZ R11, InnerLoopEnd
      -- Load element at j
48:  LW R7, 0(R6)
      -- Load element at j-1
52:  LW R8, -4(R6)
      --
      --
      -- Subtract R7 from R8 and store in R9
56:  SUB R9, R8, R7
      -- If R7 >= R8 we don't need to swap
60:  BLTZ R9, NoSwap
      -- Store R7 in R8's spot
64:  SW R7, -4(R6)
      --Store R8 in R7's spot
68:  SW R8, 0(R6)
LABEL NoSwap
      --
      --
      -- Decrement Inner loop variable
72:  ADDI R6, R6, -4
      -- Unconditional jump to loop condition
76:  J InnerLoopStart
LABEL InnerLoopEnd
      --
      --
      -- Increment address by 4 bytes
80:  ADDI R3, R3, 4
      --Unconditional jump to top of loop
84:  J OuterLoopStart
LABEL OuterLoopEnd
      --
      --
      -- End Program
88:  HALT
