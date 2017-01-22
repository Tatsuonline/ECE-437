/*
  Eric Villasenor
  evillase@gmail.com

  datapath contains register file, control, hazard,
  muxes, and glue logic for processor
*/

// data path interface
`include "datapath_cache_if.vh"

// alu op, mips op, and instruction type
`include "cpu_types_pkg.vh"
`include "pipeline_types_pkg.vh"

module datapath (
  input logic CLK, nRST,
  datapath_cache_if.dp dpif
);
  // import types
  import cpu_types_pkg::*;
  import pipeline_types_pkg::*;
  // pc init
  parameter PC_INIT = 0;

register_file_if rfif();
alu_if aluif();
control_unit_if cuif();
//request_unit_if ruif();
decoder_if decodeif();
hazard_unit_if huif();
forwarding_unit_if fuif();

//// pipeline declaration
ifid_t ifidIn, ifidOut;
idex_t idexIn, idexOut;
exmem_t exmemIn, exmemOut;
memwb_t memwbIn, memwbOut;
word_t exmemWdat, memwbWdat;
pStall_t stall;
//////

pipeline_register PipeReg(
   .CLK(CLK), .nRST(nRST), 
   .ihit(huif.ihit), .dhit(huif.dhit), .ifidFlush(huif.ifidFlush), .idexFlush(huif.idexFlush),
   .ifidIn(ifidIn), .idexIn(idexIn), .exmemFlush(huif.exmemFlush),
   .exmemIn(exmemIn), .memwbIn(memwbIn),
   .ifidOut(ifidOut), .idexOut(idexOut), 
   .exmemOut(exmemOut), .memwbOut(memwbOut),
   .stall(stall)
);



////////connection
logic pcWEN;
word_t nextAddr, pcAddr, pc4, pcBranch, pcJump;
// changing pc to ihit dependant
//assign pcWEN = (dpif.ihit);////////
assign pcWEN = ((~huif.pcWait && (dpif.ihit)) || huif.pcGo) & (!stall.idexStall);


pc PC(.CLK(CLK), .nRST(nRST), .nextAddr(nextAddr), .pcAddr(pcAddr), .pcWEN(pcWEN));
alu ALU(aluif);
register_file RegFile(.CLK(CLK), .nRST(nRST), .rfif(rfif));
//request_unit ReqUnit(.CLK(CLK), .nRST(nRST), .ruif(ruif));
control_unit CtrUnit(cuif);
decoder DECODE(decodeif);
forwarding_unit FW(fuif);
hazard_unit HAZ(huif);	
//////////////////
////////////////////////hazzz//////////////
j_t jumper;
assign jumper = dpif.imemload;
/////////////////////////////////////////

// decoder & main
//assign decodeif.instr_d = dpif.imemload;
//assign dpif.imemaddr=pcAddr;
assign ifidIn.imemload = dpif.imemload;
assign ifidIn.pc4=pc4;
assign decodeif.instr_d = ifidOut.imemload;
assign ifidIn.rs=dpif.imemload[25:21];
assign ifidIn.rt=dpif.imemload[20:16];
assign ifidIn.rd=dpif.imemload[15:11];
assign ifidIn.pc=pcAddr;
//assign dpif.dmemaddr = aluif.pout;
//assign dpif.dmemstore = rfif.rdat2;

//idex//
   assign idexIn.pc=ifidOut.pc;
   assign idexIn.ShamtE = cuif.Shamt;
   assign idexIn.Alusrc = cuif.Alusrc;
   assign idexIn.MemtoReg = cuif.MemtoReg;
   assign idexIn.Equal = cuif.Equal;
   assign idexIn.Branch = cuif.Branch;
   assign idexIn.beq = cuif.beq;
   assign idexIn.bne = cuif.bne;

   assign idexIn.Jump = cuif.Jump;
   assign idexIn.RegWrite = cuif.RegWrite;
   //assign idexIn.Zero = luf.zf;
   
   assign idexIn.PCWait = cuif.PCWait;
   assign idexIn.RegDest = cuif.RegDest;
   assign idexIn.Link = cuif.Link;   
   assign idexIn.Ext = cuif.Ext;
   assign idexIn.Jr = cuif.Jr;
   assign idexIn.LUI = cuif.LUI;
   assign idexIn.halt = cuif.halt;

  
   assign idexIn.rdat1 = rfif.rdat1;
   assign idexIn.rdat2 = rfif.rdat2;
   assign idexIn.pc4 = ifidOut.pc4;
   assign idexIn.alu_op = cuif.alu_op;
   assign idexIn.opcode = cuif.opcode;
   assign idexIn.dMemRead=cuif.dRead;
   assign idexIn.dMemWrite=cuif.dWrite;   
   assign idexIn.ImmtoReg = cuif.ImmtoReg;

   assign idexIn.rs = decodeif.rs; //ifidOut
   assign idexIn.rt = decodeif.rt;
   assign idexIn.rd = decodeif.rd;
   assign idexIn.funct = decodeif.funct;
   assign idexIn.shamt = decodeif.shamt;
   assign idexIn.imm = decodeif.imm;
   assign idexIn.instr = ifidOut.imemload;
////////////

///exmem ////
   assign exmemIn.pc = idexOut.pc;
   assign exmemIn.pout = aluif.pout;
   assign exmemIn.RegWrite = idexOut.RegWrite;
   assign exmemIn.Link = idexOut.Link ;
   assign exmemIn.Jump = idexOut.Jump ;
   assign exmemIn.halt = idexOut.halt ;
   assign exmemIn.dMemRead = idexOut.dMemRead & ~exmemOut.halt;
   assign exmemIn.dMemWrite = idexOut.dMemWrite & ~exmemOut.halt;
   assign exmemIn.pc4 = idexOut.pc4 ;
   assign exmemIn.imm = idexOut.imm;
//delete later
   assign exmemIn.opcode = idexOut.opcode ;
   assign exmemIn.MemtoReg = idexOut.MemtoReg; 
   assign exmemIn.ImmtoReg = idexOut.ImmtoReg;
   assign exmemIn.instr=idexOut.instr;
   assign exmemIn.Branch=idexOut.Branch;
   assign exmemIn.Equal=idexOut.Equal;
   assign exmemIn.rs=idexOut.rs;
   assign exmemIn.rd=idexOut.rd;
   assign exmemIn.rt=idexOut.rt;
   assign exmemIn.Zero=aluif.zf;

///////////
////memwb////
   assign memwbIn.pc = exmemOut.pc;
   assign memwbIn.dmemload = dpif.dmemload;
   assign memwbIn.wdat = exmemWdat;
   assign memwbIn.wsel = exmemOut.wsel;
   assign memwbIn.halt = exmemOut.halt;
   assign memwbIn.RegWrite = exmemOut.RegWrite;
   assign memwbIn.dMemRead = exmemOut.dMemRead;
   assign memwbIn.pc4 = exmemOut.pc4;

////////delete later
   assign memwbIn.opcode = exmemOut.opcode;
   assign memwbIn.Link = exmemOut.Link;
   assign memwbIn.Jump = exmemOut.Jump;
   assign memwbIn.MemtoReg = exmemOut.MemtoReg;
   assign memwbIn.Branch=exmemIn.Branch;
   assign memwbIn.Equal=exmemIn.Equal;
   assign memwbIn.rd = exmemOut.rd;
   assign memwbIn.instr = exmemOut.instr;
//////////// hazard
   assign huif.ihit = dpif.ihit;
   assign huif.dhit = dpif.dhit;
   assign huif.halt = idexOut.halt;
   assign huif.idex_rt = idexOut.rt;
   assign huif.ifid_rs = ifidOut.rs;
   assign huif.ifid_rt = ifidOut.rt;
   assign huif.dMemRead = idexOut.dMemRead;
   assign huif.dMemReq_exmem = (exmemOut.dMemRead||exmemOut.dMemWrite);
//   assign huif.Jump = (decodeif.opcode == J) ? 1 : 0;
//   assign huif.Link = (decodeif.opcode == JAL) ? 1 : 0;
   assign huif.Link = (jumper.opcode == JAL) ? 1 : 0;
   assign stall = huif.stall;
//////////////////
regbits_t idexWsel;
assign idexWsel = (!idexOut.RegDest) ? idexOut.rd : (idexOut.Link ? 5'd31 : idexOut.rt);

//   assign fuif.ifid_rs = ifidOut.rs;
//   assign fuif.ifid_rt = ifidOut.rt;
   assign fuif.ifid_rs = decodeif.rs;
   assign fuif.ifid_rt = decodeif.rt;

   assign fuif.idex_rt = idexOut.rt;
   assign fuif.idex_rs = idexOut.rs;
   assign fuif.idex_wsel = idexWsel;
   assign fuif.dMemWrite = idexOut.dMemWrite;
   assign fuif.idexRegW = idexOut.RegWrite;
   assign fuif.exmem_rd = exmemOut.rd;
   assign fuif.exmem_wsel= exmemOut.wsel;
   assign fuif.exmemRegW = exmemOut.RegWrite;
   assign fuif.exmem_dMemRead = exmemOut.dMemRead;
   assign fuif.memwb_rd = memwbOut.rd;
   assign fuif.memwb_wsel = memwbOut.wsel;
   assign fuif.memwbRegW = memwbOut.RegWrite;
   assign fuif.memwb_dMemRead = memwbOut.dMemRead;

////


assign dpif.imemaddr = pcAddr;


// other cuif
assign cuif.opcode = decodeif.opcode;
assign cuif.funct = decodeif.funct;

// Register File
assign rfif.rsel1 = decodeif.rs;
assign rfif.rsel2 = decodeif.rt;


//assign aluif.port_a = rfif.rdat1;
//assign aluif.opcode = cuif.alu_op; single

//assign aluif.port_a = idexOut.rdat1;  pipe
//assign aluif.opcode = idexOut.alu_op;

assign aluif.opcode = idexOut.alu_op;

//test signals
logic herea, hereb;
word_t test_naddr;
//

// declarations
logic immMsb, halt;

assign immMsb = decodeif.imm[15]; //16-1



//
word_t fwdData_a, fwdData_b;
assign exmemIn.rdat2 = fwdData_b; //forwarding
assign aluif.port_a = fwdData_a;  // fowarding connection
logic equal;
//
//assign idexIn.Equal = fwdData_a == fwdData_b;

assign equal=(fwdData_a == fwdData_b);

always_comb begin
   pc4=pcAddr+4;
   huif.flushEn=0;
   huif.pcGo=0;
  // if((idexOut.beq & idexOut.Equal) || (idexOut.bne & ~idexOut.Equal))
   if((idexOut.beq & equal) || (idexOut.bne & ~equal))  
   begin
//      nextAddr = pc4 + word_t'($signed(decodeif.instr_d[15:0]<<2));//imm
      nextAddr = (idexOut.pc4 + word_t'($signed(idexOut.imm<<2)));//imm
      huif.flushEn=1;
      huif.pcGo=1;
   end
   else if((jumper.opcode == J)||(jumper.opcode==JAL))
   begin  
//      nextAddr={pc4[31:28], (decodeif.instr_d[27:0]<<2)};//addr
//      nextAddr={idexIn.pc4[31:28], idexIn.instr[27:0]<<2};//addr
//      nextAddr = {pc4[31:28], dpif.imemload[25:0], 2'b0};
      nextAddr={pc4[31:28], jumper.addr, 2'b0};//addr
   end
   else if(idexOut.Jr)
   begin
      nextAddr = aluif.pout;
      nextAddr = fwdData_a;
      huif.flushEn=1;
      huif.pcGo=1;
   end
   else begin
      nextAddr=pc4;
   end
end
/////////////////   EX/MEM   ....///////////////////////////////
assign dpif.dmemaddr = exmemOut.pout;
assign dpif.dmemstore = exmemOut.rdat2;
assign dpif.dmemWEN = exmemOut.dMemWrite;
assign dpif.dmemREN = exmemOut.dMemRead;



always_comb
begin
 //  rfif.wsel = decodeif.rt;
   if(!idexOut.RegDest) begin
//      exmemIn.wsel=idexOut.instr[20:16];
      exmemIn.wsel=idexOut.rd;
   end
   else if(idexOut.Link) begin
      exmemIn.wsel = 5'd31;
   end
   else begin
//      exmemIn.wsel = idexOut.instr[15:11];
      exmemIn.wsel = idexOut.rt;
   end

//////////////forwarding ////////////////
idexIn.fwa=fuif.fwa;
idexIn.fwb=fuif.fwb;

//if(fuif.fwa==2'b01) begin
if(idexOut.fwa==2'b01) begin
  fwdData_a = exmemWdat;
end
else if(idexOut.fwa==2'b10) begin
  fwdData_a = memwbWdat;
end
else begin
  fwdData_a = idexOut.rdat1;
end

if(idexOut.fwb==2'b01) begin
   fwdData_b = exmemWdat;
end
else if(idexOut.fwb==2'b10) begin
   fwdData_b = memwbWdat;
end
else begin
   fwdData_b = idexOut.rdat2;
end

end
//////////// MEM/WB//////////////////////////////////////////////
always_comb
begin
   if(exmemOut.Link) begin
//      exmemWdat=rfif.wdat;
      exmemWdat=exmemOut.pc4;
   end
   else if(exmemOut.ImmtoReg) begin
//      rfif.wdat = word_t'({decodeif.imm, 16'b0});
      exmemWdat=word_t'({exmemOut.imm, 16'b0});
   end
   else begin
      exmemWdat=exmemOut.pout;

   end
end


assign dpif.halt = memwbOut.halt;
assign dpif.imemREN = !memwbOut.halt;
assign rfif.WEN = memwbOut.RegWrite;
assign rfif.wsel = memwbOut.wsel;
assign rfif.wdat = memwbWdat;
//test sig//
logic testload1, testload2;

//
always_comb
begin
testload1=0;testload2=0;
   if(memwbOut.dMemRead) begin
      memwbWdat = memwbOut.dmemload; testload1=1;
   end
   else begin
//      rfif.wdat = aluif.pout;
        memwbWdat=memwbOut.wdat;    testload2=1;
   end
end

////////////////   bottom left mux  //////////////////////////////////////////
always_comb
begin
  //aluif.port_b = rfif.rdat2; single
//   aluif.port_b = idexOut.rdat2; pipe
   aluif.port_b = fwdData_b;
  if(idexOut.ShamtE) begin
//     aluif.port_b = dcif.imemload[10:6];
     aluif.port_b = word_t'({27'b0, idexOut.shamt});
    // aluif.port_b = idexOut.shamt;       ///////////////
   end
   else begin
//      if(cuif.Alusrc) begin
      if(idexOut.Alusrc) begin
            if(idexOut.Ext) begin
//               aluif.port_b=$signed(dcif.imemload[15:0]);
               aluif.port_b = word_t'({ {16{idexOut.imm[15]}}, idexOut.imm });
            end
            else begin
               aluif.port_b = word_t'({ 16'b0, idexOut.imm});
            end
      end
   end
end


endmodule
