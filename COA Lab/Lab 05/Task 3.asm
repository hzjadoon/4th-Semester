# Name of Programmer -- Hassan Zaib Jadoon Github: @hzjadoon
# Registration no. -- 22PWCSE2144

#Task 3

.data
prompt: .ascii "Enter an integer...\n"  # Using .ascii without null-termination
.byte 0                                 # Manually add null terminator
message: .asciiz "The rightmost digit is:\n"  # Null-terminated message string
promptA: .word prompt                   # A pointer to the address of prompt

.text
    main:
        lw $a0, promptA($0)       
        li $v0, 4                   
        syscall                      

        li $v0, 5                       
        syscall
        move $t0, $v0            

        li $t1, 10                   
        div $t0, $t1            
        mfhi $t2                     

        addi $a0, $a0, 21      
        li $v0, 4                      
        syscall        

        li $v0, 1                     
        move $a0, $t2                         
	syscall       

    fini:
        li $v0, 10                   
        syscall
