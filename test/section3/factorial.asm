.data
enterNum:   .asciiz "Enter a Number : \n"
res:        .asciiz "The Factorial is : \n"
newLine:    .asciiz "\n"

.text
            .globl  main

factFunc:

    li      $t0,        1                   # t0 => conter
    li      $t1,        1                   # t0 => factorial

for:

    bgt     $t0,        $a0,        endFor
    mul     $t1,        $t1,        $t0
    addi    $t0,        $t0,        1
    j       for

endFor:

    move    $v0,        $t1

returnFactFunc:
    jr      $ra

main:
    li      $v0,        4
    la      $a0,        enterNum
    syscall

    li      $v0,        5
    syscall
    move    $a0,        $v0

    addi    $sp,        $sp,        -4
    sw      $ra,        0($sp)

    jal     factFunc

    lw      $ra,        0($sp)
    addi    $sp,        $sp,        4

    move    $s0,        $v0

    li      $v0,        4
    la      $a0,        res
    syscall

    move    $a0,        $s0
    li      $v0,        1
    syscall

    li      $v0,        4
    la      $a0,        newLine
    syscall

returnMain:
    jr      $ra