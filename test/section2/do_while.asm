.data
    msg     :   .asciiz "Enter a number : \n"
    res     :   .asciiz "The ruselt is : \n"
    newLine :   .asciiz "\n"
.text
main:
    move    $t0,    $zero

do:

    li      $v0,    4
    la      $a0,     msg
    syscall

    li      $v0,    5
    syscall
    move    $t1,    $v0

    li      $v0,    4
    la      $a0,     newLine
    syscall

    addu    $t0,    $t0,        $t1

while:

    bne     $t1,    $zero,      do

    li      $v0,    4
    la      $a0,     res
    syscall

    li $v0 , 1
    move $a0 ,$t0
    syscall

exit:
    li      $v0,    10
    syscall