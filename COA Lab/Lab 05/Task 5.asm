# Name of Programmer -- Hassan Zaib Jadoon Github: @hzjadoon
# Registration no. -- 22PWCSE2144

#Task 5

.data
entry: .word 5, 12, 7, 2    # Define the array of words
       .word 0              # Null terminator for the array
entryA: .word entry         # Pointer to the address of entry

.text
main:
    add $s0, $ra, $0         # Save return address in $s0
    lw $a0, entryA($0)       # Load address of entry into $a0

    jal length               # Jump to length subroutine and link
    move $a0, $v0            # Move length of array into $a0 for printing
    li $v0, 1                
    syscall             

    add $ra, $s0, $0         # Restore the return address from $s0
fini: 
    jr $ra                  
length:
    add $v0, $0, $0          # Initialize length counter in $v0 to 0
length_loop:
    lw $t0, 0($a0)           # Load word from array into $t0
    beq $t0, $0, length_end  # If word is zero, end loop
    addi $v0, $v0, 1         # Increment length counter
    addi $a0, $a0, 4         # Move to next word (4 bytes)
    j length_loop            # Repeat loop
length_end:
    jr $ra                   # Return to caller with length in $v0
