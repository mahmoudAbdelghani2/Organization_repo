.data
enterNum:   .asciiz "Enter a Number : \n"
res:        .asciiz "The Factorial is : \n"
newLine:    .asciiz "\n"

.text
            .globl  main

recursiveFactFunc:
    addi    $sp,                $sp,        -4
    sw      $ra,                0($sp)

    li      $t0,                1

    ble     $a0,                $t0,        fact0_OR_1

    addi    $sp,                $sp,        -4
    sw      $a0,                0($sp)

    addi    $a0,                $a0,-1

    jal recursiveFactFunc

    lw      $a0,                0($sp)
    addi    $sp,                $sp,        4

    mul $v0,$v0,$a0
    j returnRecursiveFactFunc

fact0_OR_1:
    li      $v0,                1
returnRecursiveFactFunc:
    lw      $ra,                0($sp)
    addi    $sp,                $sp,        4
    jr      $ra

main:
    li      $v0,                4
    la      $a0,                enterNum
    syscall

    li      $v0,                5
    syscall
    move    $a0,                $v0

    addi    $sp,                $sp,        -4
    sw      $ra,                0($sp)

    jal     recursiveFactFunc

    lw      $ra,                0($sp)
    addi    $sp,                $sp,        4

    move    $s0,                $v0

    li      $v0,                4
    la      $a0,                res
    syscall

    move    $a0,                $s0
    li      $v0,                1
    syscall

    li      $v0,                4
    la      $a0,                newLine
    syscall

returnMain:
    jr      $ra