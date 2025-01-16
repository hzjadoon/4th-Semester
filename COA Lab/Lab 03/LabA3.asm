# Name of Programmer -- Hassan Zaib Jadoon Github: @hzjadoon
# Registration no. -- 22PWCSE2144

# LabA3

.text
main:    
    addi $t0, $0, 67     # Load ASCII value 67 ('C') into $t0
    addi $v0, $0, 11     # Set $v0 to 11 for print character syscall
    add  $a0, $0, $t0    # Move value of $t0 to $a0 for printing
    syscall              # Make the syscall to print character
    jr $ra               # Return to caller


