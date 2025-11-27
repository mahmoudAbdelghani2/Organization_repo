.data
firstNum:   .asciiz "Enter First Num : \n"
secondNum:  .asciiz "Enter Second Num : \n"
res:        .asciiz "The result is : \n"
newLine:    .asciiz "\n"

.text
.globl main

addFunc:
    add     $v0,        $a0,        $a1

returnAddFunc:
    jr      $ra

main:
    li      $v0,        4
    la      $a0,        firstNum
    syscall

    li      $v0,        5
    syscall
    move    $t0,        $v0

    li      $v0,        4
    la      $a0,        secondNum
    syscall

    li      $v0,        5
    syscall
    move    $t1,        $v0

    addi    $sp,        $sp,        -4
    sw      $ra,        0($sp)

    move    $a0,        $t0
    move    $a1,        $t1
    jal     addFunc

    lw      $ra,        0($sp)
    addi    $sp,        $sp,        4

    move    $t5,        $v0

    li      $v0,        4
    la      $a0,        res
    syscall
    
    move    $a0,        $t5
    li      $v0,        1
    syscall

    li      $v0,        4
    la      $a0,        newLine
    syscall

returnMain:
    jr      $ra