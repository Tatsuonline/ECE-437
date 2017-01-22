
# set the address where you want this
# code segment
# 
org 0x0000

 ori $29, $0, 0xFFFC
 lw $2, DATA_NUM($0)
 ori $3, $0, 0x0000
 addiu $4, $sp, -4

pshloop1:
beq $3, $2, pshloop2
lw $5, DATA_SET($3)
push $5
addiu $3, $3, 0x4
j pshloop1

pshloop2:
 beq $sp, $4, finish
 jal mult
 j pshloop2

mult:
 pop $11
 pop $10
 ori $16, $0, 0x0000 //lsb
 ori $17, $0, 0

mult1:
 beq $11, $0, mult_end
 andi $16, $11, 1
 beq $16, $0, mult_shift
 addu $17, $10, $17

mult_shift:
 sll $10, $10, 1
 srl $11, $11, 1
 j mult1

mult_end:
 push $17
 jr $31

finish:
lw $20, 0($29)
halt

org 0x4000

DATA_NUM:
 cfw 16 //  n/4

DATA_SET:
// cfw -123
// cfw -124
// cfw 0x1ABCDEF
// cfw 0xFFFFFFF

//cfw 3
//cfw 3
//cfw 2
//cfw 3

cfw 5
cfw 4
cfw 3
cfw 2




