# Name of Programmer -- Hassan Zaib Jadoon Github: @hzjadoon
# Registration no. -- 22PWCSE2144

# LabA9

.text
main:    
    addi $s0, $0, 0       # Initialize $s0 to 0
    addi $v0, $0, 5       # Set $v0 to 5 for read integer syscall
    syscall               # Read integer input into $v0
    move  $t0, $v0        # Copy input value to $t0
    addi $t5, $0, 0       # Initialize loop counter $t5 to 0
loop:
    slt  $t9, $t5, $t0    # Set $t9 to 1 if $t5 < $t0
    beq  $t9, $0, done    # If $t9 is zero, exit loop
    add  $s0, $s0, $t5    # Add $t5 to $s0
    addi $t5, $t5, 1      # Increment $t5
    j    loop             # Jump back to the beginning of the loop
done:
    addi $v0, $0, 1       # Set $v0 to 1 for print integer syscall
    move  $a0, $s0        # Move sum result to $a0 for printing
    syscall               # Print the result
    jr $ra                # Return to caller
