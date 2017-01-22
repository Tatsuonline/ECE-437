
# set the address where you want this
# code segment
# $2, $3,  $4=$2, $5=1


 org 0x0000
 ori $29, $0, 0xFFFC
 ori $2, $0, 0x0008
 ori $3, $0, 0x0003

 push $2
 push $3

 jal mult
 lw $28, 0($29)
 halt
 

mult:
	pop $3
	pop $2
	ori $5, $0, 0x0001
	ori $4, $0, 0x0000

mloop1:
	beq $3, $0, finish
	subu $3, $3, $5
	addu $4, $4, $2
	j mloop1

finish:
	push $4
	jr $31
