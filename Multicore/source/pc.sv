`include "cpu_types_pkg.vh"
import cpu_types_pkg::*;

module pc(
input logic CLK, input logic nRST, pcWEN,
input logic [31:0] nextAddr,//next address
output logic [31:0] pcAddr
);
parameter PC_INIT=0;
always_ff @(posedge CLK, negedge nRST)
  if(nRST==0) begin
//    pcAddr<='0;
    pcAddr<=PC_INIT;
  end else if (pcWEN) begin
    pcAddr<=nextAddr;
  end

endmodule
