count .req x2

mov count, #16
start:
                              // Instructions:    2
                              // Expected cycles: 1
                              // Expected IPC:    2.00
                              //
                              // Cycle bound:     1.0
                              // IPC bound:       2.00
                              //
                              // Wall time:     0.01s
                              // User time:     0.01s
                              //
                              // ----- cycle (expected) ------>
                              // 0                        25
                              // |------------------------|----
        nop                   // *.............................
        add x2, x2, #0        // *.............................

                               // ------ cycle (expected) ------>
                               // 0                        25
                               // |------------------------|-----
        // nop                 // *..............................
        // add x2, x2, #0      // *..............................

        subs count, count, 1
        cbnz count, start
