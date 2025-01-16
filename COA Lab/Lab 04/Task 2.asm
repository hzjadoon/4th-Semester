# Name of Programmer -- Hassan Zaib Jadoon Github: @hzjadoon
# Registration no. -- 22PWCSE2144

# Task 2

.data
newline: .asciiz "\n"

.text
main:
    addi $t0, $0, 60      # $t0 = 60

    srl $a0, $t0, 1       # Shift right by 1
    li $v0, 1
    syscall               # Print result

    li $v0, 4
    la $a0, newline
    syscall

    sll $a0, $t0, 1       # Shift left by 1
    li $v0, 1
    syscall               # Print result

    jr $ra


