# Name of Programmer -- Hassan Zaib Jadoon Github: @hzjadoon
# Registration no. -- 22PWCSE2144

# LabA5

.text
main:    
    addi $v0, $0, 5       # Set $v0 to 5 for read integer syscall
    syscall               # Make the syscall to read integer
    add  $t0, $0, $v0     # Move the input value from $v0 to $t0

    addi $t1, $0, 7       # Load value 7 into $t1
    add  $t2, $t0, $t1    # Add $t0 and $t1, store result in $t2
    addi $v0, $0, 1       # Set $v0 to 1 for print integer syscall
    add  $a0, $0, $t2     # Move value of $t2 to $a0 for printing
    syscall               # Print the result
    jr $ra                # Return to caller
