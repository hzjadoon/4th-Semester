#Name of Programmer: Hassan Zaib Jadoon github: hzjadoon
# Registration Number: 22PWCSE2144

.data
    array: .space 16  # Reserve space for an array of 4 words (4 x 4 bytes = 16 bytes)

.text
    main:
        li $v0, 5  # Read the first number
        syscall
        move $t1, $v0

        li $v0, 5  # Read the second number
        syscall
        move $t2, $v0

        li $v0, 5  # Read the third number
        syscall
        move $t3, $v0

        li $v0, 5  # Read the fourth number
        syscall
        move $t4, $v0

        # Sort the numbers
        bgt $t1, $t2, swap_1_2
        bgt $t1, $t3, swap_1_3
        bgt $t1, $t4, swap_1_4
        bgt $t2, $t3, swap_2_3
        bgt $t2, $t4, swap_2_4
        bgt $t3, $t4, swap_3_4

        # Store the sorted numbers in the array
        la $t0, array
        sw $t1, 0($t0)
        sw $t2, 4($t0)
        sw $t3, 8($t0)
        sw $t4, 12($t0)


    swap_1_2:
        move $t5, $t1
        move $t1, $t2
        move $t2, $t5
        bgt $t1, $t3, swap_1_3
        bgt $t1, $t4, swap_1_4
        bgt $t2, $t3, swap_2_3
        bgt $t2, $t4, swap_2_4
        bgt $t3, $t4, swap_3_4

    swap_1_3:
        move $t5, $t1
        move $t1, $t3
        move $t3, $t5
        bgt $t1, $t2, swap_1_2
        bgt $t1, $t4, swap_1_4
        bgt $t2, $t3, swap_2_3
        bgt $t2, $t4, swap_2_4
        bgt $t3, $t4, swap_3_4

    swap_1_4:
        move $t5, $t1
        move $t1, $t4
        move $t4, $t5
        bgt $t1, $t2, swap_1_2
        bgt $t1, $t3, swap_1_3
        bgt $t2, $t3, swap_2_3
        bgt $t2, $t4, swap_2_4
        bgt $t3, $t4, swap_3_4

    swap_2_3:
        move $t5, $t2
        move $t2, $t3
        move $t3, $t5
        bgt $t1, $t2, swap_1_2
        bgt $t1, $t3, swap_1_3


# Print the sorted numbers
        li $v0, 1
        move $a0, $t1
        syscall
        li $v0, 1
        move $a0, $t2
        syscall
        li $v0, 1
        move $a0, $t3
        syscall
        li $v0, 1
        move $a0, $t4
        syscall

        # Exit
        li $v0, 10
        syscall