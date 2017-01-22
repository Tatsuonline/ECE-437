
`ifndef HAZARD_UNIT_IF_VH
`define HAZARD_UNIT_IF_VH

// all types
`include "cpu_types_pkg.vh"
`include "pipeline_types_pkg.vh"

interface hazard_unit_if;
  import cpu_types_pkg::*;
  import pipeline_types_pkg::*;

logic ifid_flush, idex_flush, exmem_flush, Br, Jump, pcWait, alusrc, beq, bne, Jr;
logic dMemRead, dMemRead_exmem, dMemWrite, ihit, dhit, halt, Equal, RegWrite;
regbits_t idex_rd, idex_rt, idex_rs, ifid_rs, ifid_rt, ifid_rd, exmem_rs, exmem_rd, exmem_rt, exmem_wsel, memwb_wsel;
pStall_t stall; 
logic [5:0] ifid_opcode;

  modport hz (
    input dMemRead, dMemWrite, ihit, dhit, halt, Br, alusrc, ifid_rd, ifid_opcode, Jr,
    input Jump, Equal, RegWrite, dMemRead_exmem, beq, bne,
    input  ifid_rs, ifid_rt, idex_rt, idex_rs, idex_rd, exmem_rs, exmem_rd, exmem_rt, exmem_wsel, memwb_wsel,
    output stall, pcWait,
    output ifid_flush, idex_flush, exmem_flush
  );

endinterface

`endif
