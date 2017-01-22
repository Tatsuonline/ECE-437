`include "pipeline_types_pkg.vh"
//`include "hazard_unit_if.vh"
module pipeline_register
import pipeline_types_pkg::*;
(
 input logic CLK, nRST,
 input logic ihit, dhit,
 input ifid_t ifidIn,
 input idex_t idexIn,
 input exmem_t exmemIn,
 input memwb_t memwbIn,
 input pStall_t stall,
 input logic ifidFlush, idexFlush, exmemFlush,
 output ifid_t ifidOut,
 output idex_t idexOut,
 output exmem_t exmemOut,
 output memwb_t memwbOut
);
logic ifid_en, idex_en, exmem_en, memwb_en;
logic ifidstall_en, idexstall_en;

always_comb begin
   ifid_en=0;
   idex_en=0;
   exmem_en=0;
   memwb_en=0;
   ifidstall_en=0; 
   idexstall_en=0;

   if (ihit||dhit) begin
     ifid_en=1;
     idex_en=1;
     exmem_en=1;
     memwb_en=1;
	 if(stall.ifidStall) begin
	 	ifidstall_en = 1;
		ifid_en = 0;
	 end
	 if(stall.idexStall) begin
	 	 idexstall_en = 1;
		 ifid_en = 0;
	 	 idex_en = 0;
	 end
   end

/*   if (stall.ifidStall) begin
      ifid_en=0;
   end
   if (stall.idexStall) begin
      ifid_en=0;
      idex_en=0; //stall stall or stall bubble or stall overwrite stall stall.....????????
   end*/
//  if (stall.allStall) begin
//     idex_en=0;
//     ifid_en=0;
//     exmem_en=0;
//     memwb_en=0;
//   end

   
end

// ifid //
always_ff @(posedge CLK, negedge nRST) begin
  if(!nRST) begin
    ifidOut <= ifid_t'(0);
  end
  else begin
     if(ifid_en && !ifidstall_en) begin
        ifidOut <= ifidIn;
     end
     else if (ifidstall_en) begin
        ifidOut <= ifid_t'(0);
     end
     if(ifidFlush) begin
       ifidOut <= ifid_t'(0);
     end
  end
end
// idex //
always_ff @(posedge CLK, negedge nRST) begin
  if(!nRST) begin
    idexOut <= idex_t'(0);
  end
  else begin
    if((idex_en && !idexstall_en)) begin   
		idexOut <= idexIn; 
    end
	else if (idexstall_en) begin
       idexOut<= idex_t'(0);
    end
    if(idexFlush) begin
      idexOut <= idex_t'(0);
    end
  end
end

//  exmem  //
always_ff @(posedge CLK, negedge nRST) begin
  if(!nRST) begin
    exmemOut <= exmem_t'(0);
  end
else begin 
    if(exmem_en) begin
      exmemOut <= exmemIn;
    end
    if(exmemFlush) begin
      exmemOut <= exmem_t'(0);
    end
end
end

//  memwr  //
always_ff @(posedge CLK, negedge nRST) begin
  if(!nRST) begin
    memwbOut <= memwb_t'(0);  
  end
  else begin
     if(memwb_en) begin
       memwbOut <= memwbIn;
     end
  end
end


endmodule
