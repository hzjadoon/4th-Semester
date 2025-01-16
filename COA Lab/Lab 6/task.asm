#Name of Programmer: Hassan Zaib Jadoon github: hzjadoon
#Registration Number: 22PWCSE2144


.data
array:      .word 10, 20, 30, 40   # Array of integers stored in memory
length:     .word 4                # Length of the array

.text
main:
    la   $t0, array                # Load the address of 'array' into register $t0
    lw   $t1, 0($t0)               # Load the first element of the array into $t1
    lw   $t2, 4($t0)               # Load the second element of the array into $t2
    lw   $t3, 8($t0)               # Load the third element of the array into $t3
    lw   $t4, 12($t0)              # Load the fourth element of the array into $t4

    # You can add code here to use the loaded values for any computations or logic

li $v0,1
move $a0,$t1
syscall

	li $v0,1
move $a0,$t2
syscall

	li $v0,1
move $a0,$t3
syscall

	li $v0,1
move $a0,$t4
syscall


    # Exit program (this may vary depending on your MIPS environment)
    li   $v0, 10                   # Load exit syscall number
    syscall                        # Make syscall to exit