# Name of Programmer -- Hassan Zaib Jadoon Github: @hzjadoon
# Registration no. -- 22PWCSE2144

# Task 6

.data
prompt1: .asciiz "Enter the number: "
prompt2: .asciiz "After flipping bit-10: "

.text
main:

    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5            # Read integer
    syscall
    move $t0, $v0        # Store input in $t0

    li $t1, 1024         # Mask for bit #10
    xor $t0, $t0, $t1    # Flip bit #10
    
    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 1
    move $a0, $t0
    syscall              # Output result

    jr $ra
