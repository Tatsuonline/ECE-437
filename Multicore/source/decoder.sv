`include "decoder_if.vh"
`include "cpu_types_pkg.vh"

module decoder
import cpu_types_pkg::*;
(
  decoder_if.decodeif decodeif
);

i_t itype;
r_t rtype;
j_t jtype;

assign itype = decodeif.instr_d;
assign rtype = decodeif.instr_d;
assign jtype = decodeif.instr_d;
//////////////////////////////////////////////
//Decode R type instruction.....
//////////////////////////////////////////////

assign decodeif.rs = rtype.rs;
assign decodeif.rd = rtype.rd;
assign decodeif.rt = rtype.rt;
assign decodeif.opcode = rtype.opcode;
assign decodeif.funct = rtype.funct;
assign decodeif.addr = jtype.addr; /// in j_t
assign decodeif.imm = itype.imm; /// in i_t
assign decodeif.shamt = rtype.shamt;


endmodule
