# Name of Programmer- Hassan Zaib Jadoon ; GitHub @hzjadoon
.data
unit1: .float 0.0
gpa1: .float 0.0
unit2: .float 0.0
gpa2: .float 0.0
unit3: .float 0.0
gpa3: .float 0.0
unit4: .float 0.0
gpa4: .float 0.0
qGPA: .float 0.0 

# ASCII messages
prompt_unit1: .asciiz "Enter units for Course 1: "
prompt_gpa1: .asciiz "Enter GPA for Course 1: "
prompt_unit2: .asciiz "Enter units for Course 2: "
prompt_gpa2: .asciiz "Enter GPA for Course 2: "
prompt_unit3: .asciiz "Enter units for Course 3: "
prompt_gpa3: .asciiz "Enter GPA for Course 3: "
prompt_unit4: .asciiz "Enter units for Course 4: "
prompt_gpa4: .asciiz "Enter GPA for Course 4: "
output_qgpa: .asciiz "Your calculated QGPA is: "

.text
.globl main

main:
    # Get input for Course 1
    li $v0, 4       # syscall for print string
    la $a0, prompt_unit1
    syscall

    li $v0, 7       # syscall for read float
    syscall
    s.s $f0, unit1   # store unit1

    li $v0, 4       # syscall for print string
    la $a0, prompt_gpa1
    syscall

    li $v0, 7       # syscall for read float
    syscall
    s.s $f0, gpa1    # store gpa1

    # Get input for Course 2
    li $v0, 4       # syscall for print string
    la $a0, prompt_unit2
    syscall

    li $v0, 7       # syscall for read float
    syscall
    s.s $f0, unit2   # store unit2

    li $v0, 4       # syscall for print string
    la $a0, prompt_gpa2
    syscall

    li $v0, 7       # syscall for read float
    syscall
    s.s $f0, gpa2    # store gpa2

    # Get input for Course 3
    li $v0, 4       # syscall for print string
    la $a0, prompt_unit3
    syscall

    li $v0, 7       # syscall for read float
    syscall
    s.s $f0, unit3   # store unit3

    li $v0, 4       # syscall for print string
    la $a0, prompt_gpa3
    syscall

    li $v0, 7       # syscall for read float
    syscall
    s.s $f0, gpa3    # store gpa3

    # Get input for Course 4
    li $v0, 4       # syscall for print string
    la $a0, prompt_unit4
    syscall

    li $v0, 7       # syscall for read float
    syscall
    s.s $f0, unit4   # store unit4

    li $v0, 4       # syscall for print string
    la $a0, prompt_gpa4
    syscall

    li $v0, 7       # syscall for read float
    syscall
    s.s $f0, gpa4    # store gpa4

    # Call Compute GPA function
    jal ComputeGPA

    # Print the calculated QGPA
    li $v0, 4       # syscall for print string
    la $a0, output_qgpa
    syscall

    li $v0, 2       # syscall for print float
    mov.s $f12, $f0  # move QGPA to $f12
    syscall

    # Exit the program
    li $v0, 10      # syscall for exit
    syscall

ComputeGPA:
    # Load units and GPAs from memory
    l.s $f1, unit1
    l.s $f2, gpa1
    l.s $f3, unit2
    l.s $f4, gpa2
    l.s $f5, unit3
    l.s $f6, gpa3
    l.s $f7, unit4
    l.s $f8, gpa4

    # Calculate course products
    mul.s $f9, $f1, $f2  # Course 1 product
    mul.s $f10, $f3, $f4 # Course 2 product
    mul.s $f11, $f5, $f6 # Course 3 product
    mul.s $f12, $f7, $f8 # Course 4 product

    # Sum of course products
    add.s $f13, $f9, $f10
    add.s $f14, $f11, $f12
    add.s $f15, $f13, $f14

    # Sum of units
    add.s $f16, $f1, $f3
    add.s $f17, $f5, $f7
    add.s $f18, $f16, $f17

    # Calculate QGPA
    div.s $f0, $f15, $f18

    jr $ra  # Return to main
