`include "request_unit_if.vh"
`include "cpu_types_pkg.vh"


module request_unit
import cpu_types_pkg::*;
(
  input logic CLK, nRST,
  request_unit_if.ruif ruif
);

assign ruif.iREN = 1 & !ruif.halt; // <<<<<<<<<<<<<<<
always_ff @ (posedge CLK, negedge nRST) begin
  if(!nRST) begin
    ruif.dWEN <= 0;
    ruif.dREN <= 0;
    //iREN<=0;
  end
  else begin
//    ruif.iREN<=1;
    if(ruif.ihit) begin
      ruif.dREN <= ruif.dRead;
      ruif.dWEN <= ruif.dWrite;
    end
    else if (ruif.dhit) begin
      ruif.dREN <=0;
      ruif.dWEN <=0;
    end
  end
end


endmodule


