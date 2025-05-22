    // ------- Sub-pipeline A (最終結果 → x4) -------
    ldr  x0, [x7]         // A0  ← *ptr
    add  x0,  x0,  #11    // A1  = A0 + 11
    mul  x1,  x0,  x0     // A2  = (A1)²
    add  x1,  x1,  #37    // A3  = A2 + 37
    lsl  x2,  x1,  #3     // A4  = A3 << 3
    add  x4,  x2,  #123   // A5  → x4   (子流程 A 的輸出)

    // ------- Sub-pipeline B (最終結果 → x5) -------
    // 與 A 完全獨立，但又重用 x0‧x1‧x2 → 形成假依賴
    ldr  x0, [x7, #8]     // B0  ← *(ptr+8)
    add  x0,  x0,  #5     // B1  = B0 + 5
    mul  x1,  x0,  x0     // B2  = (B1)²
    sub  x1,  x1,  #19    // B3  = B2 - 19
    lsl  x2,  x1,  #2     // B4  = B3 << 2
    add  x5,  x2,  #456   // B5  → x5   (子流程 B 的輸出)