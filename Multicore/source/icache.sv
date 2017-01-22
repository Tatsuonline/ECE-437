`include "cpu_types_pkg.vh"
`include "pipeline_types_pkg.vh"
`include "cache_types_pkg.vh"

module icache
import cpu_types_pkg::*, pipeline_types_pkg::*, cache_types_pkg::*;
(
 input logic CLK, nRST,
 datapath_cache_if.icache dcif,
 cache_control_if ccif
);
// datapath_cache_if.cache dcif,
// cache_control_if.caches ccif ->> Before lab 9
// datapath_cache_if.icache dcif, 
// cache_control_if.icache ccif ->>worked for lab9
parameter CPUID=0;

istate_t cur, next;
icache_t tags[15:0];
icache_t icur, inext;
//logic [25:0] tag;
value_t values[15:0];
value_t curValue, nextValue;
tempRow_t addr;
word_t imemload;
logic WEN, hit;

assign addr = dcif.imemaddr;
assign icur = tags[addr.index];
assign curValue = values[addr.index];
assign dcif.ihit = hit;
assign ccif.iaddr[CPUID] = dcif.imemaddr;

assign inext.v = !ccif.iwait[CPUID];//[CPUID];
assign inext.tag = addr.tag;
assign nextValue.value = ccif.iload[CPUID];

always_ff @ (posedge CLK, negedge nRST) 
begin
  if(nRST == 0)
  begin
    tags[0] <= icache_t'(0);
    tags[1] <= icache_t'(0);
    tags[2] <= icache_t'(0);
    tags[3] <= icache_t'(0);
    tags[4] <= icache_t'(0);
    tags[5] <= icache_t'(0);
    tags[6] <= icache_t'(0);
    tags[7] <= icache_t'(0);
    tags[8] <= icache_t'(0);
    tags[9] <= icache_t'(0);
    tags[10] <= icache_t'(0);
    tags[11] <= icache_t'(0);
    tags[12] <= icache_t'(0);
    tags[13] <= icache_t'(0);
    tags[14] <= icache_t'(0);
    tags[15] <= icache_t'(0);
  end
  else begin
    if(hit) begin
      imemload <= curValue.value;
    end
    else if(WEN) begin
      values[addr.index] <= nextValue;
      tags[addr.index] <= inext;
    end
  end
end

always_comb begin
  if(icur.v && (icur.tag == addr.tag)) begin
    hit=1;
  end
  else begin
    hit=0;
  end
end

always_comb begin
  if (hit) begin
    dcif.imemload = curValue.value;
  end 
  else begin
    dcif.imemload = imemload;
  end
end
/////////// state loop //////////
always_ff @ (posedge CLK, negedge nRST) begin
  if (nRST == 0) begin
    cur <= Idle;
  end
  else begin
    cur <= next;
  end
end

///////state comb ////////////
always_comb begin
  casez(cur)
    Idle: begin
      if(dcif.imemREN && !hit) begin
        next = Update;
      end 
      else begin
        next = Idle;
      end
    end
    Update: begin
      if(ccif.iwait[CPUID]) begin
        next = Update;
      end
      else begin
        next = Idle;
      end
    end
    default : next = Idle;
  endcase
end

////////////state comb2/////////////
always_comb begin
//   always @ (*) 

  casez(cur)
    Idle: begin
      ccif.iREN[CPUID]=0;
      WEN=0;
    end
    Update: begin
      ccif.iREN[CPUID]=1;
      WEN=1;
    end
    default: begin
      ccif.iREN[CPUID]=0;
      WEN=0;
    end
  endcase
end

endmodule

