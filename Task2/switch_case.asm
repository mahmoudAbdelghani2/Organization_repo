.data
    prompt : .asciiz "Enter a choice (1-4) : \n"
  first_case : .asciiz "You Chose Case 1\n"
  second_case : .asciiz "You Chose Case 2\n"
  third_case : .asciiz "You Chose Case 3\n"
  fourth_case : .asciiz "You Chose Case 4\n"
  default_case : .asciiz "Invalid Choice\n"
  newLine : .asciiz "\n"
.text

main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5      
    syscall
    move $t0, $v0

    beq $t0, 1, case1
    beq $t0, 2, case2
    beq $t0, 3, case3
    beq $t0, 4, case4
    j default_case
switch:

case1:

    li $v0, 4
    la $a0, first_case
    syscall
    j end_switch

case2:

    li $v0, 4
    la $a0, second_case
    syscall
    j end_switch

case3:

    li $v0, 4
    la $a0, third_case
    syscall
    j end_switch

case4:

    li $v0, 4
    la $a0, fourth_case
    syscall
    j end_switch

default:

    li $v0, 4
    la $a0, default_case
    syscall
    j end_switch

end_switch:
exit:
    li $v0, 10
    syscall