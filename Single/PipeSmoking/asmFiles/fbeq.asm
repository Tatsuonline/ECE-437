#--------------------------------------
# Test a search algorithm
#--------------------------------------
  org   0x0000
  ori   $1, $zero, 1
  ori   $2, $zero, 2
  ori   $3, $zero, 4
  ori   $4, $zero, 0x80
  ori   $5, $zero, 1
start:
  beq $3, $1, endd
  addu $1, $1, $5
  beq $0, $zero, start
endd:
  sw $1, 0($4)
  halt

