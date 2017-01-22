`include "cache_control_if.vh"
`include "cpu_types_pkg.vh"

module memory_control
(
   input CLK, nRST,
   cache_control_if.cc ccif
);
//   cache_control_if.cc ccif
import cpu_types_pkg::*;

typedef enum bit [4:0]
{
   Idle, Dogg_Req1, Dogg_Req2, Snoop_Dogg1, Snoop_Dogg2, Fetch_From1, Fetch_From2 , Cache_Transfer1, Cache_Transfer2, Instr0, Instr1, Writeback0, Writeback1, Invalidate_Req1, Invalidate_Req2, Invalidate1, Invalidate2
//   Idle, Dogg_Req, Snoop_Dogg, Fetch_From, Cache_Transfer, Instr0, Instr1, Writeback0, Writeback1, Invalidate_Req, Invalidate
} state_t;

state_t cur, next;
logic [1:0] instFlag;
logic [1:0] inst0;
logic [1:0] inst1;
logic [1:0] cachet;

always_ff @ (posedge CLK, negedge nRST)
begin
   if(!nRST) begin
      cur <= Idle;
   end else begin
      cur <= next;
   end
end

always_comb begin //->alkjljdoiollkjsdlfjkdsa;lfgkj
//always @ (*) begin
   casez(cur)
      Idle: begin
         if(ccif.cctrans[1]&&ccif.ccwrite[1]) begin
	    next = Invalidate_Req1;
//	    next = Invalidate1;
	 end
         else if(ccif.cctrans[0]&&ccif.ccwrite[0]) begin
	    next = Invalidate_Req2;
//	    next = Invalidate2;
	 end
         else if (ccif.cctrans[1]&&!ccif.ccwrite[1]) begin
            next = Dogg_Req1;
	 end
         else if((ccif.cctrans[0]&&!ccif.ccwrite[0])) begin
            next = Dogg_Req2;
         end
//	 else if((!ccif.cctrans[0]&&ccif.iREN[0])||(!ccif.cctrans[1]&&ccif.iREN[1])) begin
	 else if(!ccif.cctrans[0]&&ccif.dWEN[0]) begin
	    next = Writeback0;
	 end
	 else if(!ccif.cctrans[1]&&ccif.dWEN[1]) begin
	    next = Writeback1;
	 end
	 else if(!ccif.cctrans[0]&&ccif.iREN[0] && !ccif.dWEN[0]) begin //!ccif.dWEN[0]
	    next = Instr0;
	 end
	 else if(!ccif.cctrans[1]&&ccif.iREN[1] && !ccif.dWEN[1]) begin //&&!ccif.dWEN[1]
	    next = Instr1;
	 end
/*	 else if((!ccif.cctrans[0]&&ccif.dWEN[0])||(!ccif.cctrans[1]&&ccif.dWEN[1])) begin
	    next = Writeback;
	 end*/
	 else begin
	    next = Idle;
	 end
      end
      Dogg_Req1: begin
            next = Snoop_Dogg1;
      end
      Dogg_Req2: begin
            next = Snoop_Dogg2;
      end
      Snoop_Dogg1: begin
         if(ccif.cctrans[0])  begin
            next = Cache_Transfer1;
         end
	 else begin
	    next = Fetch_From1;
	 end
      end
      Snoop_Dogg2: begin
         if(ccif.cctrans[1])  begin
            next = Cache_Transfer2;
         end
	 else begin
	    next = Fetch_From2;
	 end
      end
      Fetch_From1: begin
	 if(!ccif.dREN[1]) begin
   	    next = Idle;
	 end
	 else begin
	    next = Fetch_From1;
	 end
      end
      Fetch_From2: begin
	 if(!ccif.dREN[0]) begin
   	    next = Idle;
	 end
	 else begin
	    next = Fetch_From2;
	 end
      end
      Cache_Transfer1: begin
//	 if((!ccif.dWEN[0] || !ccif.dWEN[1])) begin
	 if(!ccif.dWEN[0]) begin
   	    next = Idle;
	 end
	 else begin
	    next = Cache_Transfer1;
	 end
      end
      Cache_Transfer2: begin
	 if(!ccif.dWEN[1]) begin
   	    next = Idle;
	 end
	 else begin
	    next = Cache_Transfer2;
	 end
      end
/*      Writeback: begin
	 if((!ccif.dWEN[0] || !ccif.dWEN[1])) begin
   	    next = Idle;
	 end
	 else begin
	    next = Writeback;
	 end
      end*/
      Writeback0: begin
	 if(!ccif.dWEN[0]) begin
   	    next = Idle;
	 end
	 else begin
	    next = Writeback0;
	 end
      end
      Writeback1: begin
	 if(!ccif.dWEN[1]) begin
   	    next = Idle;
	 end
	 else begin
	    next = Writeback1;
	 end
      end
      Instr0: begin
         if((!ccif.dWEN[1] && !ccif.dREN[1] && ccif.iREN[1] && ccif.ramstate==ACCESS)) begin
            next = Instr1;
         end
         else if(ccif.ramstate==ACCESS) begin
            next = Idle;
	 end
         else begin
            next = Instr0;
         end
      end
      Instr1: begin
         if(ccif.iREN[1]) begin
            next = Instr1;
	 end
	 else begin
 	    next = Idle;
	 end
      end
      Invalidate_Req1: begin
         next = Invalidate1;
      end            
      Invalidate_Req2: begin
         next = Invalidate2;
      end            
     Invalidate1: begin
	if ((ccif.cctrans[0] && ccif.ccwrite[0])) begin
//	if ((ccif.cctrans[1] && ccif.ccwrite[1])) begin
	    next = Cache_Transfer1;
	end
	else if (!ccif.ccwrite[0]) begin
//	else if (!ccif.ccwrite[1]) begin
	    next = Fetch_From1;
        end
	else begin
	   next = Invalidate1;
	end
     end
     Invalidate2: begin
	if ((ccif.cctrans[1] && ccif.ccwrite[1])) begin
//	if ((ccif.cctrans[0] && ccif.ccwrite[0])) begin
	    next = Cache_Transfer2;
	end
	else if (!ccif.ccwrite[1]) begin
//	else if (!ccif.ccwrite[0]) begin
	    next = Fetch_From2;
        end
	else begin
	   next = Invalidate2;
	end
     end
   
   default: begin
      next = Idle;
   end

   endcase
end

always_comb begin //ffffuuuucccckkkkk
//always @ (*) begin
   casez(cur)
      Idle: begin
	ccif.iwait[0]=1;  ccif.iwait[1]=1;
	ccif.iload[0]=0;  ccif.iload[1]=0;
	ccif.ccwait[0]=0; ccif.ccwait[1]=0;
	ccif.dwait[0]=1;  ccif.dwait[1]=1;
	ccif.dload[0]=0;  ccif.dload[1]=0;
	ccif.ccinv[0]=0;  ccif.ccinv[1]=0;

	ccif.ccsnoopaddr[0]=0;
	ccif.ccsnoopaddr[1]=0;
        ccif.ramstore=0;
	ccif.ramaddr=0;
	ccif.ramWEN=0;
	ccif.ramREN=0;
      end
      Dogg_Req1: begin
	   ccif.iwait[0]=1;  ccif.iwait[1]=1;
	   ccif.iload[0]=0;  ccif.iload[1]=0;
	   ccif.ccwait[0]=1; ccif.ccwait[1]=0;
	   ccif.dwait[0]=1;  ccif.dwait[1]=1;
	   ccif.dload[0]=0;  ccif.dload[1]=0;
	   ccif.ccinv[0]=0;  ccif.ccinv[1]=0;
	   ccif.ccsnoopaddr[0]=ccif.daddr[1];
           ccif.ccsnoopaddr[1]=0;

           ccif.ramstore=0;
	   ccif.ramaddr=0;
	   ccif.ramWEN=0;
	   ccif.ramREN=0;

      end
      Dogg_Req2: begin 
	   ccif.iwait[0]=1;  ccif.iwait[1]=1;
	   ccif.iload[0]=0;  ccif.iload[1]=0;
	   ccif.ccwait[0]=0; ccif.ccwait[1]=1;
	   ccif.dwait[0]=1;  ccif.dwait[1]=1;
	   ccif.dload[0]=0;  ccif.dload[1]=0;
	   ccif.ccinv[0]=0;  ccif.ccinv[1]=0;
	   ccif.ccsnoopaddr[0]=0;
           ccif.ccsnoopaddr[1]=ccif.daddr[0];

           ccif.ramstore=0;
	   ccif.ramaddr=0;
	   ccif.ramWEN=0;
	   ccif.ramREN=0;
      end
      Snoop_Dogg1: begin
	   ccif.iwait[0]=1;  ccif.iwait[1]=1;
	   ccif.iload[0]=0;  ccif.iload[1]=0;
	   ccif.ccwait[0]=1; ccif.ccwait[1]=0;
	   ccif.dwait[0]=1;  ccif.dwait[1]=1;
	   ccif.dload[0]=0;  ccif.dload[1]=0;
	   ccif.ccinv[0]=0;  ccif.ccinv[1]=0;
	   ccif.ccsnoopaddr[0]=ccif.daddr[1];
           ccif.ccsnoopaddr[1]=0;

           ccif.ramstore=0;
	   ccif.ramaddr=0;
	   ccif.ramWEN=0;
	   ccif.ramREN=0;	
      end
      Snoop_Dogg2: begin
	   ccif.iwait[0]=1;  ccif.iwait[1]=1;
	   ccif.iload[0]=0;  ccif.iload[1]=0;
	   ccif.ccwait[0]=0; ccif.ccwait[1]=1;
	   ccif.dwait[0]=1;  ccif.dwait[1]=1;
	   ccif.dload[0]=0;  ccif.dload[1]=0;
	   ccif.ccinv[0]=0;  ccif.ccinv[1]=0;
	   ccif.ccsnoopaddr[0]=0;
           ccif.ccsnoopaddr[1]=ccif.daddr[0];

           ccif.ramstore=0;
	   ccif.ramaddr=0;
	   ccif.ramWEN=0;
	   ccif.ramREN=0;
      end
/*      Cache_Transfer: begin
cachet=0;
	if ((ccif.ccwrite[1] && ccif.cctrans[1]) || ccif.cctrans[0]) begin
	   ccif.iwait[0]=1;  ccif.iwait[1]=1;  
	   ccif.iload[0]=0;  ccif.iload[1]=0;
	   ccif.ccwait[0]=0; ccif.ccwait[1]=ccif.dWEN[1]; 
	   ccif.dwait[0]=!(ccif.ramstate == ACCESS);  ccif.dwait[1] = !(ccif.ramstate == ACCESS);  
	   ccif.dload[0]=ccif.dstore[1];  ccif.dload[1] = 0;
	   ccif.ccinv[0]=0;  ccif.ccinv[1]=0;  
	   ccif.ccsnoopaddr[0]=0;
	   ccif.ccsnoopaddr[1]=ccif.daddr[0];

           ccif.ramstore=ccif.dstore[1];
	   ccif.ramaddr = ccif.daddr[1];
	   ccif.ramWEN=ccif.dWEN[1];
	   ccif.ramREN=0;          cachet=1;
	end
	else if ((ccif.ccwrite[0] && ccif.cctrans[0]) || ccif.cctrans[1]) begin
	   ccif.iwait[1]=1;  ccif.iwait[0]=1;
	   ccif.iload[1]=0;  ccif.iload[0]=0;
	   ccif.ccwait[1]=0; ccif.ccwait[0]=ccif.dWEN[0];
	   ccif.dwait[1]=!(ccif.ramstate == ACCESS);  ccif.dwait[0] = !(ccif.ramstate == ACCESS);  
	   ccif.dload[1]=ccif.dstore[0];  ccif.dload[0] = 0;
	   ccif.ccinv[1]=0;  ccif.ccinv[0]=0;  
	   ccif.ccsnoopaddr[0]=ccif.daddr[1];
	   ccif.ccsnoopaddr[1]=0;

           ccif.ramstore=ccif.dstore[0];
	   ccif.ramaddr = ccif.daddr[0];
	   ccif.ramWEN=ccif.dWEN[0];
	   ccif.ramREN=0;          cachet=2;
	end
      end
*/
	Cache_Transfer1: begin
	cachet=0;
	   ccif.iwait[1]=1;  ccif.iwait[0]=1;
	   ccif.iload[1]=0;  ccif.iload[0]=0;
	   ccif.ccwait[1]=0; ccif.ccwait[0]=ccif.dWEN[0];
	   ccif.dwait[1]=!(ccif.ramstate == ACCESS);  ccif.dwait[0] = !(ccif.ramstate == ACCESS);  
	   ccif.dload[1]=ccif.dstore[0];  ccif.dload[0] = 0;
	   ccif.ccinv[1]=0;  ccif.ccinv[0]=0;  
	   ccif.ccsnoopaddr[0]=ccif.daddr[1];
	   ccif.ccsnoopaddr[1]=0;

           ccif.ramstore=ccif.dstore[0];
	   ccif.ramaddr = ccif.daddr[0];
	   ccif.ramWEN=ccif.dWEN[0];
	   ccif.ramREN=0;          cachet=2;
	end
      Cache_Transfer2: begin
	cachet=0;
	   ccif.iwait[0]=1;  ccif.iwait[1]=1;  
	   ccif.iload[0]=0;  ccif.iload[1]=0;
	   ccif.ccwait[0]=0; ccif.ccwait[1]=ccif.dWEN[1]; 
	   ccif.dwait[0]=!(ccif.ramstate == ACCESS);  ccif.dwait[1] = !(ccif.ramstate == ACCESS);  
	   ccif.dload[0]=ccif.dstore[1];  ccif.dload[1] = 0;
	   ccif.ccinv[0]=0;  ccif.ccinv[1]=0;  
	   ccif.ccsnoopaddr[0]=0;
	   ccif.ccsnoopaddr[1]=ccif.daddr[0];

           ccif.ramstore=ccif.dstore[1];
	   ccif.ramaddr = ccif.daddr[1];
	   ccif.ramWEN=ccif.dWEN[1];
	   ccif.ramREN=0;          cachet=1;
      end
      Fetch_From1: begin
//	if (!ccif.ccwrite[1] || !ccif.cctrans[1]) begin

	   ccif.iwait[0]=1;  ccif.iwait[1]=1;  
	   ccif.iload[0]=0;  ccif.iload[1]=0;
	   ccif.ccwait[0]=0; ccif.ccwait[1]=0; 
	   ccif.dwait[0]=1;  ccif.dwait[1] = !(ccif.ramstate == ACCESS);  
	   ccif.dload[0]=0;  ccif.dload[1] = ccif.ramload;  
	   ccif.ccinv[0]=0;  ccif.ccinv[1]=0;  
	   ccif.ccsnoopaddr[0]=0;
	   ccif.ccsnoopaddr[1]=0;

           ccif.ramstore=0;
	   ccif.ramaddr = ccif.daddr[1];
	   ccif.ramWEN=0;
	   ccif.ramREN=ccif.dREN[1];

	/*end else if (!ccif.ccwrite[0] || !ccif.cctrans[0]) begin
	   ccif.iwait[0]=1;  ccif.iwait[1]=1;  
	   ccif.iload[0]=0;  ccif.iload[1]=0;
	   ccif.ccwait[0]=0; ccif.ccwait[1]=0; 
	   ccif.dwait[0]=1;  ccif.dwait[1] = !(ccif.ramstate == ACCESS);  
	   ccif.dload[0]=0;  ccif.dload[1] = ccif.ramload;  
	   ccif.ccinv[0]=0;  ccif.ccinv[1]=0;  
	   ccif.ccsnoopaddr[0]=0;
	   ccif.ccsnoopaddr[1]=0;

           ccif.ramstore=0;
	   ccif.ramaddr = ccif.daddr[1];
	   ccif.ramWEN=0;
	   ccif.ramREN=ccif.dREN[1];
	end	*/  
      end
      Fetch_From2: begin
	   ccif.iwait[0]=1;  ccif.iwait[1]=1;  
	   ccif.iload[0]=0;  ccif.iload[1]=0;
	   ccif.ccwait[0]=0; ccif.ccwait[1]=0; 
	   ccif.dwait[0]=!(ccif.ramstate == ACCESS);  ccif.dwait[1] = 1;  
	   ccif.dload[0]=ccif.ramload;  ccif.dload[1] = 0;  
	   ccif.ccinv[0]=0;  ccif.ccinv[1]=0;  
	   ccif.ccsnoopaddr[0]=0;
	   ccif.ccsnoopaddr[1]=0;

           ccif.ramstore=0;
	   ccif.ramaddr = ccif.daddr[0];
	   ccif.ramWEN=0;
	   ccif.ramREN=ccif.dREN[0];
      end
     Writeback0: begin
	   ccif.iwait[0]=1;  ccif.iwait[1]=1;
	   ccif.iload[0]=0;  ccif.iload[1]=0;
	   ccif.ccwait[0]=0; ccif.ccwait[1]=1;
	   ccif.dwait[0]=!(ccif.ramstate == ACCESS);  ccif.dwait[1] = 1;
	   ccif.dload[0]=0;  ccif.dload[1]= 0;
	   ccif.ccinv[0]=0;  ccif.ccinv[1]=0;
	   ccif.ccsnoopaddr[0]=0;
	   ccif.ccsnoopaddr[1]=0;

           ccif.ramstore = ccif.dstore[0];
	   ccif.ramaddr = ccif.daddr[0];
	   ccif.ramWEN = ccif.dWEN[0];
	   ccif.ramREN=0;
      end
     Writeback1: begin
	   ccif.iwait[0]=1;  ccif.iwait[1]=1;
	   ccif.iload[0]=0;  ccif.iload[1]=0;
	   ccif.ccwait[0]=1; ccif.ccwait[1]=0;
	   ccif.dwait[0]=1;  ccif.dwait[1]=!(ccif.ramstate == ACCESS);  
	   ccif.dload[0]=0;  ccif.dload[1]=0;
	   ccif.ccinv[0]=0;  ccif.ccinv[1]=0;
	   ccif.ccsnoopaddr[0]=0;
	   ccif.ccsnoopaddr[1]=0;

           ccif.ramstore = ccif.dstore[1];
	   ccif.ramaddr = ccif.daddr[1];
	   ccif.ramWEN = ccif.dWEN[1];
	   ccif.ramREN=0;
     end
//      end

      Instr0: begin
	   inst1[0]=ccif.iREN[1];//////
           inst1[1]=!ccif.cctrans[1];/////
	   inst0[0]=ccif.iREN[0];/////
           inst0[1]=!ccif.cctrans[0];/////

//	end else if (ccif.iREN[0] && !ccif.cctrans[0]) begin
	   ccif.iwait[1]=1;   ccif.iwait[0]=!(ccif.ramstate == ACCESS);
	   ccif.iload[1]=0;   ccif.iload[0]=ccif.ramload;  
	   ccif.ccwait[1]=1;  ccif.ccwait[0]=1; 
	   ccif.dwait[1] = 1; ccif.dwait[0]=1;
	   ccif.dload[1] = 0; ccif.dload[0]=0;
	   ccif.ccinv[1]=0;   ccif.ccinv[0]=0;
	   ccif.ccsnoopaddr[1]=0;
	   ccif.ccsnoopaddr[0]=0;

           ccif.ramstore = 0;
	   ccif.ramaddr = ccif.iaddr[0];
	   ccif.ramWEN = 0;
	   ccif.ramREN = ccif.iREN[0]; instFlag=2;
//	end
       instFlag=2;
     end
      Instr1: begin
	   inst1[0]=ccif.iREN[1];//////
           inst1[1]=!ccif.cctrans[1];/////
	   inst0[0]=ccif.iREN[0];/////
           inst0[1]=!ccif.cctrans[0];/////

	   ccif.iwait[0]=1;   ccif.iwait[1]=!(ccif.ramstate == ACCESS);
	   ccif.iload[0]=0;   ccif.iload[1]=ccif.ramload;  
	   ccif.ccwait[0]=1;  ccif.ccwait[1]=1; 
	   ccif.dwait[0] = 1; ccif.dwait[1] = 1;    
	   ccif.dload[0] = 0; ccif.dload[1] = 0;
	   ccif.ccinv[0]=0;   ccif.ccinv[1]=0;
	   ccif.ccsnoopaddr[1]=0;
	   ccif.ccsnoopaddr[0]=0;

           ccif.ramstore = 0;
	   ccif.ramaddr = ccif.iaddr[1];
	   ccif.ramWEN = 0;
	   ccif.ramREN = ccif.iREN[1];; instFlag=1;
         instFlag=3;
     end
     Invalidate_Req1: begin
	   ccif.iwait[0]=1;  ccif.iwait[1]=1;
	   ccif.iload[0]=0;  ccif.iload[1]=0;
	   ccif.ccwait[0]=1; ccif.ccwait[1]=0;
//	   ccif.ccwait[0]=0; ccif.ccwait[1]=1;
	   ccif.dwait[0]=1;  ccif.dwait[1]=1;
	   ccif.dload[0] = 0;  ccif.dload[1] = 0;
	   ccif.ccinv[0]=1;  ccif.ccinv[1]=1;
//	   ccif.ccinv[0]=0;  ccif.ccinv[1]=1;
	   ccif.ccsnoopaddr[1] = 0;
	   ccif.ccsnoopaddr[0] = ccif.daddr[1];

           ccif.ramstore = 0;
	   ccif.ramaddr = 0;
	   ccif.ramWEN = 0;
	   ccif.ramREN=0;
	end 
     Invalidate_Req2: begin
	   ccif.iwait[0]=1;  ccif.iwait[1]=1;
	   ccif.iload[0]=0;  ccif.iload[1]=0;
	   ccif.ccwait[0]=0; ccif.ccwait[1]=1;
//	   ccif.ccwait[0]=1; ccif.ccwait[1]=0;
	   ccif.dwait[0]=1;  ccif.dwait[1] = 1;
	   ccif.dload[0]=0;  ccif.dload[1] = 0;
	   ccif.ccinv[0]=1;  ccif.ccinv[1]=1;
//	   ccif.ccinv[0]=1;  ccif.ccinv[1]=0;
	   ccif.ccsnoopaddr[1] = ccif.daddr[0];
	   ccif.ccsnoopaddr[0] = 0;

           ccif.ramstore = 0;
	   ccif.ramaddr = 0;
	   ccif.ramWEN = 0;
	   ccif.ramREN=0;
	end
     Invalidate1: begin
	   ccif.iwait[0]=1;  ccif.iwait[1]=1;
	   ccif.iload[0]=0;  ccif.iload[1]=0;
	   ccif.ccwait[0]=1; ccif.ccwait[1]=0;
//	   ccif.ccwait[0]=0; ccif.ccwait[1]=1;
	   ccif.dwait[0]=1;  ccif.dwait[1]=1;
	   ccif.dload[0] = 0;  ccif.dload[1] = 0;
	   ccif.ccinv[0]=1;  ccif.ccinv[1]=1;
//	   ccif.ccinv[0]=0;  ccif.ccinv[1]=1;
	   ccif.ccsnoopaddr[1] = 0;
	   ccif.ccsnoopaddr[0] = ccif.daddr[1];

           ccif.ramstore = 0;
	   ccif.ramaddr = 0;
	   ccif.ramWEN = 0;
	   ccif.ramREN=0;
	end 
      Invalidate2: begin    
	   ccif.iwait[0]=1;  ccif.iwait[1]=1;
	   ccif.iload[0]=0;  ccif.iload[1]=0;
	   ccif.ccwait[0]=0; ccif.ccwait[1]=1;
//	   ccif.ccwait[0]=1; ccif.ccwait[1]=0;
	   ccif.dwait[0]=1;  ccif.dwait[1] = 1;
	   ccif.dload[0]=0;  ccif.dload[1] = 0;
	   ccif.ccinv[0]=1;  ccif.ccinv[1]=1;
//	   ccif.ccinv[0]=1;  ccif.ccinv[1]=0;
	   ccif.ccsnoopaddr[1] = ccif.daddr[0];
	   ccif.ccsnoopaddr[0] = 0;

           ccif.ramstore = 0;
	   ccif.ramaddr = 0;
	   ccif.ramWEN = 0;
	   ccif.ramREN=0;
	end
     
   endcase
end
endmodule
