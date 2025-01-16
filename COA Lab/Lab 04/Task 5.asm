# Name of Programmer -- Hassan Zaib Jadoon Github: @hzjadoon
# Registration no. -- 22PWCSE2144

.data
prompt1: .asciiz "Enter the number: "
prompt2: .asciiz "After clearing bit-10: "
prompt3: .asciiz "Using nor: "
newline: .asciiz "\n"

.text
main:
    
    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0
    
    li $v0, 4
    la $a0, prompt2
    syscall

    # Create mask for clearing bit #10
    lui $t5, 0xffff
    ori $t5, $t5, 0xfbff
    and $t0, $t0, $t5

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 4
    la $a0, prompt3
    syscall

    # Alternative mask generation using `nor`
    li $t6, 1024
    nor $t6, $zero, $t6  # ~1024
    and $t0, $t0, $t6

    li $v0, 1
    move $a0, $t0
    syscall

    jr $ra
