# Name of the programmer -- Hassan Zaib Jadoon Github: @hzjadoon
# task2.asm-- A program that computes and prints the sum of two numbers.
# Registers used:
# 	$t0 -used to hold the first number.
# 	$t1 -used to hold the second number.
# 	$t2 -used to hold the sum of the $t1 and $t2.
# 	$v0 -syscall parameter and return value.
# 	$a0 -syscall parameter.
main:
	## Get first number from user, put into $t0.
	li $v0, 5 		# load syscall read_int into $v0.
	syscall 			# make the syscall.
	move $t0, $v0	 # move the number read into $t0.
	
	## Get second number from user, put into $t1.
	li $v0, 5 		# load syscall read_int into $v0.
	syscall 			# make the syscall.
	move $t1, $v0 	# move the number read into $t1.
	add $t2, $t0, $t1 	# compute the sum.
	
	## Print out $t2.
	move $a0, $t2 	# move the number to print into $a0.
	li $v0, 1 		# load syscall print_int into $v0.
	syscall 			# make the syscall.

	li $v0, 10 	# syscall code 10 is for exit.
	syscall 			# make the syscall.
# end of task2.asm
