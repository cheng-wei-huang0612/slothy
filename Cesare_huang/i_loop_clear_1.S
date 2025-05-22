stp x18, x19, [sp, #-16]!
stp x20, x21, [sp, #-16]!
stp x22, x23, [sp, #-16]!
stp x24, x25, [sp, #-16]!
stp x26, x27, [sp, #-16]!
stp x28, x29, [sp, #-16]!
stp d8,d9,[sp,#-16]!
stp d10,d11,[sp,#-16]!
stp d12,d13,[sp,#-16]!
stp d14,d15,[sp,#-16]!
ldp x6, x7, [x1]
ldp x8, x9, [x1, #16]
ldr w10, [x1, #32]
ldp x11, x12, [x2]
ldp x13, x14, [x2, #16]
ldr w15, [x2, #32]
ins v0.d[0], x6
ins v0.d[1], x11
ins v1.d[0], x7
ins v1.d[1], x12
ins v2.d[0], x8
ins v2.d[1], x13
ins v3.d[0], x9
ins v3.d[1], x14
ins v4.d[0], x10
ins v4.d[1], x15
ldp x6, x7, [x5, #0]
ldp x8, x9, [x5, #16]
ubfx x10, x6, #0, #30
ubfx x6, x6, #30, #32
ubfx x11, x7, #0, #30
ubfx x7, x7, #30, #32
ubfx x12, x8, #0, #30
ubfx x8, x8, #30, #32
ubfx x13, x9, #0, #30
ubfx x9, x9, #30, #32
ins v5.s[0], w10
ins v5.s[1], w12
ins v5.s[2], w11
ins v5.s[3], w13
ins v6.s[0], w6
ins v6.s[1], w8
ins v6.s[2], w7
ins v6.s[3], w9
movi v7.2d, #0xffffffff
ushr v8.2d, v7.2d, #2
smull v9.2d,v5.2s,v0.s[0]
smlal2 v9.2d,v5.4s,v0.s[2]
sshr v9.2d, v9.2d, #30
smlal v9.2d,v5.2s,v0.s[1]
