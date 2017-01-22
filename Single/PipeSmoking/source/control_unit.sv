`include "cpu_types_pkg.vh"
`include "control_unit_if.vh"
`include "hazard_unit_if.vh"

module control_unit 
import cpu_types_pkg::*;
(
  control_unit_if.ctrif ctrif
);

//shamt, branch(bne, beq) 
//equal, jump, link, 
//Jr is jr.....


  // number of cpus for cc
  parameter CPUS = 1;
//////add [0] to all memcon signals ...later....
////     6   5   5 5  5     6
////     op rs  rt rd shamt funct
//// add:0 [5] [5]  0  0     i32 
////addu:0 [5] [5] 0 0 33 
//// sub:0 [5] [5] 0 0 34 
////subu:0 [5] [5] 0 0 35
//// and:0 [5] [5] 0 0 36
//// or :0 [5] [5] 0 0 37
//// nor:0 [5] [5] 0 0 39
//// sll:0 [5] [5] 0 0 0
//// srl:0 [5] [5] 0 0 2
//// slt:0 [5] [5] 0 0 42
////sltu:0 [5] [5] 0 0 43
//// jr :0 [5] [5] 0 0 08

r_t rtypei;
always_comb begin
rtypei=ctrif.instr;
ctrif.Alu_Op=ALU_ADD;
ctrif.Shamt=0; ctrif.Alusrc=0; ctrif.MemtoReg=0;
ctrif.Branch=0; ctrif.Equal=0; ctrif.Jump=0; ctrif.RegWrite=0; 
ctrif.RegDest=0; ctrif.Link=0; 
ctrif.Ext=0; ctrif.Jr=0; ctrif.LUI=0; ctrif.halt=0;
ctrif.dMemRead=0;ctrif.dMemWrite=0; ctrif.Load=0;
ctrif.PCWait =0;// (ctrif.stall.allStall==1) ? 1 : 0; 
casez(rtypei.opcode)
  RTYPE: begin
    casez(rtypei.funct)
       ADDU : begin
	 ctrif.RegWrite=1;
	 end
       AND: begin
	 ctrif.Alu_Op=ALU_AND;
	 ctrif.RegWrite=1;
	 end
       OR: begin
	 ctrif.Alu_Op=ALU_OR;
	 ctrif.RegWrite=1;
	 end
       NOR: begin
	 ctrif.Alu_Op=ALU_NOR;
	 ctrif.RegWrite=1;
	 end
       SLT: begin
	 ctrif.Alu_Op=ALU_SLT;
	 ctrif.RegWrite=1;
	 end
       SLTU: begin
	 ctrif.Alu_Op=ALU_SLTU;
	 ctrif.RegWrite=1;
	 end
       SLL: begin
	 ctrif.Alu_Op=ALU_SLL;
	 ctrif.RegWrite=1;
	 ctrif.Shamt=1;
	 end
       SRL: begin
	 ctrif.Alu_Op=ALU_SRL;
	 ctrif.RegWrite=1;
	 ctrif.Shamt=1;
	 end
       SUBU: begin
	 ctrif.Alu_Op=ALU_SUB;
	 ctrif.RegWrite=1;
	 end
       XOR: begin
	 ctrif.Alu_Op=ALU_XOR;
	 ctrif.RegWrite=1;
	 end
       JR: begin
	 ctrif.Jr=1;
         end
    endcase
  end   // not r-type below  
  ADDIU: begin
//Alu_Op=ALU_ADD;
    ctrif.RegDest=1;
    ctrif.Ext=1;
    ctrif.Alusrc=1;
    ctrif.RegWrite=1;
  end
  ANDI: begin
    ctrif.Alu_Op=ALU_AND;
    ctrif.RegDest=1;
    ctrif.Alusrc=1;
    ctrif.RegWrite=1;
  end
  BEQ: begin
    ctrif.Alu_Op=ALU_SUB;
    ctrif.Equal=1;
    ctrif.Branch=1;
  end
  BNE: begin
    ctrif.Alu_Op=ALU_SUB;
    ctrif.Equal=0;
    ctrif.Branch=1;
  end
  LUI: begin
    ctrif.Alu_Op=ALU_NOR;
    ctrif.Alusrc=1;
    ctrif.RegDest=1;
    ctrif.LUI=1;
    ctrif.RegWrite=1;
  end
  LW: begin
    ctrif.Alusrc=1;
    ctrif.Alu_Op=ALU_ADD;
    ctrif.RegDest=1;
    ctrif.Ext=1;
    ctrif.MemtoReg=1;
    ctrif.dMemRead=1;
    ctrif.RegWrite=1;
    ctrif.Load=1;//pcwait=1
  end
  ORI: begin
    ctrif.Alu_Op=ALU_OR;
    ctrif.RegDest=1;
    ctrif.Alusrc=1;
    ctrif.RegWrite=1;
  end
  SLTI: begin
    ctrif.Alu_Op=ALU_SLT;
    ctrif.RegDest=1;
    ctrif.Alusrc=1;
    ctrif.RegWrite=1;
    ctrif.Ext=1;
  end
  SLTIU: begin
    ctrif.Alu_Op=ALU_SLT;
    ctrif.RegDest=1;
    ctrif.Alusrc=1;
    ctrif.RegWrite=1;
    ctrif.Ext=1;
  end
  SW: begin
    ctrif.Alusrc=1;
    ctrif.dMemWrite=1;
  end
  XORI: begin
    ctrif.Alu_Op=ALU_XOR;
    ctrif.RegDest=1;
    ctrif.Alusrc=1;
    ctrif.RegWrite=1;
  end    
  J: begin
   ctrif.Jump=1;
  end    
  JAL: begin
    ctrif.RegWrite=1;
    ctrif.Link=1;
    ctrif.Jump=1;
  end    
  HALT: begin
//    ctrif.PCWait=1;
    ctrif.halt=1;
  end    

  default: begin
  end

  endcase
end
endmodule

