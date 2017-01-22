`include "cpu_types_pkg.vh"
import cpu_types_pkg::*;

module request_unit(
  input logic CLK, nRST,
  input logic dRead, dWrite,
  input logic iRead,
  input logic dhit, ihit, //from cache
  output logic iREN, dWEN, dREN //to cache
  );


always_ff @ (posedge CLK, negedge nRST) begin
  if(!nRST) begin
    dWEN <= 0;
    dREN <= 0;
    //iREN<=0;
  end
  else begin
    iREN<=1;
    if(ihit) begin
      dREN <= dRead;
      dWEN <= dWrite;
    end
    else if (dhit) begin
      dREN <=0;
      dWEN <=0;
    end
  end
end


endmodule


