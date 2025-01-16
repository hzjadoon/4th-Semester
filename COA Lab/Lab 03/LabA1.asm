# Name of Programmer -- Hassan Zaib Jadoon Github: @hzjadoon
# Registration no. -- 22PWCSE2144

# LabA1

.text
main:    
    addi $t0, $0, 60   # t0 = 60
    addi $t1, $0, 7    # t1 = 7
    add  $t2, $t0, $t1 # t2 = t0 + t1
    addi $v0, $0, 1    # Service #1
    add  $a0, $0, $t2  # Print integer
    syscall            # Do print
    jr $ra             # Return



