.data
    firstNum: .asciiz "Enter the first number: \n"
    secondNum: .asciiz "Enter the second number: \n"
    thirdNum: .asciiz "Enter the third number: \n"
    fourthNum: .asciiz "Enter the fourth number: \n"
    average: .asciiz "The average is:  => "
    newLine: .asciiz "\n"
.text
    .globl main
main:
    li $v0 , 4
    la $a0 , firstNum
    syscall

    li $v0 , 6
    syscall
    mov.s $f0 , $f0

    li $v0 , 4
    la $a0 , secondNum
    syscall

    li $v0 , 6
    syscall
    mov.s $f1 , $f0

    li $v0 , 4
    la $a0 , thirdNum
    syscall

    li $v0 , 6
    syscall
    mov.s $f2 , $f0

    li $v0 , 4
    la $a0 , fourthNum
    syscall

    li $v0 , 6
    syscall
    move $t3 , $v0
    
    li $v0 , 4
    la $a0 , average
    syscall

    #----------------------------------------------------------------------

    add.s $f4,$f0,$f1
    add.s $f4,$f4,$f2
    add.s $f4,$f4,$f3


    li.s $f5,4.0
    div.s $f6,$f4,$f5

    mov.s $f12,$f6
    li $v0,2
    syscall

    li $v0, 4
    la $a0, newLine
    syscall
    

exit:
    li $v0 , 10
    syscall




    