.data
arr1: .word 1, 2, 3, 4, 5
arr2: .word 6, 7, 8, 9, 0
newline: .string "The dot product is: \n"

.text
main:
    addi x5, x0, 0    # sop = 0, using x5 to store the sum of products
    addi x7, x0, 0    # i = 0, using x7 for loop index
    addi x10, x0, 5   # Set loop bound in x10

    la x8, arr1       # Load address of arr1 into x8
    la x9, arr2       # Load address of arr2 into x9, corrected from arr1 to arr2
loop1:
    bge x7, x10, exit1
    # load element from array
    lw x11, 0(x8)      # Load word from arr1[i] into x11
    lw x12, 0(x9)      # Load word from arr2[i] into x12
    
    mul x13, x11, x12  # Multiply x11 and x12, store result in x13
    add x5, x5, x13    # Add multiplication result to sop

    slli x18, x8, 2
    slli x19, x9, 2
    add x8, x8, x18
    add x9, x9, x19
    
    addi x7, x7, 1     # Increment loop index i
    
    j loop1            # Jump back to the start of the loop
 exit1:
    # print_int
    addi a0, x0 ,1
    add a1, x0, x5
    ecall
    
    
