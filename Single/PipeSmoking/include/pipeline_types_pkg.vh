`ifndef PIPELINE_TYPES_PKG_VH
`define PIPELINE_TYPES_PKG_VH
`include "cpu_types_pkg.vh"

package pipeline_types_pkg;

import cpu_types_pkg::*;

//           IF/ID              //
typedef struct packed {
word_t pc4, imemload;
regbits_t rs,rt,rd;
} ifid_t;

//           ID/EX            //
typedef struct packed {
//control unit sigs
  word_t instr;
  logic Shamt, Alusrc, MemtoReg;
  logic Branch, Equal, Jump, RegWrite;
  logic PCWait, RegDest, Link;
  logic Ext, Jr, LUI, halt;
  logic Load;
  regbits_t rs, rt, rd, shamt;
  word_t rdat1, rdat2;
  word_t pc4;
  aluop_t Alu_Op;
  funct_t funct;
  opcode_t opcode;
  logic dMemRead, dMemWrite;
} idex_t;

//           EX/MEM            //
typedef struct packed {
  word_t pout; //alu output
  logic Load;
  word_t instr;
  logic MemtoReg, Equal, Zero;
  logic RegWrite, Link, halt, Jump, Branch;
  logic dMemRead, dMemWrite;
  word_t rdat2, pc4, wdat;
  regbits_t wsel, rs,rt,rd;
  opcode_t opcode;
} exmem_t;

//           MEM/WB            //
typedef struct packed {
  word_t dmemload, wdat;
  logic Link, Equal;
  logic MemtoReg, Jump, Branch;
  logic halt, RegWrite, dMemRead;
  regbits_t wsel, rd;
  word_t pc4, instr;
  opcode_t opcode;
} memwb_t;

typedef struct packed {
logic noStall;
logic ifidStall;
logic idexStall;
logic exmemStall;
logic allStall;
} pStall_t;


endpackage
`endif
