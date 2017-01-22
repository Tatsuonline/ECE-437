
`ifndef CONTROL_UNIT_IF_VH
`define CONTROL_UNIT_IF_VH

// all types
`include "cpu_types_pkg.vh"
`include "pipeline_types_pkg.vh"
interface control_unit_if;
  // import types
  import cpu_types_pkg::*;
  import pipeline_types_pkg::*;

  aluop_t Alu_Op;
  opcode_t opcode;  
  logic Shamt, Alusrc, MemtoReg, Branch, Equal, Jump, Load;
  logic RegWrite, PCWait, RegDest, Link, Ext, Jr, LUI, halt;
  logic dMemRead, dMemWrite; ///////////// added!
  logic [31:0] instr;
  pStall_t stall;

  // register file ports
  modport ctrif (
    input instr, stall,
    output Alu_Op, Shamt, Alusrc, MemtoReg, Branch, Equal, Jump, Load,
    output dMemRead, dMemWrite,
    output RegWrite, PCWait, RegDest, Link, Ext, Jr, LUI, halt
  );

endinterface

`endif //REGISTER_FILE_IF_VH
