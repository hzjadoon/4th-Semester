# Name of the programmer -- Hassan Zaib Jadoon Github: @hzjadoon
# task1.asm -- A program that computes the product of 2 numbers taken from user
# leaving the result in register $t2
# and then print the result on console

main:
li $v0, 5 
syscall
move $t0, $v0 

li $v0, 5 
syscall 
move $t1, $v0 
mul $t2, $t0, $t1 

move $a0, $t2 
li $v0, 1 
syscall 

li $v0, 10 
syscall 
