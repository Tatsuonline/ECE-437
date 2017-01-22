/*
  Eric Villasenor
  evillase@gmail.com

  datapath contains register file, control, hazard,
  muxes, and glue logic for processor
*/

// data path interface
`include "datapath_cache_if.vh"
`include "pipeline_types_pkg.vh"
// alu op, mips op, and instruction type
`include "cpu_types_pkg.vh"
`include "alu_if.vh"
`include "register_file_if.vh"
`include "control_unit_if.vh"


module datapath (
  input logic CLK, nRST,
  datapath_cache_if.dp dcif
);
  // import types
  import cpu_types_pkg::*;
  import pipeline_types_pkg::*;
   
  // pc init
  parameter PC_INIT = 0;

  //pipeline declarations//////////////////
   ifid_t ifidIn, ifidOut;
   idex_t idexIn, idexOut;
   exmem_t exmemIn, exmemOut;
   memwb_t memwbIn, memwbOut;   
   word_t thisExmem_wdat, thismemwb_wdat;
   pStall_t stall;
  /////////////////////////////////////////
   logic [1:0] check12;/////
   ///////////////////////////////////////////
   r_t rtype;
   i_t itype;
   //logic  Load, dRead, dWrite;
   word_t nextAddr, pcAddr, pc4;   
   logic [31:0] dAddr, dStore, dLoad;
   //////////////////////////////////////////
   register_file_if rfif();
   alu_if aluf();
   control_unit_if ctrif();   
   hazard_unit_if huif();
   forwarding_unit_if fuif();
   
   pc PC(.CLK(CLK), .nRST(nRST), .nextAddr(nextAddr), .pcAddr(pcAddr));   
   register_file RF(CLK, nRST, rfif);
   alu ALU(CLK, nRST, aluf);
   control_unit CTR(ctrif);
   
    
   pipeline_register PipeReg(
   .CLK(CLK), .nRST(nRST), 
   .ihit(huif.ihit), .dhit(huif.dhit), .ifidFlush(huif.ifid_flush), .idexFlush(huif.idex_flush),
   .ifidIn(ifidIn), .idexIn(idexIn), .exmemFlush(huif.exmem_flush),
   .exmemIn(exmemIn), .memwbIn(memwbIn),
   .ifidOut(ifidOut), .idexOut(idexOut), 
   .exmemOut(exmemOut), .memwbOut(memwbOut),
   .stall(stall)
			     );
   hazard_unit HAZ(huif);
   forwarding_unit FW(fuif);			   
   
   
   assign stall=huif.stall;
   //req unit signal //
   assign dcif.imemREN=~memwbOut.halt;
   assign dcif.dmemWEN=exmemOut.dMemWrite;
   assign dcif.dmemREN=exmemOut.dMemRead;   
   /////////////////////
   assign ctrif.opcode=rtype.opcode;
   ///////////////////////////
   //reg file sig//

   
   //      IF/ID/EX/MEM/WR
   //      IF/ID
   assign ifidIn.imemload=dcif.imemload;
   assign ifidIn.pc4 = pc4;
   assign ifidIn.rs=dcif.imemload[25:21];
   assign ifidIn.rt=dcif.imemload[20:16];
   assign ifidIn.rd=dcif.imemload[15:11];
   /////////////////////////////////

   //      ID/EX
   assign idexIn.Shamt = ctrif.Shamt;
   assign idexIn.Alusrc = ctrif.Alusrc;
   assign idexIn.MemtoReg = ctrif.MemtoReg;
   
   assign idexIn.Branch = ctrif.Branch;
   assign idexIn.Equal = ctrif.Equal;
   assign idexIn.Jump = ctrif.Jump;
   assign idexIn.RegWrite = ctrif.RegWrite;
   //assign idexIn.Zero = luf.zf;
   
   assign idexIn.PCWait = ctrif.PCWait;
   assign idexIn.RegDest = ctrif.RegDest;
   assign idexIn.Link = ctrif.Link;   
   assign idexIn.Ext = ctrif.Ext;
   assign idexIn.Jr = ctrif.Jr;
   assign idexIn.LUI = ctrif.LUI;
   assign idexIn.halt = ctrif.halt;
   
   
   assign idexIn.rs = ifidOut.rs;
   assign idexIn.rt = ifidOut.rt;
   assign idexIn.rd = ifidOut.rd;
   assign idexIn.funct = rtype.funct;
   assign idexIn.rdat1 = rfif.rdat1;
   assign idexIn.rdat2 = rfif.rdat2;
   assign idexIn.pc4 = ifidOut.pc4;///////////////
   assign idexIn.Alu_Op = ctrif.Alu_Op;
   assign idexIn.opcode = ctrif.opcode;
   assign idexIn.dMemRead=ctrif.dMemRead;
   assign idexIn.dMemWrite=ctrif.dMemWrite;
   
   assign idexIn.Load = ctrif.Load;
   assign idexIn.shamt = ifidOut.imemload[10:6];
   assign idexIn.instr = ifidOut.imemload;
   
   //    EX/MEM    //
   assign exmemIn.pout = aluf.pout;
   assign exmemIn.RegWrite = idexOut.RegWrite;
   assign exmemIn.Link = idexOut.Link ;
   assign exmemIn.Jump = idexOut.Jump ;
   assign exmemIn.halt = idexOut.halt ;
   assign exmemIn.dMemRead = idexOut.dMemRead & ~exmemOut.halt;
   assign exmemIn.dMemWrite = idexOut.dMemWrite &~exmemOut.halt;
   //assign exmemIn.rdat2 = idexOut.rdat2 ;
   assign exmemIn.pc4 = idexOut.pc4 ;
   //assign exmemIn.wsel = rfif.wsel;
   assign exmemIn.opcode = idexOut.opcode ;
   assign exmemIn.Load = idexOut.Load;
   assign exmemIn.MemtoReg = idexOut.MemtoReg; 
   assign exmemIn.instr=idexOut.instr;
   assign exmemIn.Branch=idexOut.Branch;
   assign exmemIn.Equal=idexOut.Equal;
   assign exmemIn.rs=idexOut.rs;
   assign exmemIn.rd=idexOut.rd;
   assign exmemIn.rt=idexOut.rt;
   assign exmemIn.Zero=aluf.zf;
   //assign exmemIn.dmemstore=dStore;
   /////////////////////////////////////////////////

   //    MEM/WB    //
   assign memwbIn.dmemload = dcif.dmemload;
   //assign memwbIn.dmemload = exmemOut.instr;/////////////////////////
   assign memwbIn.wdat = exmemOut.wdat;
   assign memwbIn.halt = exmemOut.halt;
   assign memwbIn.RegWrite = exmemOut.RegWrite;
   assign memwbIn.dMemRead = exmemOut.dMemRead;
   assign memwbIn.wsel = exmemOut.wsel;
   assign memwbIn.pc4 = exmemOut.pc4;
   assign memwbIn.opcode = exmemOut.opcode;
   assign memwbIn.Link = exmemOut.Link;
   assign memwbIn.Jump = exmemOut.Jump;
   assign memwbIn.MemtoReg = exmemOut.MemtoReg;
   assign memwbIn.Branch=exmemIn.Branch;
   assign memwbIn.Equal=exmemIn.Equal;
   assign memwbIn.rd = exmemOut.rd;
   assign memwbIn.instr = exmemOut.instr;
   //assign memwbIn.dmemstore=dStore;
   ////////////////////////////
   
   assign ctrif.instr=ifidOut.imemload;
   //assign ctrif.dhit=(dcif.dhit);
   
   assign dcif.imemaddr=pcAddr;
   assign dcif.dmemaddr=dAddr;
   assign dcif.dmemstore=dStore;

   
   assign rfif.rsel1=ifidOut.imemload[25:21];
   assign rfif.rsel2=ifidOut.imemload[20:16];
   assign rfif.WEN = memwbOut.RegWrite;
   assign rfif.wsel = memwbOut.wsel;

   
   assign huif.dMemRead = idexOut.dMemRead;
   //assign huif.dMemRead = exmemOut.dMemRead;
   
   assign huif.dMemRead_exmem = exmemOut.dMemRead;////
   assign huif.dMemWrite = exmemOut.dMemWrite;
//   assign huif.dMemWrite = idexOut.dMemWrite;
   assign huif.ihit = dcif.ihit;
   assign huif.dhit = dcif.dhit;
   assign huif.halt = memwbOut.halt;
   //assign huif.isJump = (exmemOut.Jump);
   //assign huif.isBr = (exmemOut.Branch&exmemOut.Equal&exmemOut.Zero)|(exmemOut.Branch&!exmemOut.Equal&!exmemOut.Zero);      
   assign huif.isJump = (idexOut.Jump);
   assign huif.isBr = (idexOut.Branch&idexOut.Equal&aluf.zf)|(idexOut.Branch&!idexOut.Equal&!aluf.zf);      
   
   assign huif.ifid_opcode = ifidOut.imemload[31:26];
   assign huif.ifid_rs = ifidOut.imemload[25:21];
   assign huif.ifid_rt = ifidOut.imemload[20:16];
   
   assign huif.idex_rt=idexOut.rt;
   assign huif.idex_rd=idexOut.rd;
   assign huif.idex_rs=idexOut.rs;
   
   assign huif.exmem_rt=exmemOut.rt;
   assign huif.exmem_rd=exmemOut.rd; 
   assign huif.exmem_rs=exmemOut.rs;
   assign huif.exmem_wsel=exmemOut.wsel;
   //assign huif.exmem_rs=idexOut.rs;
   assign huif.memwb_wsel=memwbOut.wsel;   
   assign huif.Equal = exmemOut.Equal;   
   assign huif.RegWrite = idexOut.RegWrite;
   assign huif.alusrc = idexOut.Alusrc;
   
   
   assign fuif.idex_rt = idexOut.rt;
   assign fuif.idex_rs = idexOut.rs;
   assign fuif.exmem_RegW = exmemOut.RegWrite;
   assign fuif.memwb_RegW = memwbOut.RegWrite;
   assign fuif.exmem_rd=exmemOut.rd; ////
   assign fuif.memwb_rd=memwbOut.rd; ////
   assign fuif.exmem_wsel=exmemOut.wsel;
   assign fuif.memwb_wsel=memwbOut.wsel;
   assign fuif.dMemWrite = idexOut.dMemWrite;
   assign fuif.exmem_dMemRead=exmemOut.dMemRead;
   assign fuif.memwb_dMemRead=memwbOut.dMemRead;
    always_ff @ (posedge CLK, negedge nRST) begin
     if(!nRST) begin
	dcif.halt<=0;        
     end
     else begin
	dcif.halt<=memwbOut.halt;        
     end
  end


   assign dAddr = exmemOut.pout;
   //assign dStore = exmemOut.rdat2;///////////////////////
   assign dLoad = ifidOut.imemload;   

   always_comb begin
check12=0;
      //rtype=dcif.imemload;
      //itype=dcif.imemload;
      rtype=ifidOut.imemload;
      itype=ifidOut.imemload;
      pc4=pcAddr+4;
       
      if(huif.ihit) begin // || dcif.dhit) begin
	 if(!idexOut.dMemRead && !idexOut.dMemWrite) begin
	    if(idexOut.Jr) begin
	       nextAddr=aluf.pout;
	    end
	    else begin
	       /*if(idexOut.Jump) begin
		  nextAddr={idexOut.pc4[31:28], (idexOut.instr[27:0]<<2)};
	       end*/
	       if(idexOut.Jump) begin //&&(!idexOut.Link)) begin
		  nextAddr={idexOut.pc4[31:28], (idexOut.instr[27:0]<<2)};
	       end
	       else begin
		  if(idexOut.Branch && idexOut.Equal && aluf.zf) begin //beq
		     nextAddr=(idexOut.pc4+word_t'(($signed(idexOut.instr[15:0]<<2))));
		  end
		  else if (idexOut.Branch&& !idexOut.Equal && !aluf.zf) begin		     
		     nextAddr=(idexOut.pc4+word_t'(($signed(idexOut.instr[15:0]<<2))));
		  end
		  else if(exmemOut.dMemRead&&(fuif.fwa||fuif.fwb)) begin
		    	    check12=1;
		     nextAddr=pcAddr;  
		  end
		  else begin
		     nextAddr=pc4;
		  end
	         end 
	       end //else
	      end//idexout.dmemread
	   else begin
	   nextAddr=pcAddr;
	   end // else: !if(!ctrif.PCWait)       
      end // if (dcif.ihit||dcif.dhit)
      else begin //when there is no hit
	 if(!idexOut.dMemRead && !idexOut.dMemWrite) begin
	    if(idexOut.Jr) begin
	       nextAddr=aluf.pout;
	    end
	    else begin
	       /*if(idexOut.Jump) begin
		  nextAddr={idexOut.pc4[31:28], (idexOut.instr[27:0]<<2)};
	       end*/
	       if(idexOut.Jump) begin //&&(!idexOut.Link)) begin
		  nextAddr={idexOut.pc4[31:28], (idexOut.instr[27:0]<<2)};
	       end
	       else begin
		  if(idexOut.Branch && idexOut.Equal && aluf.zf) begin //beq
		     nextAddr=(idexOut.pc4+word_t'(($signed(idexOut.instr[15:0]<<2))));
		  end
		  else if (idexOut.Branch&& !idexOut.Equal && !aluf.zf) begin		     
		     nextAddr=(idexOut.pc4+word_t'(($signed(idexOut.instr[15:0]<<2))));
		  end
		  else if(exmemOut.dMemRead&&(fuif.fwa||fuif.fwb)) begin
		     nextAddr=pcAddr;  check12=2;
		  end		  
		  else begin
		     nextAddr=pc4;
		  end
	       end 
	    end //else
          end
          else begin
	    nextAddr=pcAddr;
	  end
      end // else: !if(dcif.ihit||dcif.dhit)

      //if(ctrif.Link) begin
      if (memwbOut.Link) begin      	
	rfif.wdat = memwbOut.pc4;
        dStore=rfif.wdat;/////
      end
      else if(memwbOut.MemtoReg) begin
	rfif.wdat = memwbOut.dmemload;
        dStore=exmemOut.rdat2;/////
      end
      else begin
	rfif.wdat = memwbOut.wdat;
        dStore=exmemOut.rdat2;/////
      end
      
      if (idexOut.Link) begin
	exmemIn.wsel = 31;//5'h31;
	  exmemIn.wdat=aluf.pout;
      end      
      else begin
	 //if (ctrif.RegDest) begin
	 if (idexOut.RegDest||idexOut.Load) begin
	    exmemIn.wsel=idexOut.instr[20:16];
	 end
	 else begin
	   exmemIn.wsel = idexOut.instr[15:11];
	 end // else: !if(ctrif.RegDest)

	if(idexOut.LUI) begin
	  exmemIn.wdat={idexOut.instr[15:0], 16'b0};
	end
	else begin
	  exmemIn.wdat=aluf.pout;
	end
      end // else: !if(ctrif.Link)
      /////////////////////////////////
      if(fuif.fwa==2'b00) begin
         aluf.port_a=idexOut.rdat1;
      end
      else if(fuif.fwa==2'b10) begin
	 aluf.port_a=exmemOut.wdat;
      end
      else begin
	 if(memwbOut.MemtoReg&&(!memwbOut.dMemRead)) begin
	 aluf.port_a=memwbOut.dmemload;
	 end
	 else begin
         aluf.port_a=memwbOut.wdat;	 
         end
      end
      aluf.opcode=idexOut.Alu_Op;
      ////////////////////////////  
   if(fuif.fwb==2'b00) begin
        if(idexOut.Shamt) begin
           aluf.port_b=idexOut.shamt;
        end else begin
        if(idexOut.Alusrc) begin
	    if(idexOut.Ext) begin //sign
	      aluf.port_b=$signed(idexOut.instr[15:0]);//idexOut.imemload[15:0]);
	    end 
	    else begin 
	      aluf.port_b={16'b0, idexOut.instr[15:0]};
	    end	  
        end
 	else begin
	  aluf.port_b=idexOut.rdat2;
	end
       end
   end
   else if(fuif.fwb==2'b10)begin //forwading c1
      aluf.port_b=exmemOut.wdat;
   //aluf.port_b=exmemOut.dmemload;
   end
   else begin //forwarding c2
      //aluf.port_b=memwbOut.wdat;///////////////
      if(memwbOut.MemtoReg) begin
      aluf.port_b=memwbOut.dmemload;
      end
      else begin
      aluf.port_b=memwbOut.wdat;
      end
   end
   ////////////////////////////////////////////////////
   if(!memwbOut.Link) begin
      if(fuif.fws==2'b00) begin
	dStore = exmemOut.rdat2;
	exmemIn.rdat2 = idexOut.rdat2 ;
      end
      else if(fuif.fws==2'b10) begin
	dStore=exmemOut.wdat;
	exmemIn.rdat2=dStore;
      end	
      else begin //01 memwb fw
	dStore=memwbOut.wdat;
	exmemIn.rdat2=dStore;    
      end
   end
   else begin
     exmemIn.rdat2=idexOut.rdat2;
   end
   /////////////////////////////////////////////////
  end

   
endmodule

