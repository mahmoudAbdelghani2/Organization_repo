####### All steps you need to do it in Main to call a function 

#[1] => arguments registers $a0 - $a3
#    li      $v0,        5
#    move    $a0,        $v0
#    ..
#    ..
#==========================================================================
#[2] => Caller save registers into stack like $ra , $t0 - $t9 ,......
#    addi $sp , $sp , -4
#    sw $ra ,0($sp) => allocate stack
#    ..
#    ..
#==========================================================================
#[3] => Calling Function
#    jal     function
#    do your work in function using $a0 - $a3
#==========================================================================
#[4] => Restore data from stack like $ra , $t0 - $t9 ,......
#    lw $ra ,0($sp) 
#    addi $sp , $sp , 4 => deallocate stack
#    ..
#    ..
#==========================================================================

#[5] => Results in $v0,$v1 => move it to any register to use it
#    move    $t0,        $v0
#    move    $t1,        $v1
#    ..
#    ..
#==========================================================================

####### All steps you need to do it in Function after main calling this function

#[1] => Callee Save registers into stack like $ra , $s0 - $s7 ,......
# => if you don't call another function you don't need to store $ra
# => use arguments $s0 - $s7 normally
#=> you can use $t0 - $t9 without store it
#    addi $sp , $sp , -4
#    sw $ra ,0($sp) => allocate stack
#    ..
#    ..
#==========================================================================
#[2] => Using the Arguments
#    addi $v0 , $a0 , $a1
#    ..
#    ..
#==========================================================================
#[3] => Calling another Function in this function
# => in step [1] you have to store $ra
# => save your arguments $a0 , $a3 in saved registers $s0,$s7
# => Preparing arguments to pass it to the second function you call 
#    jal     function
#    do your work in function and repeat your steps if you need to call another function
#==========================================================================
#[4] => Preparing Return Values
#    move    $v0,        $t0
#    move    $v1,        $t1
#    ..
#    ..
#==========================================================================
#[5] => Restore data from stack like $ra , $s0 - $s7 ,......
#    lw $ra ,0($sp) 
#    addi $sp , $sp , 4 => deallocate stack
#    ..
#    ..
#==========================================================================
