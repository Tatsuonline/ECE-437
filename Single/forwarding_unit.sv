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

          if(fuif.exmem_RegW&&(fuif.exmem_wsel!=0)&&(fuif.exmem_wsel==fuif.idex_rs)) begin	   //forward case 1
             fuif.fwa=2'b10;
          end
	  else if((!fuif.dMemWrite)&&fuif.exmem_RegW&&(fuif.exmem_wsel!=0)&&(fuif.exmem_wsel==fuif.idex_rt)) begin  //forward case 1
             fuif.fwb=2'b10;
          end          

	  else if(fuif.memwb_RegW&&(fuif.memwb_wsel!=0)&&(fuif.memwb_wsel==fuif.idex_rs)) begin //forward case 2
             fuif.fwa=2'b01;
          end         
          else if((!fuif.dMemWrite)&&fuif.memwb_RegW&&(fuif.memwb_wsel!=0)&&(fuif.memwb_wsel==fuif.idex_rt)) begin //forward case 2
             fuif.fwb=2'b01;
          end
 

      if(fuif.dMemWrite) begin
          if((fuif.exmem_wsel!=0)&&(fuif.exmem_wsel==fuif.idex_rt))//store
          begin //forward case 2
            fuif.fws=2'b10;
          end
          else if((fuif.memwb_wsel!=0)&&(fuif.memwb_wsel==fuif.idex_rt))//store
          begin //forward case 2
            fuif.fws=2'b01;
          end
     end     
end

endmodule
