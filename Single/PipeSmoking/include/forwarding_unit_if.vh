
`ifndef FORWARDING_UNIT_IF_VH
`define FORWARDING_UNIT_IF_VH

// all types
`include "cpu_types_pkg.vh"
`include "pipeline_types_pkg.vh"

interface forwarding_unit_if;
  import cpu_types_pkg::*;
  import pipeline_types_pkg::*;

logic dMemWrite, exmem_RegW, memwb_RegW, exmem_dMemRead, memwb_dMemRead;
regbits_t idex_rt, idex_rs, exmem_wsel, memwb_wsel, exmem_rd, memwb_rd;
logic [1:0] fwa, fwb, fws;

  modport fu(
    input idex_rt, idex_rs, exmem_RegW, memwb_RegW, exmem_wsel, memwb_wsel, dMemWrite, exmem_rd, memwb_rd, exmem_dMemRead, memwb_dMemRead,
    output fwa, fwb, fws

  );

endinterface

`endif
