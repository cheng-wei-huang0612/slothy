add x9,x10,x9,lsl #30
add x10,x12,x11,lsl #30
smlal v18.2d,v16.2s,v6.s[0]
smlal2 v18.2d,v16.4s,v6.s[2]
smlal v18.2d,v17.2s,v5.s[1]
smlal2 v18.2d,v17.4s,v5.s[3]
and v5.16b, v18.16b, v1.16b
sshr v18.2d, v18.2d, #30
mov v5.16b, v5.16b
and x11, x9, #1048575
and x12, x10, #1048575
sub x11,x11,x7
sub x12,x12,x8
and x14, x12, #1
sub x15,x12,x11
madd x14, x14, x11, x12
sub x16,x13,#1
tst x16, x12, ror #1
csneg x13, x16, x13, pl
csel x11, x11, x12, pl
csel x12, x14, x15, pl
asr x12, x12, #1
smlal v18.2d,v16.2s,v6.s[1]
smlal2 v18.2d,v16.4s,v6.s[3]
and x14, x12, #1
sub x15,x12,x11
madd x14, x14, x11, x12
sub x16,x13,#1
tst x16, x12, ror #1
csneg x13, x16, x13, pl
csel x11, x11, x12, pl
csel x12, x14, x15, pl
asr x12, x12, #1
smlal v18.2d,v17.2s,v6.s[0]
smlal2 v18.2d,v17.4s,v6.s[2]
and v19.16b, v18.16b, v1.16b
sshr v18.2d, v18.2d, #30
shl v19.2d, v19.2d, #32
orr v5.16b, v5.16b, v19.16b
and x14, x12, #1
sub x15,x12,x11
madd x14, x14, x11, x12
sub x16,x13,#1
tst x16, x12, ror #1
csneg x13, x16, x13, pl
csel x11, x11, x12, pl
csel x12, x14, x15, pl
asr x12, x12, #1
smlal v18.2d,v16.2s,v7.s[0]
smlal2 v18.2d,v16.4s,v7.s[2]
smlal v18.2d,v17.2s,v6.s[1]
smlal2 v18.2d,v17.4s,v6.s[3]
