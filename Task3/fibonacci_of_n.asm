.data
enterNum:   .asciiz "Enter a Number : \n"
res:        .asciiz "The Fibonacci is : \n"
newLine:    .asciiz "\n"
.text
            .globl  main

fibFunc:
    li      $t0,            0
    li      $t1,            1
    li      $t2,            2
    beq     $a0,            $t0,        fib_0
    beq     $a0,            $t1,        fib_1
    beq     $a0,            $t2,        fib_1

    li      $s0,            3                   #counter
    li      $s1,            1                   #fib(n-2)
    li      $s2,            1                   #fib(n-1)
    li      $s3,            1                   #fib(n)

for:
    bgt     $s0,            $a0,        endFor

    add     $s3,            $s2,        $s1
    add     $s1,            $s2,        $zero
    add     $s2,            $s3,        $zero
    addi    $s0,            $s0,        1
    j       for

endFor:
    move    $v0,            $s3
    j       returnFibFunc


    #================================
fib_0:
    li      $v0,            0
    j       returnFibFunc
fib_1:
    li      $v0,            1
returnFibFunc:
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