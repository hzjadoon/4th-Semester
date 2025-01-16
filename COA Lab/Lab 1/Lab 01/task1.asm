# Name of the programmer -- Hassan Zaib Jadoon Github: @hzjadoon
# task1.asm -- A program that computes the sum of 1 and 2
# leaving the result in register $t0
# registers used
# t0 - used to hold the first number
# t1 - used to hold the second number
# t2 - used to hold the result
# v0 - syscall parameter
.text

main: 

# SPIM starts exceution at main
li $t0,8 # load 8 into $t0
li $t1,5 # load 5 into $t1
add $t2,$t1,$t0 	# compute the sum of $t0 and $t1 and put it into $t2
li $v0,10 	# syscall code 10 is for exit
syscall 	#make the syscall

#end of add.asm