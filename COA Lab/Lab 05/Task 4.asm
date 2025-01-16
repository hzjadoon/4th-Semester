# Name of Programmer -- Hassan Zaib Jadoon Github: @hzjadoon
# Registration no. -- 22PWCSE2144

#Task 4

.data
entry: .ascii "Ahsan Raza"    
.byte 0                           
entryA: .word entry               
.text
main:                              
    add $s0, $ra, $0              
    lw $a0, entryA($0)             

    jal length       
    move $a0, $v0     
    li $v0, 1                    
    syscall                       

    add $ra, $s0, $0               # Restore the return address from $s0
fini: 
    jr $ra                         # Return from main
length:
    add $v0, $0, $0                # Initialize length counter in $v0 to 0
length_loop:
    lb $t0, 0($a0)                 # Load byte from string into $t0
    beq $t0, $0, length_end        # If byte is null (0), end loop
    addi $v0, $v0, 1               # Increment length counter
    addi $a0, $a0, 1               # Move to next byte in string
    j length_loop                  # Repeat loop
length_end:
    jr $ra                         # Return to caller with length in $v0
