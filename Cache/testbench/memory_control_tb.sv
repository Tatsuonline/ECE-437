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
  cache_control_if ccif ();//
   cpu_ram_if ramif();
   
  memory_control Mem(CLK, nRST, ccif);
  ram Ram(CLK, nRST, ramif);

   assign ramif.ramaddr=ccif.ramaddr;
   assign ramif.ramstore=ccif.ramstore;
   assign ramif.ramREN = ccif.ramREN;
   assign ramif.ramWEN = ccif.ramWEN;
  // assign ramif.ramload = ccif.ramload;   
 //  assign ramif.ramstate=ccif.ramstate;
   assign ccif.ramload = ramif.ramload;   
   assign ccif.ramstate= ramif.ramstate; 
   test prog(CLK, nRST);
  
endmodule
program test(
   input logic CLK,
   output logic nRST
);
  initial
    begin
    parameter tick=4;
    #(tick);
    ccif.dREN=0;
    ccif.dWEN=0;
    ccif.iREN=0;
    ccif.dstore=32'h0000;
    ccif.daddr=32'hFFFF;
    ccif.iaddr=32'hFFFF;         
    nRST=0;
    #(tick);
    nRST=1;
    #(tick);
    //////////////writting data to memory ////////////////
    ccif.dREN=0;
    ccif.dWEN=1;
    ccif.iREN=0;
    ccif.dstore=32'hFEEDFEED;
    ccif.daddr=32'hFEED;
    ccif.iaddr=32'h0000;
    #(30);
    $display("DATA STORING:Feeded FEEDFEED to address 0000FEED");
    ////////////data loading///////////////////////    
    ccif.dREN=1;
    ccif.dWEN=0;
    ccif.iREN=0;
    ccif.dstore=32'h0000;
    ccif.daddr=32'hFEED;
    ccif.iaddr=32'h0000;
    #(30);
    $display("DATA READ: READ from 0000FEED is : %h", ccif.ramload);
   
    $display("\nREADING instruction from 0000FEED");       
    //////////instruction loading/////////////////
    ccif.dREN=0;
    ccif.dWEN=0;
    ccif.iREN=1;
    ccif.dstore=32'h0000;
    ccif.daddr=32'h0000;
    ccif.iaddr=32'hFEED;
    #(30);
    $display("INSTR READ: READ from 0000FEED is : %h", ccif.ramload);
    
    ////////// dWEN and iREN at the same time //////////////
    $display("\ndWEN and iREN high at the same time");
    $display("Trying writting data BEEBBEEB to address 0000BEEB and");
    $display("trying read instruction from 0000DEAD");
    ccif.dREN=0;
    ccif.dWEN=1;
    ccif.iREN=1;
    ccif.dstore=32'hBEEB;
    ccif.daddr=32'hBEEB;
    ccif.iaddr=32'hDEAD;
    #(30);
    $display("ramLoad is : %h", ccif.ramload);
    #(30);
    $display("ramLoad is still : %h", ccif.ramload);
/////////////////////////////////////////////////////////////////       
    $display("\ntrying read from empty address....just curious");
    $display("\niRen is 1 and all others are zeros");
    ccif.dREN=0;
    ccif.dWEN=0;
    ccif.iREN=1;
    ccif.dstore=32'h0000;
    ccif.daddr=32'h0000;
    ccif.iaddr=32'h0000;
    #(30);
    $display("ramLoad is : %h", ccif.ramload);

       nRST=0;
       dump_memory();
   $finish;
    #(tick);

   

   
   
end
      task automatic dump_memory();
    string filename = "memcpu.hex";
    int memfd;

    //ramif.tbCTRL = 1;
    ccif.daddr = 0;
    ccif.dWEN = 0;
    ccif.dREN = 0;

    memfd = $fopen(filename,"w");
    if (memfd)
      $display("Starting memory dump.");
    else
      begin $display("Failed to open %s.",filename); $finish; end

    for (int unsigned i = 0; memfd && i < 16384; i++)
    begin
      int chksum = 0;
      bit [7:0][7:0] values;
      string ihex;

      ccif.daddr = i << 2;
      ccif.dREN = 1;
      repeat (4) @(posedge CLK);
      if (ccif.dload[0] === 0)
        continue;
      values = {8'h04,16'(i),8'h00,ccif.dload[0]};
      foreach (values[j])
        chksum += values[j];
      chksum = 16'h100 - chksum;
      ihex = $sformatf(":04%h00%h%h",16'(i),ccif.dload[0],8'(chksum));
      $fdisplay(memfd,"%s",ihex.toupper());
    end //for
    if (memfd)
    begin
    //  ccif.tbCTRL = 0;
      ccif.dREN = 0;
      $fdisplay(memfd,":00000001FF");
      $fclose(memfd);
      $display("Finished memory dump.");
    end
    endtask

endprogram
