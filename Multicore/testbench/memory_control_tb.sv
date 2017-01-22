/* This cache control testbench is full of hate! */

// mapped needs this
`include "cpu_types_pkg.vh"
`include "cache_control_if.vh"
`include "cpu_ram_if.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module memory_control_tb;

   parameter PERIOD = 10;

   logic CLK = 0, nRST;


   // clock
   always #(PERIOD/2) CLK++;

   // interface
   cache_control_if #(.CPUS(2)) ccif ();
   cpu_ram_if ramif();
   memory_control Mem(CLK, nRST, ccif);
   ram Ram(CLK, nRST, ramif);

   assign ramif.ramaddr = ccif.ramaddr;
   assign ramif.ramstore = ccif.ramstore;
   assign ramif.ramREN = ccif.ramREN;
   assign ramif.ramWEN = ccif.ramWEN;
   assign ccif.ramload = ramif.ramload;   
   assign ccif.ramstate = ramif.ramstate; 
   test prog(CLK, nRST);
   
endmodule

program test(
	     input logic CLK,
	     output logic nRST
	     );
   
   initial
     begin
	parameter deathclock = 4;
	#(deathclock);

	/* Test 0: Reset Test! */

	/* Cache 1 */
	ccif.dREN[0] = 0;
	ccif.dWEN[0] = 0;
	ccif.iREN[0] = 0;
	ccif.dstore[0] = 0;
	ccif.daddr[0] = 0;
	ccif.iaddr[0] = 0;

	ccif.ccwrite[0]=0;
	ccif.cctrans[0]=0;
	/* Cache 2 */
	ccif.dREN[1] = 0;
	ccif.dWEN[1] = 0;
	ccif.iREN[1] = 0;
	ccif.dstore[1] = 0;
	ccif.daddr[1] = 0;
	ccif.iaddr[1] = 0;
	ccif.ccwrite[1]=0;
	ccif.cctrans[1]=0;	
	nRST = 0; // Reset everything!
	#(deathclock);
	nRST = 1; // Back to normal!
	#(deathclock);

	/* Test 1: MSI Transition Test! */

	// State: Idle
	
	/* Cache 1 */
	ccif.dREN[0] = 0;
	ccif.dWEN[0] = 1; // Write all the data to daddr!
	ccif.iREN[0] = 0;
	ccif.dstore[0] = 32'hDEAF;
	ccif.daddr[0] = 32'hFFFF;
	ccif.iaddr[0] = 32'hFFFF;
	ccif.ccwrite[0]=0;
	ccif.cctrans[0]=0;
	#(deathclock); // Death approaches.
	#(deathclock); // Death approaches.
	
	/* Cache 2 */
	ccif.dREN[1] = 1; // Read data from daddr!
	ccif.dWEN[1] = 0;
	ccif.iREN[1] = 0;
	ccif.dstore[1] = 0;
	ccif.daddr[1] = 32'hFFFF; // Reading from empty cache! Shieeeet!
	ccif.iaddr[1] = 0;
	ccif.ccwrite[1]=0;
	ccif.cctrans[1]=0;
	#(deathclock); // Death approaches.
	
	// State: Snoop_Dogg
	
	if (ccif.iwait[0] == 1)
	  begin
	     $display("Test 1 passed!");
	  end
	else if (ccif.iwait[0] == 0)
	  begin
	     $display("Test 1 failed!");
	  end

	/* Cache 1 */
	ccif.dREN[0] = 0;
	ccif.dWEN[0] = 0; 
	ccif.iREN[0] = 0;
	ccif.dstore[0] = 0;
	ccif.daddr[0] = 0;
	ccif.iaddr[0] = 0;
	ccif.ccwrite[0]=0;
	ccif.cctrans[0]=0;

	/* Cache 2 */
	ccif.dREN[1] = 0; 
	ccif.dWEN[1] = 0;
	ccif.iREN[1] = 0;
	ccif.dstore[1] = 0;
	ccif.daddr[1] = 0; 
	ccif.iaddr[1] = 0;
	ccif.ccwrite[1]=1;
	ccif.cctrans[1]=1;
	#(deathclock); // Death approaches.
	#(deathclock); // Death approaches.
	#(deathclock); // Death approaches.
	#(deathclock); // Death approaches.

	/* Test 2: Cache Transfer Test! */
	
	// State: Cache_Transfer
	
	/* Cache 1 */
	ccif.dREN[0] = 0;
	ccif.dWEN[0] = 0;
	ccif.iREN[0] = 0;
	ccif.dstore[0] = 0;
	ccif.daddr[0] = 0;
	ccif.iaddr[0] = 0;
	ccif.ccwrite[0]=0;
	ccif.cctrans[0]=0;	
	/* Cache 2 */
	ccif.dREN[1] = 0;
	ccif.dWEN[1] = 0;
	ccif.iREN[1] = 0;
	ccif.dstore[1] = 0;
	ccif.daddr[1] = 0;
	ccif.iaddr[1] = 0;
	ccif.ccwrite[1]=0;
	ccif.cctrans[1]=0;	
	#(deathclock / 2);
		
	
	#(deathclock);
	
	// State: Idle

	/* Cache 1 */
	ccif.dREN[0] = 1;
	ccif.dWEN[0] = 0;
	ccif.iREN[0] = 0;
	ccif.dstore[0] = 0;
	ccif.daddr[0] =  32'hFFFF;
	ccif.iaddr[0] = 0;
	ccif.ccwrite[0]=0;
	ccif.cctrans[0]=0;	
	/* Cache 2 */
	ccif.dREN[1] = 1;
	ccif.dWEN[1] = 0;
	ccif.iREN[1] = 0;
	ccif.dstore[1] = 0;
	ccif.daddr[1] = 32'hFFFF;
	ccif.iaddr[1] = 0;
	ccif.ccwrite[1]=0;
	ccif.cctrans[1]=0;
	#(deathclock);
	
	if (ccif.dload[0] == ccif.dload[1])
	  begin
	     $display("Test 2 passed!");
	  end
	else if (ccif.iwait[0] == 0)
	  begin
	     $display("Test 2 failed!");
	  end



	
	nRST = 0;
	$finish;
	#(deathclock);
	
     end
endprogram
