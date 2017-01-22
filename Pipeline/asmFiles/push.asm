
# set the address where you want this
# code segment
# 
org 0x0000

ori $29, $0, 0xFFFC
LW $28, HELL($0)
push $28

ori $1, $0, 1

LW $27, 0($29)
halt

org 0x4444
HELL:
 cfw 0x666
