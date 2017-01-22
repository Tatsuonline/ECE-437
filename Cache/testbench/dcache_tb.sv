`include "cache_control_if.vh"
`include "datapath_cache_if.vh"
`include "cpu_ram_if.vh"
`include "cache_types_pkg.vh"


`timescale 1 ns / 1 ns

module dcache_tb;
   cache_control_if ccif();
   datapath_cache_if dcif();
   cpu_ram_if ramif();
   
   logic CLK = 0;
   logic nRST;
   parameter PERIOD = 10;

   
   test PROG(CLK, nRST, dcif, ccif);
   dcache DUT(CLK, nRST, dcif, ccif);
   memory_control MC(CLK, nRST, ccif);
   ram RAM(CLK, nRST, ramif);

   always #(PERIOD/2) CLK++;
   assign ccif.ramstate = ramif.ramstate;
   assign ccif.ramload = ramif.ramload;
   assign ramif.ramWEN = ccif.ramWEN;
   assign ramif.ramstore = ccif.ramstore;
   assign ramif.ramREN = ccif.ramREN;
   assign ramif.ramaddr = ccif.ramaddr;

endmodule // dcache_tb

program test (
	      input logic CLK,
	      output logic nRST,
	      datapath_cache_if.dp dcif,
	      cache_control_if.cc ccif
	      );

   import cpu_types_pkg::*,
   cache_types_pkg::*;
   parameter PERIOD = 10;
   
   // test cases
   initial
     begin
	// Reset everything!
	nRST = 0;
	#(PERIOD*2);
	// Stop resetting!
	nRST = 1;
	#(PERIOD*2); // Currently in IDLE state.
   	dcif.dmemaddr = 0;
	dcif.dmemREN = 0;
	dcif.dmemstore = 32'd666;
	dcif.dmemWEN = 1;
	dcif.dmemREN = 0;
         #(PERIOD*2);

	// TEST 1: UPDATE 1 State 

	dcif.dmemWEN = 0;
	dcif.dmemREN = 1;
	//#(PERIOD*2);
	dcif.dmemaddr = 32'd46664;
	dcif.dmemREN = 1; // Read Enabled
#(PERIOD*2);
#(PERIOD*2);
#(PERIOD*2);  //storing done
#(PERIOD*2);  //storing done
	if (dcif.dmemload ==32'd666 ) begin
          $display("TEST1: Passed! 666 was loaded from address 46664");
        end
	else begin 
	  $display("TEST1: Failllll %4d", dcif.dmemload);
        end
	
	// TEST 2: same address, conflicts.....
	#(PERIOD*2);
   	dcif.dmemaddr = 0;
	dcif.dmemREN = 0;
	dcif.dmemstore = 32'hDEAD666;
	dcif.dmemWEN = 1;
	dcif.dmemREN = 0;
#(PERIOD*2);  //storing done
#(PERIOD*2);  //storing done
#(PERIOD*2);  //storing done
#(PERIOD*2);  //storing done

	dcif.dmemWEN = 0;
	dcif.dmemREN = 1;
	dcif.dmemaddr = 32'd46664;
	dcif.dmemREN = 1; // Read Enabled
 #(PERIOD*2);  //storing done
 #(PERIOD*2);  //storing done
 #(PERIOD*2);  //storing done
 #(PERIOD*2);  //storing done
 #(PERIOD*2);  //storing done
 #(PERIOD*2);  //storing done
	if (dcif.dmemload  ==32'd666 ) begin
          $display("TEST2: Passed! %8d is written to memory", dcif.dmemload);
        end
	else begin 
	  $display("TEST2: Failllll %4d", dcif.dmemload);
        end


	// TEST 3: Different address
	#(PERIOD*2);

	dcif.dmemaddr = 32'd63048;
	dcif.dmemREN = 0;
	dcif.dmemstore = 32'hBAAAAAAA;
	dcif.dmemWEN = 1;
	dcif.dmemREN = 0;
         #(PERIOD*2);  //storing done


//	dcif.dmemWEN = 0;
//	dcif.dmemREN = 1;
//	dcif.dmemaddr = 32'd63048;
//	dcif.dmemREN = 1; // Read Enabled

	if (dcif.dmemload == 32'hBAAAAAAA ) begin
          $display("TEST3: Passed! %8d is written to memory", dcif.dmemload);
        end
	else begin 
	  $display("TEST3: Failllll %4d", dcif.dmemload);
        end
	#(PERIOD*2);
	dcif.dmemaddr = 32'd63052;
	dcif.dmemREN = 0;
	dcif.dmemstore = 32'hBAAAAAAB;
	dcif.dmemWEN = 1;
	dcif.dmemREN = 0;
         #(PERIOD*2);  //storing done


        dcif.halt=1;
	#(PERIOD*2);
	$display("\nHALTT.....");
	#(PERIOD*2);
	#(PERIOD*2);
	#(PERIOD*20);
	#(PERIOD*20);
	#(PERIOD*20);

	
	$display("\nGood Job....Farewell.....");
	$finish;
     end


endprogram


  
