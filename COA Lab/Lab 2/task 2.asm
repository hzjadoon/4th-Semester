# Name of Programmer- Hassan Zaib Jadoon ; GitHub @hzjadoon
#task1.asm -> Program that computes sume of 1 & 2
# Leaving result in Register $t0
# Registers Used
# t0 - used to hold the First Number
# t1 - Used to hold the Second Number
# t2 - used to hold the result
# v0 - syscall parameter
.text
main:
#SPIM starts execution at main.
li $t5, 8 # Load 8 into $t0.
li $t1, 5 # Load 5 into $t1.
add $t2, $t1, $t5 # computer the sum of $t1 and 2, and put it into $t0.
move $a0, $t2
li $v0, 1
syscall #make the syscall.
#End of Add.asm