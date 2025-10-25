.data
    msg: .asciiz "Enter a count of numbers  : \n"
    num: .asciiz "Enter a number  : \n"
    average: .asciiz "The average is:  => "
    newLine: .asciiz "\n"
.text
    .globl  main
main:
    li      $v0,    4
    la      $a0,    msg
    syscall

    li      $v0,    5
    syscall
    move    $t0,    $v0

    li      $t1,    1
    mtc1    $zero,  $f3 
    cvt.s.w $f3,    $f3  
for:

    bgt     $t1,    $t0,        endFor

    li      $v0,    4
    la      $a0,    num
    syscall

    li      $v0,    6
    syscall

    add.s   $f3,    $f3,        $f0
    add     $t1,    $t1,        1

    li      $v0,    4
    la      $a0,    newLine
    syscall

    j       for

endFor:

    mtc1    $t0,  $f5 
    cvt.s.w $f5,    $f5  

    div.s   $f6,    $f3,        $f5

    li      $v0,    4
    la      $a0,    average
    syscall

    mov.s   $f12,   $f6

    li      $v0,    2
    syscall

exit:
    li      $v0,    10
    syscall




