`include "cpu_types_pkg.vh"
import cpu_types_pkg::*;

module pc(
input logic CLK, input logic nRST,
input logic [31:0] nextAddr,//next address
output logic [31:0] pcAddr
);

always_ff @(posedge CLK, negedge nRST)
  if(nRST==0) begin
    pcAddr<='0;
  end else begin
    pcAddr<=nextAddr;
  end

endmodule
