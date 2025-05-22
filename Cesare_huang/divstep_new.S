ldr x3, [x0]
ldr x4, [x1]
ldr x5, [x2]
sub x6,x3,#1
tst x5, #1
csel x7, x4, xzr, ne
tst x6, x5, ror #1
csneg x3, x6, x3, pl
csel x4, x5, x4, mi
csneg x6, x7, x7, pl
add x5,x5,x6
asr x5, x5, #1
str x3, [x0]
str x4, [x1]
str x5, [x2]
