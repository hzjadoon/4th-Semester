# Name of Programmer- Hassan Zaib Jadoon ; GitHub @hzjadoon
.data
message_input: .asciiz "Enter operation (e.g., 5 + 3): "
message_result: .asciiz "Result: "
error_div_zero: .asciiz "Error: Division by zero.\n"

.text
.globl main

main:
    # Prompt for input
    li $v0, 4
    la $a0, message_input
    syscall

    # Read numbers and operator
    li $v0, 5           # Read integer
    syscall
    move $t0, $v0       # num1 = $v0

    li $v0, 12          # Read character
    syscall
    move $t1, $v0       # operator = $v0

    li $v0, 5           # Read integer
    syscall
    move $t2, $v0       # num2 = $v0

    # Perform operation
    beq $t1, 43, add_op    # '+'
    beq $t1, 45, sub_op    # '-'
    beq $t1, 42, mul_op    # '*'
    beq $t1, 47, div_op    # '/'
    j error

add_op:
    add $t3, $t0, $t2
    j print_result

sub_op:
    sub $t3, $t0, $t2
    j print_result

mul_op:
    mul $t3, $t0, $t2
    j print_result

div_op:
    beq $t2, 0, div_error
    div $t3, $t0, $t2
    j print_result

div_error:
    li $v0, 4           # Print error message
    la $a0, error_div_zero
    syscall
    j exit

print_result:
    li $v0, 4           # Print result message
    la $a0, message_result
    syscall

    li $v0, 1           # Print integer result
    move $a0, $t3
    syscall

exit:
    li $v0, 10          # Exit program
    syscall

error:
    li $v0, 10
    syscall
