# Name of Programmer -- Hassan Zaib Jadoon Github: @hzjadoon
# Registration no. -- 22PWCSE2144

# Task 4

.data
prompt1: .asciiz "Enter the number: "
prompt2: .asciiz "The 10th bit is: "
prompt3: .asciiz "Using masking approach: "
newline: .asciiz "\n"

.text
main:
    
    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5            # Read integer
    syscall
    move $t0, $v0        # Store input in $t0

    li $v0, 4
    la $a0, prompt2
    syscall

    sll $a0, $t0, 21     # Shift left by 21
    srl $a0, $a0, 31     # Shift right by 31
    li $v0, 1
    syscall              # Output bit #10

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 4
    la $a0, prompt3
    syscall

    # Masking approach
    andi $a0, $t0, 1024  # Mask bit #10
    srl $a0, $a0, 10
    li $v0, 1
    syscall              # Output bit #10 with mask

    jr $ra
