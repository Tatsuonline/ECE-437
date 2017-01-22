#--------------------------------------
# Test a search algorithm
#--------------------------------------
  org   0x0000
  ori   $sp, $zero, 0x80
start:
  ori   $1, $zero, 0x01
  ori   $2, $zero, 0x04

  sw    $0, 0($sp)           
  lw    $3, 4($sp)           
  lw    $4, 8($sp)           
  addiu $5, $sp, 12



loop:
  lw    $6, 0($5)         
  subu  $7, $6, $3

  beq   $7, $zero, found     
  addu  $5, $5, $2           
  subu  $4, $4, $1           
  beq   $4, $zero, notfound  
  beq   $0, $zero, loop      
found:
  sw    $5, 0($sp)            # store into 0x80
notfound:
  halt


  org 0x80
item_position:
  cfw 0                       # should be found at
search_item:
  cfw 0x5c6f
list_length:
  cfw 3
search_list:
  cfw 0xFAAB
  cfw 0x5c6f
  cfw 0x4109

