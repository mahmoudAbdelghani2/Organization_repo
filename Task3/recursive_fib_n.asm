.data
enterNum:   .asciiz "Enter a Number : \n"
res:        .asciiz "The Fibonacci is : \n"
newLine:    .asciiz "\n"
.text
            .globl  main

fibFunc:
    addi    $sp,            $sp,        -4
    sw      $ra,            0($sp)

    li      $t0,            0
    li      $t1,            1
    li      $t2,            2
    beq     $a0,            $t0,        fib_0
    beq     $a0,            $t1,        fib_1
    beq     $a0,            $t2,        fib_1

    addi    $sp,            $sp,        -4
    sw      $a0,            0($sp)
    addi    $a0,            $a0,        -1

    jal     fibFunc

    lw      $a0,            0($sp)
    addi    $sp,            $sp,        4
    addi    $a0,            $a0,        -2


    addi    $sp,            $sp,        -4
    sw      $v0,            0($sp)

    jal     fibFunc

    lw      $t0,            0($sp)
    addi    $sp,            $sp,        4
    add     $v0,            $v0,        $t0

    j       returnFibFunc

    #================================
fib_0:
    li      $v0,            0
    j       returnFibFunc
fib_1:
    li      $v0,            1
returnFibFunc:
    lw      $ra,            0($sp)
    addi    $sp,            $sp,        4
    jr      $ra

main:
    li      $v0,            4
    la      $a0,            enterNum
    syscall

    li      $v0,            5
    syscall
    move    $a0,            $v0

    addi    $sp,            $sp,        -4
    sw      $ra,            0($sp)

    jal     fibFunc

    lw      $ra,            0($sp)
    addi    $sp,            $sp,        4

    move    $s0,            $v0

    li      $v0,            4
    la      $a0,            res
    syscall

    move    $a0,            $s0
    li      $v0,            1
    syscall

    li      $v0,            4
    la      $a0,            newLine
    syscall

returnMain:
    jr      $ra