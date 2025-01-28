# Name of Programmer- Hassan Zaib Jadoon ; GitHub @hzjadoon
.data
fahrenheit: .float 0.0
celsius: .float 0.0
message_f: .asciiz "Enter temperature in Fahrenheit: "
message_c: .asciiz "Temperature in Celsius: "

.text
.globl main

main:
    # Print prompt
    li $v0, 4           # syscall to print string
    la $a0, message_f
    syscall

    # Read Fahrenheit
    li $v0, 6           # syscall to read float
    syscall
    mov.s $f12, $f0     # store the input in $f12

    # Convert Fahrenheit to Celsius
    li.s $f1, 32.0
    sub.s $f12, $f12, $f1  # fahrenheit - 32.0

    li.s $f1, 5.0
    li.s $f2, 9.0
    div.s $f1, $f1, $f2    # 5.0 / 9.0
    mul.s $f12, $f12, $f1  # (fahrenheit - 32.0) * (5.0 / 9.0)
    mov.s $f0, $f12        # store result in $f0

    # Print Celsius
    li $v0, 4           # syscall to print string
    la $a0, message_c
    syscall

    li $v0, 2           # syscall to print float
    mov.s $f12, $f0
    syscall

    # Exit
    li $v0, 10          # syscall to exit
    syscall
