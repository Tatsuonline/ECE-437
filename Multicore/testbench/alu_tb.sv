// mapped needs this
`include "alu_if.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module alu_tb;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;


  // clock
  always #(PERIOD/2) CLK++;

  // interface
  alu_if aluf ();//
  // test program
   test PROG (.CLK(CLK), .nRST(nRST), .aluf(aluf));   

   
  // DUT
`ifndef MAPPED
  alu DUT(CLK, nRST, aluf);
`else
  alu DUT(
     .\aluf.opcode(aluf.opcode),
     .\aluf.port_a(aluf.port_a),
     .\aluf.port_b(aluf.port_b),
     .\aluf.nf(aluf.nf),
     .\aluf.zf(aluf.zf),
     .\aluf.of(aluf.of),
     .\aluf.pout(aluf.pout),
     .\nRST (nRST),
     .\CLK (CLK)
  );
`endif

endmodule

program test
import cpu_types_pkg::*;
(
   input logic CLK,
   output logic nRST,
   alu_if.tb aluf
 );

 parameter PERIOD=10;

initial
begin
 
   word_t a, b, golden;
   /*
 assert(aluf)
     else begin
	$error("case 5 wrong : writing to index 0");
     end
     */
   a='0;
   b='0;
   golden='0;
   nRST=0;
   #(PERIOD);
   aluf.port_a='0;
   aluf.port_b='0;   
   nRST=1;
   #(PERIOD);

   aluf.port_a=32'b01010101010101010101010101010101;
   aluf.port_b=1;   
   aluf.opcode=ALU_SLL;
   $display("Shifting left");
   $display("a : %d ", $signed(aluf.port_a));
   $display("b : %d ", $signed(aluf.port_b)); #(PERIOD/2);
   golden=32'b10101010101010101010101010101010;
   $display("Pout : %d    Golden :%d", $signed(aluf.pout), $signed(golden));
   $display("NF, ZF, OF : %d %d %d \n", aluf.nf, aluf.zf, aluf.of);
   

   #(PERIOD);
   aluf.port_a=32'b00010101010101010101010101010101;
   aluf.port_b=3;   
   aluf.opcode=ALU_SRL;   
   $display("Shifting right");
   $display("a : %d ", $signed(aluf.port_a));
   $display("b : %d ", $signed(aluf.port_b)); #(PERIOD/2);
golden=32'b00000010101010101010101010101010;
   $display("Pout : %d    Golden :%d", $signed(aluf.pout), $signed(golden));
   $display("NF, ZF, OF : %d %d %d \n", aluf.nf, aluf.zf, aluf.of);
   ///////////////////////////// sr
   #(PERIOD);
   aluf.port_a=32'b00000000000101010101010101010101;
   aluf.port_b=32'b00000000000010101010101010101010;
   aluf.opcode=ALU_ADD;   
   $display("ADD : two pos nums without overflow");
   $display("a : %d ", $signed(aluf.port_a));
   $display("b : %d ", $signed(aluf.port_b)); #(PERIOD/2);
golden=32'b00000000000111111111111111111111;
   $display("Pout : %d    Golden :%d", $signed(aluf.pout), $signed(golden));
   $display("NF, ZF, OF : %d %d %d \n", aluf.nf, aluf.zf, aluf.of);
   ///////////////////////////// when of not happens pos
   #(PERIOD);
   aluf.port_a=32'b10000000000101010101010101010101;
   aluf.port_b=32'b10000000000010101010101010101010;
   aluf.opcode=ALU_ADD;   
   $display("ADD : two neg nums without overflow");
   $display("a : %d ", $signed(aluf.port_a));
   $display("b : %d ", $signed(aluf.port_b)); #(PERIOD/2);
golden=32'b00000000000111111111111111111111;
   $display("Pout : %d    Golden :%d", $signed(aluf.pout), $signed(golden));
   $display("NF, ZF, OF : %d %d %d \n", aluf.nf, aluf.zf, aluf.of);
   ///////////////////////////// when of not happens neg
   #(PERIOD);
   
   aluf.port_a=32'b01111011010111111111111111111101;
   aluf.port_b=32'b01111111111010101010101010101010;
   aluf.opcode=ALU_ADD;
   $display("ADD : two pos nums with overflow");
   $display("a : %d ", $signed(aluf.port_a));
   $display("b : %d ", $signed(aluf.port_b)); #(PERIOD/2);
golden=32'b11111011010010101010101010100111;
   $display("Pout : %d    Golden :%d", $signed(aluf.pout), $signed(golden));
   $display("NF, ZF, OF : %d %d %d \n", aluf.nf, aluf.zf, aluf.of);
   ///////////////////////////// when of happens pos
   #(PERIOD);
   aluf.port_a=32'b11111111111101010101010101010101;
   aluf.port_b=32'b11111111111110101010101010101010;
   aluf.opcode=ALU_ADD;   
   $display("ADD : two neg nums with overflow");
   $display("a : %d ", $signed(aluf.port_a));
   $display("b : %d ", $signed(aluf.port_b)); #(PERIOD/2);
golden=32'b11111111111011111111111111111111;
   $display("Pout : %d    Golden :%d", $signed(aluf.pout), $signed(golden));
   $display("NF, ZF, OF : %d %d %d \n", aluf.nf, aluf.zf, aluf.of);
   ///////////////////////////// when of happens neg
   #(PERIOD);
   
   
   aluf.port_a=32'b00000000000111111111111111111111;
   aluf.port_b=32'b00000000000010101010101010101010;
   aluf.opcode=ALU_SUB;
   $display("SUB : two pos nums without overflow");
   $display("a : %d ", $signed(aluf.port_a));
   $display("b : %d ", $signed(aluf.port_b)); #(PERIOD/2);
golden=32'b00000000000101010101010101010101;
   $display("Pout : %d    Golden :%d", $signed(aluf.pout), $signed(golden));
   $display("NF, ZF, OF : %d %d %d \n", aluf.nf, aluf.zf, aluf.of);
   ///////////////////////////// when of not happens pos
   #(PERIOD);
   aluf.port_a=32'b10000000000111111111111111111111;
   aluf.port_b=32'b10000000000010101010101010101010;
   aluf.opcode=ALU_SUB;   
   $display("SUB : two neg nums without overflow");
   $display("a : %d ", $signed(aluf.port_a));
   $display("b : %d ", $signed(aluf.port_b)); #(PERIOD/2);
golden=32'b00000000000101010101010101010101;
   $display("Pout : %d    Golden :%d", $signed(aluf.pout), $signed(golden));
   $display("NF, ZF, OF : %d %d %d \n", aluf.nf, aluf.zf, aluf.of);
   ///////////////////////////// when of not happens neg
   #(PERIOD);
   
   aluf.port_a=32'b01111011010111111111111111111101;
   aluf.port_b=32'b11111111111010101010101010101010;
   aluf.opcode=ALU_SUB;
   $display("SUB : pos neg, nums with overflow");
   $display("a : %d ", $signed(aluf.port_a));
   $display("b : %d ", $signed(aluf.port_b)); #(PERIOD/2);
golden=32'b01111011011101010101010101010011;
   $display("Pout : %d    Golden :%d", $signed(aluf.pout), $signed(golden));
   $display("NF, ZF, OF : %d %d %d \n", aluf.nf, aluf.zf, aluf.of);
   ///////////////////////////// when of happens pos
   #(PERIOD);
   aluf.port_a=32'b11111111111101010101010101010101;
   aluf.port_b=32'b01111111111110101010101010101010;
   aluf.opcode=ALU_SUB;
   $display("SUB : neg pos nums with overflow");
   $display("a : %d ", $signed(aluf.port_a));
   $display("b : %d ", $signed(aluf.port_b)); #(PERIOD/2);
golden=32'b1111111111110101010101010101011;
   $display("Pout : %d    Golden :%d", $signed(aluf.pout), $signed(golden));
   $display("NF, ZF, OF : %d %d %d \n", aluf.nf, aluf.zf, aluf.of);
   ///////////////////////////// when of happens neg
   #(PERIOD);
   
   aluf.port_a=32'b11000010000000000000000000000011;
   aluf.port_b=32'b11000010000000000000000000000011;
   aluf.opcode=ALU_AND;   
   $display(" AND ing");
   $display("a : %d ", $signed(aluf.port_a));
   $display("b : %d ", $signed(aluf.port_b)); #(PERIOD/2);
golden=32'b11000010000000000000000000000011;
   $display("Pout : %d    Golden :%d", $signed(aluf.pout), $signed(golden));
   $display("NF, ZF, OF : %d %d %d \n", aluf.nf, aluf.zf, aluf.of);
   /////////////////////////////
   #(PERIOD);
   aluf.port_a=32'b10101010101010101010101010101010;
   aluf.port_b=32'b01010101010101010101010101010101;
   aluf.opcode=ALU_OR;   
   $display(" OR ing");
   $display("a : %d ", $signed(aluf.port_a));
   $display("b : %d ", $signed(aluf.port_b)); #(PERIOD/2);
golden=32'b11111111111111111111111111111111;
   $display("Pout : %d    Golden :%d", $signed(aluf.pout), $signed(golden));
   $display("NF, ZF, OF : %d %d %d \n", aluf.nf, aluf.zf, aluf.of);
   /////////////////////////////
   #(PERIOD);   
   aluf.port_a=32'b10101010101010101010101010101010;
   aluf.port_b=32'b10101010101010101010101010101010;
   aluf.opcode=ALU_XOR;  
   $display(" XOR ing");
   $display("a : %d ", $signed(aluf.port_a));
   $display("b : %d ", $signed(aluf.port_b)); #(PERIOD/2);
golden=32'b00000000000000000000000000000000;
   $display("Pout : %d    Golden :%d", $signed(aluf.pout), $signed(golden));
   $display("NF, ZF, OF : %d %d %d \n", aluf.nf, aluf.zf, aluf.of);
   /////////////////////////////
   #(PERIOD);
   aluf.port_a=32'b11111111111111111111111111111111;
   aluf.port_b=32'b00000000000000000000000000000000;
   aluf.opcode=ALU_NOR;  
   $display(" NOR ing");
   $display("a : %d ", $signed(aluf.port_a));
   $display("b : %d ", $signed(aluf.port_b)); #(PERIOD/2);
golden=32'b00000000000000000000000000000000;
   $display("Pout : %d    Golden :%d", $signed(aluf.pout), $signed(golden));
   $display("NF, ZF, OF : %d %d %d \n", aluf.nf, aluf.zf, aluf.of);
   /////////////////////////////
   
   
   #(PERIOD);
   aluf.port_a=32'b01111111111111111111111111111111;
   aluf.port_b=32'b00000000000000000000000000001010;
   aluf.opcode=ALU_SLT;
   $display(" SLT ing two pos nums ");
   $display("a : %d ", $signed(aluf.port_a));
   $display("b : %d ", $signed(aluf.port_b)); #(PERIOD/2);
golden=32'b00000000000000000000000000000000;
   $display("Pout : %d    Golden :%d", $signed(aluf.pout), $signed(golden));
   $display("NF, ZF, OF : %d %d %d \n", aluf.nf, aluf.zf, aluf.of);
   /////////////////////////////
   #(PERIOD);
   aluf.port_a=32'b11000000000000000000000011111111;
   aluf.port_b=32'b00000000000000000000000000001010;
   aluf.opcode=ALU_SLT;   
   $display(" SLT ing neg and pos ");
   $display("a : %d ", $signed(aluf.port_a));
   $display("b : %d ", $signed(aluf.port_b)); #(PERIOD/2);
golden=32'b00000000000000000000000000000001;
   $display("Pout : %d    Golden :%d", $signed(aluf.pout), $signed(golden));
   $display("NF, ZF, OF : %d %d %d \n", aluf.nf, aluf.zf, aluf.of);
   #(PERIOD);
   
   
   aluf.port_a=32'b00000000000000000000001111111111;
   aluf.port_b=32'b00000000000000000000000000001111;
   aluf.opcode=ALU_SLTU;
   $display(" SLTU ing two pos nums ");
   $display("a : %d ", $signed(aluf.port_a));
   $display("b : %d ", $signed(aluf.port_b)); #(PERIOD/2);
golden=32'b00000000000000000000000000000000;
   $display("Pout : %d    Golden :%d", $signed(aluf.pout), $signed(golden));
   $display("NF, ZF, OF : %d %d %d \n", aluf.nf, aluf.zf, aluf.of);
   /////////////////////////////
   #(PERIOD);
   aluf.port_a=32'b10000000000000000000000011111111;
   aluf.port_b=32'b00000000000000000000000000001110;
   aluf.opcode=ALU_SLTU;
   $display(" SLTU ing neg and pos ");
   $display("a : %d ", $signed(aluf.port_a));
   $display("b : %d ", $signed(aluf.port_b)); #(PERIOD/2);
golden=32'b00000000000000000000000000000000;
   $display("Pout : %d    Golden :%d", $signed(aluf.pout), $signed(golden));
   $display("NF, ZF, OF : %d %d %d \n", aluf.nf, aluf.zf, aluf.of);
   
   #(PERIOD);
   #(PERIOD);
   $finish;
end
   
//       
endprogram
