.data

a: .word 1, 2, 3, 4, 5
b: .word 6, 7, 8, 9, 10
output: .string "The dot product is: "
newline: .string "\n"

.text
main:
    la a0, a                     
    la a1, b                     
    li a2, 5                     
    addi t0, x0, 1               
    
    jal dot_product_recursive
    
    mv t3, a0
    
    li a0, 4                    
    la a1, output
    ecall
    
    li a0, 1                    
    mv a1, t3
    ecall
    
    li a0, 4                    
    la a1, newline
    ecall

    li a0, 10                       
    ecall
    
    
dot_product_recursive:
    beq a2, t0, exit          
    
    addi sp, sp, -12
    sw a0, 8(sp)
    sw a1, 4(sp)
    sw ra, 0(sp)
    
    addi a0, a0, 4                  
    addi a1, a1, 4                  
    addi a2, a2, -1                 
    
    jal dot_product_recursive

    lw t1, 8(sp)
    lw t2, 4(sp)
    lw ra, 0(sp)
    addi sp, sp, 12

    lw t1, 0(t1)
    lw t2, 0(t2)
    
    mul t1, t1, t2
    add a0, a0, t1
   
    jr ra
    
exit:
    lw t1, 0(a0)                    
    lw t2, 0(a1)                    
    mul a0, t1, t2                  
    jr ra