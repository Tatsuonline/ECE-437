
`ifndef HAZARD_UNIT_IF_VH
`define HAZARD_UNIT_IF_VH
/////br-, jump-, equal-, jr, j, link
// all types
`include "cpu_types_pkg.vh"
`include "pipeline_types_pkg.vh"

interface hazard_unit_if;
  import cpu_types_pkg::*;
  import pipeline_types_pkg::*;

logic ifidFlush, idexFlush, exmemFlush, pcWait, flushEn, Jr, Link, pcGo;
logic dMemRead, dMemReq_exmem, ihit, dhit, halt;
regbits_t idex_rt, ifid_rs, ifid_rt;
pStall_t stall; 

  modport hz (
    input dMemRead, ihit, dhit, halt, Jr, Link, pcGo,
    input dMemReq_exmem, flushEn,
    input  ifid_rs, ifid_rt, idex_rt,
    output stall, pcWait,
    output ifidFlush, idexFlush, exmemFlush
  );

  modport tb (
    input stall, pcWait,
    input ifidFlush, idexFlush, exmemFlush,
    output dMemRead, ihit, dhit, halt, Jr, Link, pcGo,
    output dMemReq_exmem, flushEn,
    output  ifid_rs, ifid_rt, idex_rt
  );	

endinterface

`endif
