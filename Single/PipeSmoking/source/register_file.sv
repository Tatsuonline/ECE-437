`include "cpu_types_pkg.vh"
`include "register_file_if.vh"

module register_file
import cpu_types_pkg::*;
(
// logic [31:0] rfile;
 input logic  CLK, nRST,
 register_file_if.rf rfif
);
   //rfif.WEN
   
   word_t rfile [32];
   
  always_ff @(negedge CLK or negedge nRST)
  begin
    if (!nRST)
    begin
       rfile<='{default:0};       
    end
    else if(rfif.WEN && rfif.wsel)
    begin
       rfile[rfif.wsel]<=rfif.wdat;       
    end
     
  end // always_ff @   
  
     assign rfif.rdat1=rfile[rfif.rsel1];
     assign rfif.rdat2=rfile[rfif.rsel2];
    
   
 

endmodule
