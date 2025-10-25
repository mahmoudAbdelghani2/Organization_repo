.data
    firstNumPrompt: .asciiz "Enter the first number: \n\n"
    secondNumPrompt: .asciiz "Enter the second number: \n\n"
    resultPrompt: .asciiz "The result is:  => "
.text
    .globl main
main:
    li $v0 , 4
    la $a0 , firstNumPrompt
    syscall

    li $v0 , 5
    syscall
    move $t0 , $v0

    li $v0 , 4
    la $a0 , secondNumPrompt
    syscall

    li $v0 , 5
    syscall
    move $t1 , $v0
    
    li $v0 , 4
    la $a0 , resultPrompt
    syscall

    add $a0,$t0,$t1
    # addu 
    #الفرق بين الاتنين اول واحدة لو الناتج اكبر من اتنين وتلاتين بت هيحصل مشكلة لو اللي تحت يبقي مفيش اي ايرورز هتحصل عادي لو اكبر من اتنين وتلاتين بت
    # هيحسب الناتج غلط عادي بس مش هيعمل اكسبشن عكس الجمع العادي
    li $v0 , 1
    syscall

exit:
    li $v0 , 10
    syscall