`include "cpu_types_pkg.vh"
`include "alu_if.vh"

module alu

import cpu_types_pkg::*;
(
 alu_if.aluif aluif
);   
   word_t pout;
   logic nf, zf, of;


  always_comb begin
    if(aluif.opcode==ALU_SLL)//sl
    begin
	pout=aluif.port_a<<aluif.port_b;
	of=0;
    end
    else if(aluif.opcode==ALU_SRL)//sl
    begin
	pout=aluif.port_a>>aluif.port_b;
	of=0;
    end     
    else if(aluif.opcode==ALU_ADD)//add
    begin
	pout=aluif.port_a+aluif.port_b;
	nf=pout[31];

	if ((aluif.port_a[31]==0)&&(aluif.port_b[31]==0)&&(nf==1)) begin	
	of=1;
	end

	else if((aluif.port_a[31]==1)&&(aluif.port_b[31]==1)&&(nf==0)) begin
	//case of adding two huge neg numbers
	of=1;
	end
	
        else begin
	of=0;
	end    
    end     
    else if(aluif.opcode==ALU_SUB)//sub
    begin
	nf=pout[31];
	pout=aluif.port_a-aluif.port_b;

	if ((aluif.port_a[31]==0)&&(aluif.port_b[31]==1)&&(nf==1)) begin
	of=1;
	end
	else if((aluif.port_a[31]==1)&&(aluif.port_b[31]==0)&&(nf==0)) begin
	of=1;
	end else begin
	of=0;
	end    	//subtraction

    end     
    else if(aluif.opcode==ALU_AND)//and
    begin
	pout=aluif.port_a&aluif.port_b;
	of=0;
    end     
    else if(aluif.opcode==ALU_OR)//or
    begin
	pout=aluif.port_a|aluif.port_b;
	of=0;
    end     
    else if(aluif.opcode==ALU_XOR)//xor
    begin
	pout=aluif.port_a^aluif.port_b;
	of=0;
    end     
    else if(aluif.opcode==ALU_NOR)//nor
    begin
	pout=~(aluif.port_a|aluif.port_b);
	of=0;
    end
    else if(aluif.opcode==ALU_SLT)//slt
    begin
	if($signed(aluif.port_a) < $signed(aluif.port_b)) 
	begin
		pout=1;
	end
	else begin
		pout=0;
	end
	of=0;
    end
    else if(aluif.opcode==ALU_SLTU)//sltu
    begin
	if($unsigned(aluif.port_a) < $unsigned(aluif.port_b))
	begin
		pout=1;
	end
	else begin
		pout=0;
	end
	of=0;
    end
    else begin
	pout='{default:0};
	of=0;
    end
	nf=pout[31];
//	if (pout==0) begin
//	zf=1;
//	end else begin
//	zf=0;
//	end

	


  end

  assign aluif.nf=nf;
  assign aluif.zf = (pout==0) ? 1:0;
  assign aluif.of=of;
  assign aluif.pout=pout;
//  assign aluif.zf=zf;

endmodule
