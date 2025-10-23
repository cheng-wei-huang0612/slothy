L_opt_loop_1:
    // load address of M1 and add to base address
    add x6, x0, #0

    // M1[0]
    // j = 0 (a)
    add x7, x4, #0
    lsl x7, x7, #2
    add x7, x6, x7
    ld1 {v15.4S}, [x7]

    // j = 32 (b)
    add x8, x4, #32
    lsl x8, x8, #2
    add x8, x6, x8
    ld1 {v16.4S}, [x8]
L_opt_loop_1_end:
