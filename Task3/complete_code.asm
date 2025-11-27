.data
A:  .word 4
B:  .word 6

.text

# ===========================
# Function: compute(a, b)
# returns (a + b) * 2
# ===========================
compute:

    addi    $sp,        $sp,        -4
    sw      $ra,        0($sp)

    addi    $sp,        $sp,        -4
    sw      $s0,        0($sp)

    addi    $sp,        $sp,        -4
    sw      $s1,        0($sp)

    addi    $sp,        $sp,        -4
    sw      $s3,        0($sp)

    add  $s0, $a0, $a1      # s0 = a + b
    sll  $v0, $s0, 1        # v0 = s0 * 2


returnCompute:  

    lw      $s3,        0($sp)
    addi    $sp,        $sp,        4


    lw      $s1,        0($sp)
    addi    $sp,        $sp,        4
    
    lw      $s0,        0($sp)
    addi    $sp,        $sp,        4
    
    lw      $ra,        0($sp)
    addi    $sp,        $sp,        4

    jr   $ra


# ===========================
# main function (caller)
# ===========================
main:
    lw   $t0, A
    lw   $t1, B
    li   $s0, 99

    addi    $sp,        $sp,        -4
    sw      $ra,        0($sp)

    addi    $sp,        $sp,        -4
    sw      $t0,        0($sp)

    addi    $sp,        $sp,        -4
    sw      $t1,        0($sp)

    addi    $sp,        $sp,        -4
    sw      $t3,        0($sp)

    move $a0, $t0
    move $a1, $t1
    jal  compute

    move $t3, $v0
    

returnMain:
    lw      $t3,        0($sp)
    addi    $sp,        $sp,        4
    
    lw      $t1,        0($sp)
    addi    $sp,        $sp,        4

    lw      $t0,        0($sp)
    addi    $sp,        $sp,        4
    
    lw      $ra,        0($sp)
    addi    $sp,        $sp,        4

    jr $ra