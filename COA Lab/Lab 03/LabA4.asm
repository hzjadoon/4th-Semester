# Name of Programmer -- Hassan Zaib Jadoon Github: @hzjadoon
# Registration no. -- 22PWCSE2144

# LabA4

.text
main:    
    addi $t0, $0, 60      # Load value 60 into $t0
    addi $t1, $0, 7       # Load value 7 into $t1
    add  $t2, $t0, $t1    # Add $t0 and $t1, store result in $t2
    sub  $t3, $t0, $t1    # Subtract $t1 from $t0, store result in $t3
    addi $v0, $0, 1       # Set $v0 to 1 for print integer syscall
    
    add  $a0, $0, $t2     # Move value of $t2 to $a0 for printing
    syscall               # Print sum

    addi $a0, $0, ' '     # Set $a0 to space character
    addi $v0, $0, 11      # Set $v0 to 11 for print character syscall
    syscall               # Print space

    add  $a0, $0, $t3     # Move value of $t3 to $a0 for printing
    addi $v0, $0, 1       # Set $v0 to 1 for print integer syscall
    syscall               # Print difference

    jr $ra                # Return to caller
