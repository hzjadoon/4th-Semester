# Name of Programmer -- Hassan Zaib Jadoon Github: @hzjadoon
# Registration no. -- 22PWCSE2144

# LabA6

.text
main:    
    addi $t0, $0, 10      # Load value 10 into $t0
    addi $t1, $0, 10      # Load value 10 into $t1
    beq  $t0, $t1, XX     # If $t0 equals $t1, branch to XX
    sub  $t2, $t0, $t1    # Subtract $t1 from $t0, store result in $t2
    j    YY               # Jump to YY
XX: 
    add  $t2, $t0, $t1    # Add $t0 and $t1, store result in $t2
YY:
    addi $v0, $0, 1       # Set $v0 to 1 for print integer syscall
    add  $a0, $0, $t2     # Move value of $t2 to $a0 for printing
    syscall               # Print the result
    jr $ra                # Return to caller


