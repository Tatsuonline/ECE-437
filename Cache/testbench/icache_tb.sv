`include "cache_control_if.vh"
`include "datapath_cache_if.vh"
`include "cpu_ram_if.vh"
`include "cache_types_pkg.vh"


`timescale 1 ns / 1 ns

module icache_tb;
   cache_control_if ccif();
   datapath_cache_if dcif();
   cpu_ram_if ramif();
   
   logic CLK = 0;
   logic nRST;
   parameter PERIOD = 10;

   
   test PROG(CLK, nRST, dcif, ccif);
   icache DUT(CLK, nRST, dcif, ccif);
   memory_control MC(CLK, nRST, ccif);
   ram RAM(CLK, nRST, ramif);

   always #(PERIOD/2) CLK++;
   
   assign ccif.ramstate = ramif.ramstate;
   assign ccif.ramload = ramif.ramload;
   assign ramif.ramWEN = ccif.ramWEN;
   assign ramif.ramstore = ccif.ramstore;
   assign ramif.ramREN = ccif.ramREN;
   assign ramif.ramaddr = ccif.ramaddr;

endmodule // icache_tb

program test (
	      input logic CLK,
	      output logic nRST,
	      datapath_cache_if.dp dcif,
	      cache_control_if.cc ccif
	      );

   import cpu_types_pkg::*,
   cache_types_pkg::*;
   parameter PERIOD = 10;

   tempRow_t addr;
   
   // test cases
   initial
     begin
	// Reset everything!
	nRST = 0;
	#(PERIOD*2);
	// Stop resetting!
	nRST = 1;
	#(PERIOD*2);

	$display("Starting the first miss.");

	//@(posedge CLK);
	ccif.iaddr = 0;
	ccif.iREN = 0;
	ccif.dWEN = 1;
	ccif.dREN = 0;
	ccif.dstore = 32'hDEADDEAF;
	ccif.daddr = 32'd6664;
	#(PERIOD*2);
	ccif.dWEN = 0;

	#(PERIOD*4);

// 	addr = 32'd666;

	dcif.imemREN = 1'b1;
	dcif.imemaddr = 32'd6664;

	// TEST 1:MISS
	#(PERIOD*2);
	if (!dcif.ihit) begin
          $display("TEST1: Passed");
	  $display("%h at addr %d was Read. Updating %h", dcif.imemload, dcif.imemaddr, 32'hDEADDEAF);
        end
	else begin 
	  $display("TEST1: Failllll: %h at addr %d  GOLDEN: %h", dcif.imemload, dcif.imemaddr, 32'hDEADDEAF);
        end
	
	// TEST 2: same address, cache hit

	#(PERIOD*2);
	if (dcif.imemload == 32'hDEADDEAF) begin
	  $display("TEST 2 passed");
	  $display("%h at addr %d was Read. GOLDEN: %h", dcif.imemload, dcif.imemaddr, 32'hDEADDEAF);
        end
	else begin
	  $display("TEST2: Faillllll: read %h at addr %d GOLDEN: %h", dcif.imemload, dcif.imemaddr, 32'hDEADDEAF);
        end


//Test3
	ccif.iaddr = 0;
	ccif.iREN = 0;
	ccif.dWEN = 1;
	ccif.dREN = 0;
	ccif.dstore = 32'hBEEF6666;
	ccif.daddr = 32'd23048;
	#(PERIOD*2);

	ccif.dWEN = 0;
	#(PERIOD*4);

	dcif.imemREN = 1'b1;
	dcif.imemaddr = 32'd23048;
	#(PERIOD*2);


	#(PERIOD*2);
	if (dcif.imemload == 32'hBEEF6666) begin
          $display("TEST3: Passed");
	  $display("%h at addr %d was Read. Updating %h", dcif.imemload, dcif.imemaddr, 32'hBEEF6666);
        end
	else begin 
	  $display("TEST3: Failllll: %h at addr %d  GOLDEN: %h", dcif.imemload, dcif.imemaddr, 32'hDEADDEAF);
        end



	$display("\nGood Job....Farewell.....");
	$finish;
     end

endprogram
