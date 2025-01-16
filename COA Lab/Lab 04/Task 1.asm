# Name of Programmer -- Hassan Zaib Jadoon Github: @hzjadoon
# Registration no. -- 22PWCSE2144

# Task 1

.data
quotient: .asciiz "The quotient is: "
remainder: .asciiz "The remainder is: "
product: .asciiz "The product is: "
newline: .asciiz "\n"
.text
main:
    addi $t0, $0, 60  # $t0 = 60
    addi $t1, $0, 7   # $t1 = 7

    div $t0, $t1
    mflo $a0          # Quotient in $a0
    mfhi $a1          # Remainder in $a1

    li $v0, 1
    syscall           # Print quotient

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 1
    move $a0, $a1
    syscall           # Print remainder

    li $v0, 4
    la $a0, newline
    syscall

    mult $t0, $t1
    mflo $a0          # Lower 32 bits of product
    mfhi $a1          # Upper 32 bits of product

    li $v0, 1
    syscall           # Print lower product bits

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 1
    move $a0, $a1
    syscall           # Print upper product bits

    li $v0, 4
    la $a0, newline
    syscall

    jr $ra
