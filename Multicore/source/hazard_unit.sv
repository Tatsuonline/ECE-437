`include "cpu_types_pkg.vh"
`include "pipeline_types_pkg.vh"
`include "hazard_unit_if.vh"

import cpu_types_pkg::*;
import pipeline_types_pkg::*;

module hazard_unit(
hazard_unit_if.hz huif
);

logic [2:0] hazz;//////////////////
logic [1:0] gayKing;
always_comb begin
  huif.stall.ifidStall=0;
  huif.stall.idexStall=0; 
  huif.stall.exmemStall=0;
  huif.stall.allStall=0;
  huif.stall.noStall=0;
  huif.ifidFlush=0;
  huif.idexFlush=0;
  huif.exmemFlush=0;
gayKing=0;
  hazz='0;
  if (huif.flushEn || huif.halt) begin //idex halt
     huif.ifidFlush=1;
  end
 // if (huif.flushEn) begin
 //    huif.idexFlush=1;
 // end

  if(huif.dpif_halt) begin
    huif.stall.allStall=1;
  end
  else if(huif.dMemRead & ((huif.idex_rt == huif.ifid_rs)||(huif.idex_rt == huif.ifid_rt)))
  begin
    if(huif.dMemReq_exmem && !huif.dhit) begin
      huif.stall.allStall=1; hazz=1;
    end
    else begin
      huif.stall.idexStall=1;
    end
  end

  else if (huif.dhit) begin
    if (huif.ihit) begin
      huif.stall.noStall=1; //  just test sig...not used
//      huif.stall.ifidStall=0;
    end
    else begin
      huif.stall.ifidStall=1;
//      huif.stall.noStall=1;
    end
  end

  else if (huif.dMemReq_exmem) begin
     huif.stall.allStall=1;  hazz=2;
  end
  else if (huif.ihit) begin
     huif.stall.noStall=1;
  end
  else begin
     huif.stall.ifidStall=1;
  end

  if (huif.pcGo) begin
    huif.pcWait=0;
  end
  else if(huif.stall.ifidStall) begin
    huif.pcWait=1;
  end
  else if(huif.stall.idexStall) begin
    huif.pcWait=1;
  end
  else if(huif.stall.allStall) begin //huif.stall.noStall
    huif.pcWait=1; gayKing=1;
  end
  else begin
    huif.pcWait=0;
  end

end


endmodule

