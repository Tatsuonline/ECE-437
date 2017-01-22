`include "cpu_types_pkg.vh"
`include "pipeline_types_pkg.vh"
`include "forwarding_unit_if.vh"

import cpu_types_pkg::*;
import pipeline_types_pkg::*;

module forwarding_unit(
forwarding_unit_if.fu fuif
);

always_comb begin
     fuif.fwa=0;
     fuif.fwb=0;
     fuif.fws=0;
//stage_out
   if(~(fuif.ifid_rs==0) && (fuif.idexRegW) && (fuif.ifid_rs == fuif.idex_wsel)) begin
      fuif.fwa=2'b01;
   end else if(~(fuif.ifid_rs==0) && (fuif.exmemRegW) && (fuif.ifid_rs == fuif.exmem_wsel)) begin
      fuif.fwa=2'b10;
   end
   if(~(fuif.ifid_rt==0) && (fuif.idexRegW) && (fuif.ifid_rt == fuif.idex_wsel)) begin
      fuif.fwb=2'b01;
   end else if(~(fuif.ifid_rt==0) && (fuif.exmemRegW) && (fuif.ifid_rt == fuif.exmem_wsel)) begin
      fuif.fwb=2'b10;
   end

end

endmodule
