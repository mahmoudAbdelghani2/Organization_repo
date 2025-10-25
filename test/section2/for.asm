.data
    msg     :   .asciiz "Enter a number : \n"
    newLine :   .asciiz "\n"

.text
main:

    li      $v0,    4
    la      $a0,    msg
    syscall

    li      $v0,    5
    syscall
    move    $t1,    $v0

    li      $t0,    1
for:
    bgt     $t0,    $t1,        endFor

    li      $v0,    1
    move    $a0,    $t0
    syscall

    li      $v0,    4
    la      $a0,    newLine
    syscall

    addi    $t0,    $t0,        1
    j for
endFor:

exit:
    li      $v0,    10
    syscall