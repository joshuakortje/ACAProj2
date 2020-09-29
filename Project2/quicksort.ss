      --A program to implement quick sort
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
      -- Stack will be at Org5000 - R30 is Stack Pointer
0:  ADDI R30, R0, 5000
      -- Data is at Org 4000
4:  ADDI R4, R0, 4000
      -- Load the number of elements
8:  LW R1, 0(R4)
      -- Multiply by 4 because each number is a word
12:  SLL R1, R1, 2
      -- initialize p to start of the array
16:  ADDI R20, R4, 4
      -- initialize r to last element of the array
20:  ADD R21, R4, R1
      -- calling quicksort subroutine 
24:  JAL QuickSort
28:  HALT
      --
      --
      -- start of quicksort function
LABEL QuickSort
      -- save R31 onto the stack
32:  SW R31, 0(R30)
      -- save R20 (p) to the stack
36:  SW R20, 4(R30)
      --save R21 (r) to the stack
40:  SW R21, 8(R30)
      --Increment stack pointer
44:  ADDI R30, R30, 12
      -- R20 minus R21
48:  SUB R3, R20, R21
      -- Branch if p >= r (R21 - R20) >= 0
52:  BGEZ R3, EndSort
      --
56:  JAL Partition
      --
      -- the output q and is stored in R6
      --
      -- Set r input parameter to q-1 (indicies)
60:  ADDI R21, R6, -4
      -- call quicksort for first half of the array
64:  JAL QuickSort
      -- add 2 to q - 1 (R21) and store as p parameter
68:  ADDI R20, R21, 8
      -- Put r back in place
72:  LW R21, -4(R30)
      -- call quicksort for second half of the array
76:  JAL QuickSort
      --end of quicksort subroutine 
LABEL EndSort
      -- decrement the stack pointer
80:  ADDI R30, R30, -12
      -- get the return address
84:  LW R31, 0(R30)
      -- restore R20 (p)
88:  LW R20, 4(R30)
      -- restore R21 (r)
92:  LW R21, 8(R30)
      -- Return from subroutine call
96:  JR R31
      -- 
      --
      -- Partition subroutine
LABEL Partition
      -- Save return address in R29
100:  ADD R29, R31, R0
      -- Get pivot element (x) from at r
104:  LW R5, 0(R21)
      -- Set i = p (R6 = R20)
108:  ADD R6, R20, R0
      --
      --
      -- Set j (loop variable) equal to p
112:  ADD R7, R20, R0
      -- Start of Loop
LABEL Loop
      -- Subtract j - r for comparison
116:  SUB R12, R7, R21
      -- Loop exit condition (j = r)
120:  BGEZ R12, EndLoop
      -- Load A[j] into R8
124:  LW R8, 0(R7)
      -- Subtraction R5 - R8 (x - A[j])
128:  SUB R9, R5, R8
      -- Branch if A[j] > x (R9 is negative)
132:  BLTZ R9, EndIf
      --
      --
      -- Save j as b parameter in swap function
136:  ADD R23, R7, R0
      -- Call Swap subroutine
140:  JAL Swap
      -- Increment i
144:  ADDI R6, R6, 4
      -- End of If statement 
LABEL EndIf
      -- Increment the loop variable (j)
148:  ADDI R7, R7, 4
      -- Unconditional jump to start of loop
152:  J Loop
      -- End of loop
LABEL EndLoop
      -- Save r as b parameter in swap function
156:  ADD R23, R21, R0
      --
      --
      -- Call Swap subroutine
160:  JAL Swap
      -- Load the return address back into R31
164:  ADD R31, R29, R0
      -- Return from partition
      -- q is returned in register R6
168:  JR R31
      --
      -- Swap subroutine
      -- parameter a is always i (R6)
      -- parameter b is saved in R23
      -- no need to save R31 because there
      -- are no recursive calls
LABEL Swap
      -- Get element at A[a]
172:  LW R10, 0(R6)
      -- Get element at A[b]
176:  LW R11, 0(R23)
      -- Store element from A[a] at A[b]
180:  SW R10, 0(R23)
      -- Store element from A[b] at A[a]
184:  SW R11, 0(R6)
      -- Jump return from swap subroutine
188:  JR R31
      --
      --
