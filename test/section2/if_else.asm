.data
    prompt: .asciiz "Enter a number: "
    zero : .asciiz "zero.\n"
    positive : .asciiz "positive.\n"
    negative : .asciiz "negative.\n"
.text

main:
    li $v0 , 4
    la $a0 , prompt
    syscall
    li $v0 , 5
    syscall
    move $t0, $v0

if:

  bne $t0 , $zero , elsif
  la $a0 , zero
  j endif

elsif:

  bgtz $t0 , else
  la $a0 , negative
  j endif

else:

  la $a0 , positive

endif:

  li $v0 , 4
  syscall

exit:   
    li $v0, 10
    syscall