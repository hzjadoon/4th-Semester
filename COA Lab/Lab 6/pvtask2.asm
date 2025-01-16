#Name of Programmer: Hassan Zaib Jadoon github: hzjadoon
#Registration Number: 22PWCSE2144

.data
array:      .space 16       # Reserve space for an array of 4 words (4 x 4 bytes = 16 bytes)

.text
main:
    
li   $v0, 5            # Load the address of 'array' into $t0 
syscall
move $v0,$t1

li   $v0, 5           # Load the address of 'array' into $t0 
syscall
move $v0,$t2

li   $v0, 5           # Load the address of 'array' into $t0 
syscall
move $v0,$t3

li   $v0, 5           # Load the address of 'array' into $t0 
syscall
move $v0,$t4



    la   $t0, array         # Load the address of 'array' into $t0
    sw   $t1, 0($t0)        # Store the value of $t1 at the first element of 'array'
    sw   $t2, 4($t0)        # Store the value of $t2 at the second element of 'array'
    sw   $t3, 8($t0)        # Store the value of $t3 at the third element of 'array'
    sw   $t4, 12($t0)       # Store the value of $t4 at the fourth element of 'array'

    # Exit program (this may vary depending on your MIPS environment)
    li   $v0, 10            # Load exit syscall number
    syscall                 # Make syscall to exit