# Name of Programmer -- Hassan Zaib Jadoon Github: @hzjadoon
# Registration no. -- 22PWCSE2144

#Task 1

.data
prompt1: .asciiz "Enter an integer: "
prompt2: .asciiz "The rightmost digit is: "

.text
    main:
        li $v0, 4                # syscall for print_string
        la $a0, prompt1           # load address of prompt
        syscall

        li $v0, 5                # syscall for read_int
        syscall
        move $t0, $v0            # store the integer in $t0

        li $t1, 10               # load 10 into $t1
        div $t0, $t1             # divide $t0 by 10
        mfhi $t2                 # move the remainder (rightmost digit) into $t2

        li $v0, 4                # syscall for print_string
        la $a0, prompt2         # load address of message
        syscall

        li $v0, 1                # syscall for print_int
        move $a0, $t2            # move the rightmost digit to $a0
        syscall

    fini:
        li $v0, 10               # syscall for exit
        syscall
