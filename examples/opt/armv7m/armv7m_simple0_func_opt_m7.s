.syntax unified
// .cpu cortex-m4  // llvm-mc does not like this...
.thumb // unicorn seems to get confused by this...

.align 2
.global my_func
.type my_func, %function
my_func:
  push {r4-r11, lr}

        start:
                                     // Instructions:    6
                                     // Expected cycles: 5
                                     // Expected IPC:    1.20
                                     //
                                     // Cycle bound:     5.0
                                     // IPC bound:       1.20
                                     //
                                     // Wall time:     0.01s
                                     // User time:     0.01s
                                     //
                                     // ----- cycle (expected) ------>
                                     // 0                        25
                                     // |------------------------|----
        ldr r11, [r0, #4]            // *.............................
        add r11, r2, r11             // .*............................
        eor.w r4, r11, r3            // ..*...........................
        smlabt r4, r2, r2, r4        // ..*...........................
        asrs r3, r4, #1              // ....*.........................
        str r3, [r0, #4]             // ....*.........................

                                      // ------ cycle (expected) ------>
                                      // 0                        25
                                      // |------------------------|-----
        // ldr r8, [r0, #4]           // *..............................
        // add r8, r2, r8             // .*.............................
        // eor.w r8, r8, r3           // ..*............................
        // smlabt r3, r2, r2, r8      // ..*............................
        // asrs r3, r3, #1            // ....*..........................
        // str r3, [r0, #4]           // ....*..........................

        end:


  pop {r4-r11, pc}
