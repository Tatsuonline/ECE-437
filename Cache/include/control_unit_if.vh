
`ifndef CONTROL_UNIT_IF_VH
`define CONTROL_UNIT_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface control_unit_if;
  // import types
  import cpu_types_pkg::*;

  aluop_t alu_op;
  opcode_t opcode;
  funct_t funct;
  logic Shamt, Alusrc, MemtoReg, RegtoPc, Branch, Equal, Jump, beq, bne;
  logic RegWrite, PCWait, RegDest, Link, Ext, Jr, LUI, halt;
  logic ImmtoReg;
  logic [31:0] instr;
  logic dhit, dRead, dWrite;
 
  // register file ports
  modport cuif (
    input instr, dhit, funct, opcode,
    output dRead, dWrite, RegtoPc,
    output alu_op, Shamt, Alusrc, MemtoReg,Branch, Equal, Jump, beq, bne,
    output RegWrite, PCWait, RegDest, Link, Ext, Jr, LUI, halt,
    output ImmtoReg
  );

endinterface

`endif //REGISTER_FILE_IF_VH
