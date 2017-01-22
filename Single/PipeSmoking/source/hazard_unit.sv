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
  huif.stall.noStall=0;
  huif.stall.ifidStall=0;
  huif.stall.idexStall=0;
  huif.stall.exmemStall=0;
  huif.stall.allStall=0;
  hazz=0; /////////////

  huif.ifid_flush=0;
  huif.idex_flush=0;
  huif.exmem_flush=0;
  huif.pcWait=0;

  if(huif.dMemRead_exmem||huif.dMemWrite) begin // (mem dmem(READ|WRITE)
  huif.pcWait=1;
  end

  if(huif.halt) begin
     huif.ifid_flush=1;
     huif.pcWait=1;
  end
  if(huif.isBr) begin
     huif.idex_flush=1;
     huif.ifid_flush=1;
     huif.pcWait=1;
  end
  if (huif.isJump) begin
     huif.idex_flush=1;
     huif.ifid_flush=1;
     huif.pcWait=1;
  end
  if(!huif.dhit&&!huif.ihit) begin
      huif.stall.allStall=1;
      huif.pcWait=1;
  end
  if(!huif.dMemRead) begin
     if(!huif.ihit && huif.dhit) begin //dont fetch instr....
        huif.stall.ifidStall=1;
	huif.ifid_flush=1;
 	huif.pcWait=1;
     end
  end

if((huif.idex_rd!=0)&&(huif.RegWrite)&&(huif.ifid_opcode==6'b000100||huif.ifid_opcode==6'b000101)&&((huif.idex_rd==huif.ifid_rs)||(huif.idex_rd==huif.ifid_rt))) begin
       huif.stall.ifidStall=1;
       huif.stall.idexStall=1;
       huif.idex_flush=1;
       hazz=3;
       huif.pcWait=1;
end
else if(huif.dMemRead) begin
   if((huif.idex_rt!=0)&&((huif.idex_rt == huif.ifid_rs)||(huif.idex_rt == huif.ifid_rt))) 
       begin
       huif.stall.ifidStall=1;
       huif.stall.idexStall=1;
       huif.idex_flush=1;
hazz=2;
       huif.pcWait=1;
    end
else begin
   if((huif.exmem_rd!=0)&&((huif.exmem_rd == huif.ifid_rs)||(huif.exmem_rd == huif.ifid_rt))&&huif.dMemRead_exmem)
   begin
   huif.stall.ifidStall=1;
   huif.stall.idexStall=1;
   huif.idex_flush=1;
   huif.pcWait=1;
hazz=1;
   end
end

end



end // always


endmodule

