.data
newLine:    .asciiz "\n"

.text

main:
    li      $t0,    1
    li      $t1,    11

while:
    beq     $t0,    $t1,        endWhile
    li      $v0,    1
    move    $a0,    $t0
    syscall

    li      $v0,    4
    la      $a0,    newLine
    syscall

    addi    $t0,    $t0,        1
    j       while

endWhile:

exit:
    li      $v0,    10
    syscall