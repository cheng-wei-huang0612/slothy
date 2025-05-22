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
smlal2 v9.2d,v5.4s,v0.s[3]
smlal v9.2d,v6.2s,v0.s[0]
smlal2 v9.2d,v6.4s,v0.s[2]
sshr v9.2d, v9.2d, #30
smlal v9.2d,v5.2s,v1.s[0]
smlal2 v9.2d,v5.4s,v1.s[2]
smlal v9.2d,v6.2s,v0.s[1]
smlal2 v9.2d,v6.4s,v0.s[3]
and v0.16b, v9.16b, v8.16b
sshr v9.2d, v9.2d, #30
mov v0.16b, v0.16b
smlal v9.2d,v5.2s,v1.s[1]
smlal2 v9.2d,v5.4s,v1.s[3]
smlal v9.2d,v6.2s,v1.s[0]
smlal2 v9.2d,v6.4s,v1.s[2]
and v10.16b, v9.16b, v8.16b
sshr v9.2d, v9.2d, #30
shl v10.2d, v10.2d, #32
orr v0.16b, v0.16b, v10.16b
smlal v9.2d,v5.2s,v2.s[0]
smlal2 v9.2d,v5.4s,v2.s[2]
smlal v9.2d,v6.2s,v1.s[1]
smlal2 v9.2d,v6.4s,v1.s[3]
and v1.16b, v9.16b, v8.16b
sshr v9.2d, v9.2d, #30
mov v1.16b, v1.16b
smlal v9.2d,v5.2s,v2.s[1]
smlal2 v9.2d,v5.4s,v2.s[3]
smlal v9.2d,v6.2s,v2.s[0]
smlal2 v9.2d,v6.4s,v2.s[2]
and v10.16b, v9.16b, v8.16b
sshr v9.2d, v9.2d, #30
shl v10.2d, v10.2d, #32
orr v1.16b, v1.16b, v10.16b
smlal v9.2d,v5.2s,v3.s[0]
smlal2 v9.2d,v5.4s,v3.s[2]
smlal v9.2d,v6.2s,v2.s[1]
smlal2 v9.2d,v6.4s,v2.s[3]
and v2.16b, v9.16b, v8.16b
sshr v9.2d, v9.2d, #30
mov v2.16b, v2.16b
smlal v9.2d,v5.2s,v3.s[1]
smlal2 v9.2d,v5.4s,v3.s[3]
smlal v9.2d,v6.2s,v3.s[0]
smlal2 v9.2d,v6.4s,v3.s[2]
and v10.16b, v9.16b, v8.16b
sshr v9.2d, v9.2d, #30
shl v10.2d, v10.2d, #32
orr v2.16b, v2.16b, v10.16b
smlal v9.2d,v5.2s,v4.s[0]
smlal2 v9.2d,v5.4s,v4.s[2]
smlal v9.2d,v6.2s,v3.s[1]
smlal2 v9.2d,v6.4s,v3.s[3]
and v3.16b, v9.16b, v8.16b
sshr v9.2d, v9.2d, #30
mov v3.16b, v3.16b
smlal v9.2d,v6.2s,v4.s[0]
smlal2 v9.2d,v6.4s,v4.s[2]
and v4.16b, v9.16b, v8.16b
sshr v9.2d, v9.2d, #30
shl v4.2d, v4.2d, #32
orr v3.16b, v3.16b, v4.16b
mov v4.16b, v9.16b
zip1 v9.2d, v0.2d, v1.2d
zip2 v0.2d, v0.2d, v1.2d
zip1 v1.2d, v2.2d, v3.2d
zip2 v2.2d, v2.2d, v3.2d
stp q9, q1, [x1]
stp q0, q2, [x2]
umov x6, v4.d[0]
str w6, [x1, #32]
umov x6, v4.d[1]
str w6, [x2, #32]
movi v8.2d, #0xffffffff
sshr v0.2d, v8.2d, #2
mov x6, #0
movk x6, #51739
movk x6, #10347,lsl #16
dup v1.4s, w6
mov x6, #19
dup v2.4s, w6
ldp x6, x7, [x3]
ldp x8, x9, [x3, #16]
ldr w10, [x3, #32]
ldp x11, x12, [x4]
ldp x13, x14, [x4, #16]
ldr w15, [x4, #32]
ins v3.d[0], x6
ins v3.d[1], x11
ins v4.d[0], x7
ins v4.d[1], x12
ins v8.d[0], x8
ins v8.d[1], x13
ins v9.d[0], x9
ins v9.d[1], x14
ins v10.d[0], x10
ins v10.d[1], x15
smull v11.2d,v5.2s,v3.s[0]
smlal2 v11.2d,v5.4s,v3.s[2]
mul v12.4s,v11.4s,v1.4s
and v12.16b, v12.16b, v0.16b
uzp1 v12.4s, v12.4s, v12.4s
smlsl v11.2d,v12.2s,v2.2s
sshll v12.2d,v12.2s,15
sshr v11.2d, v11.2d, #30
smlal v11.2d,v5.2s,v3.s[1]
smlal2 v11.2d,v5.4s,v3.s[3]
smlal v11.2d,v6.2s,v3.s[0]
smlal2 v11.2d,v6.4s,v3.s[2]
mul v1.4s,v11.4s,v1.4s
and v1.16b, v1.16b, v0.16b
uzp1 v1.4s, v1.4s, v1.4s
smlsl v11.2d,v1.2s,v2.2s
sshll v1.2d,v1.2s,15
sshr v11.2d, v11.2d, #30
smlal v11.2d,v5.2s,v4.s[0]
smlal2 v11.2d,v5.4s,v4.s[2]
smlal v11.2d,v6.2s,v3.s[1]
smlal2 v11.2d,v6.4s,v3.s[3]
and v3.16b, v11.16b, v0.16b
sshr v11.2d, v11.2d, #30
smlal v11.2d,v5.2s,v4.s[1]
smlal2 v11.2d,v5.4s,v4.s[3]
smlal v11.2d,v6.2s,v4.s[0]
smlal2 v11.2d,v6.4s,v4.s[2]
and v13.16b, v11.16b, v0.16b
sshr v11.2d, v11.2d, #30
shl v13.2d, v13.2d, #32
orr v3.16b, v3.16b, v13.16b
smlal v11.2d,v5.2s,v8.s[0]
smlal2 v11.2d,v5.4s,v8.s[2]
smlal v11.2d,v6.2s,v4.s[1]
smlal2 v11.2d,v6.4s,v4.s[3]
and v4.16b, v11.16b, v0.16b
sshr v11.2d, v11.2d, #30
smlal v11.2d,v5.2s,v8.s[1]
smlal2 v11.2d,v5.4s,v8.s[3]
smlal v11.2d,v6.2s,v8.s[0]
smlal2 v11.2d,v6.4s,v8.s[2]
and v13.16b, v11.16b, v0.16b
sshr v11.2d, v11.2d, #30
shl v13.2d, v13.2d, #32
orr v4.16b, v4.16b, v13.16b
smlal v11.2d,v5.2s,v9.s[0]
smlal2 v11.2d,v5.4s,v9.s[2]
smlal v11.2d,v6.2s,v8.s[1]
smlal2 v11.2d,v6.4s,v8.s[3]
and v8.16b, v11.16b, v0.16b
sshr v11.2d, v11.2d, #30
smlal v11.2d,v5.2s,v9.s[1]
smlal2 v11.2d,v5.4s,v9.s[3]
smlal v11.2d,v6.2s,v9.s[0]
smlal2 v11.2d,v6.4s,v9.s[2]
and v13.16b, v11.16b, v0.16b
sshr v11.2d, v11.2d, #30
shl v13.2d, v13.2d, #32
orr v8.16b, v8.16b, v13.16b
smlal v11.2d,v5.2s,v10.s[0]
smlal2 v11.2d,v5.4s,v10.s[2]
smlal v11.2d,v6.2s,v9.s[1]
smlal2 v11.2d,v6.4s,v9.s[3]
add v11.2d, v11.2d, v12.2d
and v5.16b, v11.16b, v0.16b
sshr v9.2d, v11.2d, #30
smlal v9.2d,v6.2s,v10.s[0]
smlal2 v9.2d,v6.4s,v10.s[2]
add v9.2d, v9.2d, v1.2d
and v1.16b, v9.16b, v0.16b
shl v1.2d, v1.2d, #32
orr v5.16b, v5.16b, v1.16b
sshr v1.2d, v9.2d, #30
sshr v6.2d, v0.2d, #15
sshr v6.2d, v0.2d, #15
movi v7.2d, #0xffffffff
sshr v0.2d, v1.2d, #15
and v1.16b, v1.16b, v6.16b
mul v0.4s,v2.4s,v0.4s
and v0.16b, v0.16b, v7.16b
add v3.4s, v3.4s, v0.4s
zip1 v0.2d, v3.2d, v4.2d
zip2 v2.2d, v3.2d, v4.2d
zip1 v3.2d, v8.2d, v5.2d
zip2 v4.2d, v8.2d, v5.2d
stp q0, q3, [x3]
stp q2, q4, [x4]
umov x6, v1.d[0]
str w6, [x3, #32]
umov x3, v1.d[1]
str w3, [x4, #32]
ldr w3, [x1, 4]
ldr w1, [x1]
ldr w4, [x2, 4]
ldr w2, [x2]
add x1,x1,x3,lsl #30
add x2,x2,x4,lsl #30
ldr x3, [x0]
mov x4, #1
lsl x4, x4, #41
mov x6, #1
lsl x6, x6, #62
and x7, x1, #1048575
and x8, x2, #1048575
sub x7,x7,x4
sub x8,x8,x6
and x9, x8, #1
sub x10,x8,x7
madd x9, x9, x7, x8
sub x11,x3,#1
tst x11, x8, ror #1
csneg x3, x11, x3, pl
csel x7, x7, x8, pl
csel x8, x9, x10, pl
asr x8, x8, #1
and x9, x8, #1
sub x10,x8,x7
madd x9, x9, x7, x8
sub x11,x3,#1
tst x11, x8, ror #1
csneg x3, x11, x3, pl
csel x7, x7, x8, pl
csel x8, x9, x10, pl
asr x8, x8, #1
and x9, x8, #1
sub x10,x8,x7
madd x9, x9, x7, x8
sub x11,x3,#1
tst x11, x8, ror #1
csneg x3, x11, x3, pl
csel x7, x7, x8, pl
csel x8, x9, x10, pl
asr x8, x8, #1
and x9, x8, #1
sub x10,x8,x7
madd x9, x9, x7, x8
sub x11,x3,#1
tst x11, x8, ror #1
csneg x3, x11, x3, pl
csel x7, x7, x8, pl
csel x8, x9, x10, pl
asr x8, x8, #1
and x9, x8, #1
sub x10,x8,x7
madd x9, x9, x7, x8
sub x11,x3,#1
tst x11, x8, ror #1
csneg x3, x11, x3, pl
csel x7, x7, x8, pl
csel x8, x9, x10, pl
asr x8, x8, #1
and x9, x8, #1
sub x10,x8,x7
madd x9, x9, x7, x8
sub x11,x3,#1
tst x11, x8, ror #1
csneg x3, x11, x3, pl
csel x7, x7, x8, pl
csel x8, x9, x10, pl
asr x8, x8, #1
and x9, x8, #1
sub x10,x8,x7
madd x9, x9, x7, x8
sub x11,x3,#1
tst x11, x8, ror #1
csneg x3, x11, x3, pl
csel x7, x7, x8, pl
csel x8, x9, x10, pl
asr x8, x8, #1
and x9, x8, #1
sub x10,x8,x7
madd x9, x9, x7, x8
sub x11,x3,#1
tst x11, x8, ror #1
csneg x3, x11, x3, pl
csel x7, x7, x8, pl
csel x8, x9, x10, pl
asr x8, x8, #1
and x9, x8, #1
sub x10,x8,x7
madd x9, x9, x7, x8
sub x11,x3,#1
tst x11, x8, ror #1
csneg x3, x11, x3, pl
csel x7, x7, x8, pl
csel x8, x9, x10, pl
asr x8, x8, #1
and x9, x8, #1
sub x10,x8,x7
madd x9, x9, x7, x8
sub x11,x3,#1
tst x11, x8, ror #1
csneg x3, x11, x3, pl
csel x7, x7, x8, pl
csel x8, x9, x10, pl
asr x8, x8, #1
and x9, x8, #1
sub x10,x8,x7
madd x9, x9, x7, x8
sub x11,x3,#1
tst x11, x8, ror #1
csneg x3, x11, x3, pl
csel x7, x7, x8, pl
csel x8, x9, x10, pl
asr x8, x8, #1
and x9, x8, #1
sub x10,x8,x7
madd x9, x9, x7, x8
sub x11,x3,#1
tst x11, x8, ror #1
csneg x3, x11, x3, pl
csel x7, x7, x8, pl
csel x8, x9, x10, pl
asr x8, x8, #1
and x9, x8, #1
sub x10,x8,x7
madd x9, x9, x7, x8
sub x11,x3,#1
tst x11, x8, ror #1
csneg x3, x11, x3, pl
csel x7, x7, x8, pl
csel x8, x9, x10, pl
asr x8, x8, #1
and x9, x8, #1
sub x10,x8,x7
madd x9, x9, x7, x8
sub x11,x3,#1
tst x11, x8, ror #1
csneg x3, x11, x3, pl
csel x7, x7, x8, pl
csel x8, x9, x10, pl
asr x8, x8, #1
and x9, x8, #1
sub x10,x8,x7
madd x9, x9, x7, x8
sub x11,x3,#1
tst x11, x8, ror #1
csneg x3, x11, x3, pl
csel x7, x7, x8, pl
csel x8, x9, x10, pl
asr x8, x8, #1
and x9, x8, #1
sub x10,x8,x7
madd x9, x9, x7, x8
sub x11,x3,#1
tst x11, x8, ror #1
csneg x3, x11, x3, pl
csel x7, x7, x8, pl
csel x8, x9, x10, pl
asr x8, x8, #1
and x9, x8, #1
sub x10,x8,x7
madd x9, x9, x7, x8
sub x11,x3,#1
tst x11, x8, ror #1
csneg x3, x11, x3, pl
csel x7, x7, x8, pl
csel x8, x9, x10, pl
asr x8, x8, #1
and x9, x8, #1
sub x10,x8,x7
madd x9, x9, x7, x8
sub x11,x3,#1
tst x11, x8, ror #1
csneg x3, x11, x3, pl
csel x7, x7, x8, pl
csel x8, x9, x10, pl
asr x8, x8, #1
and x9, x8, #1
sub x10,x8,x7
madd x9, x9, x7, x8
sub x11,x3,#1
tst x11, x8, ror #1
csneg x3, x11, x3, pl
csel x7, x7, x8, pl
csel x8, x9, x10, pl
asr x8, x8, #1
and x9, x8, #1
sub x10,x8,x7
madd x9, x9, x7, x8
sub x11,x3,#1
tst x11, x8, ror #1
csneg x3, x11, x3, pl
csel x7, x7, x8, pl
csel x8, x9, x10, pl
asr x8, x8, #1
mov x9,x7
add x9,x9,#1048576
add x9,x9,x4
asr x9, x9, #42
add x7,x7,#1048576
lsl x7, x7, #22
asr x7, x7, #43
mov x10,x8
add x10,x10,#1048576
add x10,x10,x4
asr x10, x10, #42
add x8,x8,#1048576
lsl x8, x8, #22
asr x8, x8, #43
mul x11,x7,x1
smulh x12, x7, x1
mul x13,x9,x2
adds x11, x11, x13
smulh x13, x9, x2
adc x12,x12,x13
lsr x11, x11, #20
lsl x12, x12, #44
orr x11, x11, x12
mul x12,x8,x1
smulh x1, x8, x1
mul x13,x10,x2
adds x12, x12, x13
smulh x2, x10, x2
adc x1,x1,x2
lsr x2, x12, #20
lsl x1, x1, #44
orr x1, x2, x1
mov x2,x11
and x11, x2, #1048575
and x12, x1, #1048575
sub x11,x11,x4
sub x12,x12,x6
and x13, x12, #1
sub x14,x12,x11
madd x13, x13, x11, x12
sub x15,x3,#1
tst x15, x12, ror #1
csneg x3, x15, x3, pl
csel x11, x11, x12, pl
csel x12, x13, x14, pl
asr x12, x12, #1
and x13, x12, #1
sub x14,x12,x11
madd x13, x13, x11, x12
sub x15,x3,#1
tst x15, x12, ror #1
csneg x3, x15, x3, pl
csel x11, x11, x12, pl
csel x12, x13, x14, pl
asr x12, x12, #1
and x13, x12, #1
sub x14,x12,x11
madd x13, x13, x11, x12
sub x15,x3,#1
tst x15, x12, ror #1
csneg x3, x15, x3, pl
csel x11, x11, x12, pl
csel x12, x13, x14, pl
asr x12, x12, #1
and x13, x12, #1
sub x14,x12,x11
madd x13, x13, x11, x12
sub x15,x3,#1
tst x15, x12, ror #1
csneg x3, x15, x3, pl
csel x11, x11, x12, pl
csel x12, x13, x14, pl
asr x12, x12, #1
and x13, x12, #1
sub x14,x12,x11
madd x13, x13, x11, x12
sub x15,x3,#1
tst x15, x12, ror #1
csneg x3, x15, x3, pl
csel x11, x11, x12, pl
csel x12, x13, x14, pl
asr x12, x12, #1
and x13, x12, #1
sub x14,x12,x11
madd x13, x13, x11, x12
sub x15,x3,#1
tst x15, x12, ror #1
csneg x3, x15, x3, pl
csel x11, x11, x12, pl
csel x12, x13, x14, pl
asr x12, x12, #1
and x13, x12, #1
sub x14,x12,x11
madd x13, x13, x11, x12
sub x15,x3,#1
tst x15, x12, ror #1
csneg x3, x15, x3, pl
csel x11, x11, x12, pl
csel x12, x13, x14, pl
asr x12, x12, #1
and x13, x12, #1
sub x14,x12,x11
madd x13, x13, x11, x12
sub x15,x3,#1
tst x15, x12, ror #1
csneg x3, x15, x3, pl
csel x11, x11, x12, pl
csel x12, x13, x14, pl
asr x12, x12, #1
and x13, x12, #1
sub x14,x12,x11
madd x13, x13, x11, x12
sub x15,x3,#1
tst x15, x12, ror #1
csneg x3, x15, x3, pl
csel x11, x11, x12, pl
csel x12, x13, x14, pl
asr x12, x12, #1
and x13, x12, #1
sub x14,x12,x11
madd x13, x13, x11, x12
sub x15,x3,#1
tst x15, x12, ror #1
csneg x3, x15, x3, pl
csel x11, x11, x12, pl
csel x12, x13, x14, pl
asr x12, x12, #1
and x13, x12, #1
sub x14,x12,x11
madd x13, x13, x11, x12
sub x15,x3,#1
tst x15, x12, ror #1
csneg x3, x15, x3, pl
csel x11, x11, x12, pl
csel x12, x13, x14, pl
asr x12, x12, #1
and x13, x12, #1
sub x14,x12,x11
madd x13, x13, x11, x12
sub x15,x3,#1
tst x15, x12, ror #1
csneg x3, x15, x3, pl
csel x11, x11, x12, pl
csel x12, x13, x14, pl
asr x12, x12, #1
and x13, x12, #1
sub x14,x12,x11
madd x13, x13, x11, x12
sub x15,x3,#1
tst x15, x12, ror #1
csneg x3, x15, x3, pl
csel x11, x11, x12, pl
csel x12, x13, x14, pl
asr x12, x12, #1
and x13, x12, #1
sub x14,x12,x11
madd x13, x13, x11, x12
sub x15,x3,#1
tst x15, x12, ror #1
csneg x3, x15, x3, pl
csel x11, x11, x12, pl
csel x12, x13, x14, pl
asr x12, x12, #1
and x13, x12, #1
sub x14,x12,x11
madd x13, x13, x11, x12
sub x15,x3,#1
tst x15, x12, ror #1
csneg x3, x15, x3, pl
csel x11, x11, x12, pl
csel x12, x13, x14, pl
asr x12, x12, #1
and x13, x12, #1
sub x14,x12,x11
madd x13, x13, x11, x12
sub x15,x3,#1
tst x15, x12, ror #1
csneg x3, x15, x3, pl
csel x11, x11, x12, pl
csel x12, x13, x14, pl
asr x12, x12, #1
and x13, x12, #1
sub x14,x12,x11
madd x13, x13, x11, x12
sub x15,x3,#1
tst x15, x12, ror #1
csneg x3, x15, x3, pl
csel x11, x11, x12, pl
csel x12, x13, x14, pl
asr x12, x12, #1
and x13, x12, #1
sub x14,x12,x11
madd x13, x13, x11, x12
sub x15,x3,#1
tst x15, x12, ror #1
csneg x3, x15, x3, pl
csel x11, x11, x12, pl
csel x12, x13, x14, pl
asr x12, x12, #1
and x13, x12, #1
sub x14,x12,x11
madd x13, x13, x11, x12
sub x15,x3,#1
tst x15, x12, ror #1
csneg x3, x15, x3, pl
csel x11, x11, x12, pl
csel x12, x13, x14, pl
asr x12, x12, #1
and x13, x12, #1
sub x14,x12,x11
madd x13, x13, x11, x12
sub x15,x3,#1
tst x15, x12, ror #1
csneg x3, x15, x3, pl
csel x11, x11, x12, pl
csel x12, x13, x14, pl
asr x12, x12, #1
mov x13,x11
add x13,x13,#1048576
add x13,x13,x4
asr x13, x13, #42
add x11,x11,#1048576
lsl x11, x11, #22
asr x11, x11, #43
mov x14,x12
add x14,x14,#1048576
add x14,x14,x4
asr x14, x14, #42
add x12,x12,#1048576
lsl x12, x12, #22
asr x12, x12, #43
mul x15,x11,x2
smulh x16, x11, x2
mul x17,x13,x1
adds x15, x15, x17
smulh x17, x13, x1
adc x16,x16,x17
lsr x15, x15, #20
lsl x16, x16, #44
orr x15, x15, x16
mul x16,x12,x2
smulh x2, x12, x2
mul x17,x14,x1
adds x16, x16, x17
smulh x1, x14, x1
adc x1,x2,x1
lsr x2, x16, #20
lsl x1, x1, #44
orr x1, x2, x1
mov x2,x15
mov x1,x1
mul x15,x11,x7
madd x15, x13, x8, x15
mul x7,x12,x7
madd x7, x14, x8, x7
mul x8,x11,x9
madd x8, x13, x10, x8
mul x9,x12,x9
madd x9, x14, x10, x9
mov x10,x15
mov x8,x8
mov x7,x7
mov x9,x9
and x2, x2, #1048575
and x1, x1, #1048575
sub x2,x2,x4
sub x1,x1,x6
and x6, x1, #1
sub x11,x1,x2
madd x6, x6, x2, x1
sub x12,x3,#1
tst x12, x1, ror #1
csneg x3, x12, x3, pl
csel x1, x2, x1, pl
csel x2, x6, x11, pl
asr x2, x2, #1
and x6, x2, #1
sub x11,x2,x1
madd x6, x6, x1, x2
sub x12,x3,#1
tst x12, x2, ror #1
csneg x3, x12, x3, pl
csel x1, x1, x2, pl
csel x2, x6, x11, pl
asr x2, x2, #1
and x6, x2, #1
sub x11,x2,x1
madd x6, x6, x1, x2
sub x12,x3,#1
tst x12, x2, ror #1
csneg x3, x12, x3, pl
csel x1, x1, x2, pl
csel x2, x6, x11, pl
asr x2, x2, #1
and x6, x2, #1
sub x11,x2,x1
madd x6, x6, x1, x2
sub x12,x3,#1
tst x12, x2, ror #1
csneg x3, x12, x3, pl
csel x1, x1, x2, pl
csel x2, x6, x11, pl
asr x2, x2, #1
and x6, x2, #1
sub x11,x2,x1
madd x6, x6, x1, x2
sub x12,x3,#1
tst x12, x2, ror #1
csneg x3, x12, x3, pl
csel x1, x1, x2, pl
csel x2, x6, x11, pl
asr x2, x2, #1
and x6, x2, #1
sub x11,x2,x1
madd x6, x6, x1, x2
sub x12,x3,#1
tst x12, x2, ror #1
csneg x3, x12, x3, pl
csel x1, x1, x2, pl
csel x2, x6, x11, pl
asr x2, x2, #1
and x6, x2, #1
sub x11,x2,x1
madd x6, x6, x1, x2
sub x12,x3,#1
tst x12, x2, ror #1
csneg x3, x12, x3, pl
csel x1, x1, x2, pl
csel x2, x6, x11, pl
asr x2, x2, #1
and x6, x2, #1
sub x11,x2,x1
madd x6, x6, x1, x2
sub x12,x3,#1
tst x12, x2, ror #1
csneg x3, x12, x3, pl
csel x1, x1, x2, pl
csel x2, x6, x11, pl
asr x2, x2, #1
and x6, x2, #1
sub x11,x2,x1
madd x6, x6, x1, x2
sub x12,x3,#1
tst x12, x2, ror #1
csneg x3, x12, x3, pl
csel x1, x1, x2, pl
csel x2, x6, x11, pl
asr x2, x2, #1
and x6, x2, #1
sub x11,x2,x1
madd x6, x6, x1, x2
sub x12,x3,#1
tst x12, x2, ror #1
csneg x3, x12, x3, pl
csel x1, x1, x2, pl
csel x2, x6, x11, pl
asr x2, x2, #1
and x6, x2, #1
sub x11,x2,x1
madd x6, x6, x1, x2
sub x12,x3,#1
tst x12, x2, ror #1
csneg x3, x12, x3, pl
csel x1, x1, x2, pl
csel x2, x6, x11, pl
asr x2, x2, #1
and x6, x2, #1
sub x11,x2,x1
madd x6, x6, x1, x2
sub x12,x3,#1
tst x12, x2, ror #1
csneg x3, x12, x3, pl
csel x1, x1, x2, pl
csel x2, x6, x11, pl
asr x2, x2, #1
and x6, x2, #1
sub x11,x2,x1
madd x6, x6, x1, x2
sub x12,x3,#1
tst x12, x2, ror #1
csneg x3, x12, x3, pl
csel x1, x1, x2, pl
csel x2, x6, x11, pl
asr x2, x2, #1
and x6, x2, #1
sub x11,x2,x1
madd x6, x6, x1, x2
sub x12,x3,#1
tst x12, x2, ror #1
csneg x3, x12, x3, pl
csel x1, x1, x2, pl
csel x2, x6, x11, pl
asr x2, x2, #1
and x6, x2, #1
sub x11,x2,x1
madd x6, x6, x1, x2
sub x12,x3,#1
tst x12, x2, ror #1
csneg x3, x12, x3, pl
csel x1, x1, x2, pl
csel x2, x6, x11, pl
asr x2, x2, #1
and x6, x2, #1
sub x11,x2,x1
madd x6, x6, x1, x2
sub x12,x3,#1
tst x12, x2, ror #1
csneg x3, x12, x3, pl
csel x1, x1, x2, pl
csel x2, x6, x11, pl
asr x2, x2, #1
and x6, x2, #1
sub x11,x2,x1
madd x6, x6, x1, x2
sub x12,x3,#1
tst x12, x2, ror #1
csneg x3, x12, x3, pl
csel x1, x1, x2, pl
csel x2, x6, x11, pl
asr x2, x2, #1
and x6, x2, #1
sub x11,x2,x1
madd x6, x6, x1, x2
sub x12,x3,#1
tst x12, x2, ror #1
csneg x3, x12, x3, pl
csel x1, x1, x2, pl
csel x2, x6, x11, pl
asr x2, x2, #1
and x6, x2, #1
sub x11,x2,x1
madd x6, x6, x1, x2
sub x12,x3,#1
tst x12, x2, ror #1
csneg x3, x12, x3, pl
csel x1, x1, x2, pl
csel x2, x6, x11, pl
asr x2, x2, #1
and x6, x2, #1
sub x11,x2,x1
madd x6, x6, x1, x2
sub x12,x3,#1
tst x12, x2, ror #1
csneg x3, x12, x3, pl
csel x1, x1, x2, pl
csel x2, x6, x11, pl
asr x2, x2, #1
str x3, [x0]
mov x0,x1
add x0,x0,#1048576
add x0,x0,x4
asr x0, x0, #42
add x1,x1,#1048576
lsl x1, x1, #22
asr x1, x1, #43
mov x3,x2
add x3,x3,#1048576
add x3,x3,x4
asr x3, x3, #42
add x2,x2,#1048576
lsl x2, x2, #22
asr x2, x2, #43
mul x4,x1,x10
madd x4, x0, x7, x4
mul x6,x2,x10
madd x6, x3, x7, x6
mul x1,x1,x8
madd x0, x0, x9, x1
mul x1,x2,x8
madd x1, x3, x9, x1
mov x2,x4
mov x0,x0
mov x3,x6
mov x1,x1
stp x2, x0, [x5]
stp x3, x1, [x5, #16]
ldp d14,d15,[sp],#16
ldp d12,d13,[sp],#16
ldp d10,d11,[sp],#16
ldp d8,d9,[sp],#16
ldp x28, x29, [sp], #16
ldp x26, x27, [sp], #16
ldp x24, x25, [sp], #16
ldp x22, x23, [sp], #16
ldp x20, x21, [sp], #16
ldp x18, x19, [sp], #16
