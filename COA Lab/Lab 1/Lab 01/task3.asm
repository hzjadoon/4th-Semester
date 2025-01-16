# Name of the programmer -- Hassan Zaib Jadoon Github: @hzjadoon
.data
a: .asciiz "The Answer is "

.text
main:
  li  $v0, 4   # system call code for print_str
  la  $a0, a    # address of string to print
  syscall          # print the string

  li  $v0, 1       # system call code for print_int
  li  $a0, 5       # integer to print
  syscall          # print 

  li   $v0, 10     # system call code for exit
  syscall           # exit the program