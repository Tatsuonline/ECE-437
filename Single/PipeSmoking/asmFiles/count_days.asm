
# set the address where you want this
# code segment

org 0x0000   ///////////whyyyyyy
 ori $29, $0, 0xFFFC

 ori $2, $0, 2015 //year
 ori $3, $0, 1    //month
 ori $4, $0, 15   //day
 ori $5, $0, 365  //365
 ori $6, $0, 30   //30

 addiu $2, $2, -2000
 addiu $3, $3, -1

 push $2
 push $5
 jal mult
 pop $5

 push $3
 push $6
 jal mult
 pop $3

 addu $20, $5, $3
 addu $20, $20, $4
 
finish:
 halt

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





