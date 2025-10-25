.data
    name: .asciiz "Name: Mahmoud Ahmed Abdelghani\n\n"
    ID: .asciiz "ID: 20812022100013\n\n"
    Course: .asciiz "Course: CSE321-Computer-Organization\n\n"
.text
    .globl main
main:
    li $v0, 4
    la $a0, name
    syscall
    li $v0, 4
    la $a0, ID
    syscall
    li $v0, 4
    la $a0, Course
    syscall
    li $v0, 10
    syscall