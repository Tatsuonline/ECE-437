// mapped needs this
`include "hazard_unit_if.vh"
`include "pipeline_types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module hazard_unit_tb;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // test vars
  int v1 = 1;
  int v2 = 4721;
  int v3 = 25119;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  hazard_unit_if huif ();//
  // test program
   test PROG (.CLK(CLK), .nRST(nRST), .huif(huif));   

   
  // DUT
`ifndef MAPPED
  hazard_unit DUT(huif);
`else
  hazard_unit DUT(
    .\huif.dMemRead (huif.dMemRead),
    .\huif.ihit (huif.ihit),
    .\huif.dhit (huif.dhit),
    .\huif.halt (huif.halt),
    .\huif.Jr (huif.Jr),
    .\huif.Link (huif.Link),
    .\huif.pcGo (huif.pcGo),
    .\huif.dMemReq_exmem (huif.dMemReq_exmem),
    .\huif.flushEn (huif.flushEn),
    .\huif.ifid_rs (huif.ifid_rs),
    .\huif.ifid_rt (huif.ifid_rt),
    .\huif.idex_rt (huif.idex_rt),
    .\huif.stall (huif.stall),
    .\huif.pcWait (huif.pcWait),
    .\huif.ifidFlush (huif.ifidFlush),
    .\huif.idexFlush (huif.idexFlush),
    .\huif.exmemFlush (huif.exmemFlush),
    .\nRST (nRST),
    .\CLK (CLK)
  );
`endif

endmodule


program test
import cpu_types_pkg::*;
(
   input logic CLK,
   output logic nRST,
   hazard_unit_if.tb huif
 );

 parameter PERIOD=10;

   
initial 
begin

   #(PERIOD);
   

// Test 1: huif.idex_rt == huif.ifid_rs

   huif.dMemRead = 1'b1;
   huif.idex_rt = '1;
   huif.ifid_rs = '1;
   
   #(PERIOD);
   
   if (huif.stall.idexStall == 1)
     begin
	$display("Test 1 worked, man!");
     end
   else
     begin
	$display("Test 1 failed, man!");
     end

   #(PERIOD);

// Test 2: huif.idex_rt == huif.ifid_rt

   huif.dMemRead = 1'b1;
   huif.idex_rt = '1;
   huif.ifid_rs = '0;
   huif.ifid_rt = '1;
   
   #(PERIOD);
   
   if (huif.stall.idexStall == 1)
     begin
	$display("Test 2 worked, man!");
     end
   else
     begin
	$display("Test 2 failed, man!");
     end

   #(PERIOD);

// Test 3: huif.dMemReq_exmem
   huif.dMemRead=0;
   huif.idex_rt = 0;
   huif.ifid_rs = 0;
   huif.ifid_rt = 0;
   huif.dMemReq_exmem = 1'b1;
   
   #(PERIOD);
   
   if (huif.stall.allStall == 1)
     begin
	$display("Test 3 worked, man!");
     end
   else
     begin
	$display("Test 3 failed, man!");
     end

   #(PERIOD);

// Test 4: huif.dhit
   huif.dMemReq_exmem = 0;
   huif.dhit = 1;

   #(PERIOD);
   
   if (huif.stall.ifidStall == 1)
     begin
	$display("Test 4 worked, man!");
     end
   else
     begin
	$display("Test 4 failed, man!");
     end

   #(PERIOD);
   
// Test 5: huif.ihit
   huif.dhit = 0;
   huif.ihit = 1;

   #(PERIOD);
   
   if (huif.stall.noStall == 1)
     begin
	$display("Test 5 worked, man!");
     end
   else
     begin
	$display("Test 5 failed, man!");
     end

   #(PERIOD);

end

endprogram // test
   
