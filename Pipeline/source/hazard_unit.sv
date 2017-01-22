`include "cpu_types_pkg.vh"
`include "pipeline_types_pkg.vh"
`include "hazard_unit_if.vh"

import cpu_types_pkg::*;
import pipeline_types_pkg::*;

module hazard_unit(
hazard_unit_if.hz huif
);

logic [2:0] hazz;//////////////////
always_comb begin
  huif.stall.ifidStall=0;
  huif.stall.idexStall=0; 
  huif.stall.exmemStall=0;
  huif.stall.allStall=0;
  huif.stall.noStall=0;
  huif.ifidFlush=0;
  huif.idexFlush=0;
  huif.exmemFlush=0;

  if (huif.flushEn || huif.halt) begin
     huif.ifidFlush=1;
  end
  if (huif.flushEn) begin
     huif.idexFlush=1;
  end


  //if((huif.Jr)||huif.stall.noStall) begin
if (huif.pcGo) begin
huif.pcWait=0;
end
else if(huif.stall.noStall) begin
   huif.pcWait=1;
end
else begin
   huif.pcWait=0;
end

// LUI rt, imm idex
// ori rt rs imm ifid


  if(huif.dMemRead & ((huif.idex_rt == huif.ifid_rs)||(huif.idex_rt == huif.ifid_rt)))        
  begin
     huif.stall.idexStall=1;
  end
  else if (huif.dhit) begin
     huif.stall.ifidStall=1;
  end
  else if (huif.dMemReq_exmem) begin
     huif.stall.allStall=1;
  end
  else if (huif.ihit) begin
     huif.stall.noStall=1;
  end
end


endmodule

