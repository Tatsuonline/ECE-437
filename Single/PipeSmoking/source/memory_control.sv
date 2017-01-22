`include "cache_control_if.vh"
`include "cpu_types_pkg.vh"
`include "cpu_ram_if.vh"

module memory_control (
  input CLK, nRST,
  cache_control_if.cc ccif
);
  // type import
  import cpu_types_pkg::*;

  // number of cpus for cc
  parameter CPUS = 1;
  parameter CPUID = 0;
//////add [0] to all memcon signals ...later....

logic waitFlag;
//assign waitFlag=(ccif.dREN||ccif.dWEN);
//assign waitFlag=(ccif.dREN||ccif.dWEN) ? 1 : 0;
//[1] for data [0] for instruction

always_comb begin
  ccif.ramWEN=0;
  ccif.ramREN=0;
  ccif.ramaddr=0;
  ccif.ramstore=0;
  ccif.iwait=1;
  ccif.dwait=1;

  ccif.dload=ccif.ramload;
  ccif.iload=ccif.ramload;

  if(ccif.dWEN) begin
    ccif.ramWEN=1; ccif.ramREN=0;
    ccif.ramstore=ccif.dstore;
    ccif.ramaddr=ccif.daddr;
  end
  else if(ccif.dREN) begin
    ccif.ramWEN=0; ccif.ramREN=1;
    ccif.ramaddr=ccif.daddr;
    //ccif.dload=ccif.ramload;
  end
  else if(ccif.iREN) begin
    ccif.ramWEN=0; ccif.ramREN=1;
    ccif.ramaddr=ccif.iaddr;
    //ccif.iload=ccif.ramload;
  end
  else begin
    ccif.ramWEN=0;
    ccif.ramREN=0;
  end

  casez(ccif.ramstate)
    FREE: begin
    ccif.iwait=1;
    ccif.dwait=1;
    end
    BUSY: begin
    ccif.iwait=1;
    ccif.dwait=1;
    end
    ACCESS: begin
    ccif.iwait=(ccif.dREN||ccif.dWEN);//////// when (dren||dwen) is 1, iwait should wait
    ccif.dwait=~(ccif.dREN||ccif.dWEN);/////// when (dren||dwen) dwait should not wait
    end
    ERROR: begin
    ccif.iwait=1;
    ccif.dwait=1;
    end
  endcase
  end
endmodule
