`ifndef DECODER_IF
`define DECODER_IF
`include "cpu_types_pkg.vh"

interface decoder_if;
  import cpu_types_pkg::*;

  regbits_t rs;
  regbits_t rd;
  regbits_t rt;
  opcode_t opcode;
  word_t instr_d;
  funct_t funct;
  logic [25:0] addr; //26-1
  logic [15:0] imm; //16-1
  logic [4:0] shamt;//5-1


  modport decodeif (
    input   instr_d,
    output  rs, rd, rt, opcode, funct, addr, imm, shamt
  );
endinterface

`endif
