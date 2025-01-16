# Name of Programmer -- Hassan Zaib Jadoon Github: @hzjadoon
# Registration no. -- 22PWCSE2144

# Task 3

.data
prompt1: .asciiz "Enter the number: "
prompt2: .asciiz "The 18x is: "
.text
main:
    
    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5            # Read integer x
    syscall
    move $t0, $v0        # Store x in $t0

    li $v0, 4
    la $a0, prompt2
    syscall

    sll $t1, $t0, 4      # x * 16
    add $t2, $t1, $t0    # x * 16 + x
    add $t3, $t2, $t0    # (x * 16 + x) + x = 18x

    

    li $v0, 1
    move $a0, $t3
    syscall              # Print 18x

    jr $ra
