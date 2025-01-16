# Name of Programmer -- Hassan Zaib Jadoon Github: @hzjadoon
# Registration no. -- 22PWCSE2144

# LabA8

.text
main:    
    addi $v0, $0, 1       # Set $v0 to 1 for print integer syscall
    add  $a0, $0, $0      # Initialize $a0 to 0
loop:
    slti $t9, $a0, 5      # Set $t9 to 1 if $a0 < 5
    beq  $t9, $0, fini    # If $t9 is zero, exit loop
    syscall               # Print the current value of $a0
    addi $a0, $a0, 1      # Increment $a0
    j    loop             # Jump back to the beginning of the loop
fini:
    jr $ra                # Return to caller
