`include "PresentRound.v"

module Present(output [0:63] result, // finally result
               input [0:63] state,   // PlainText
               input [0:79] keys,    // key
               input clk);           // clock

reg   [0:7] cnt; /*synthesis syn_preserve = 1*/

reg   [0:63]  res;
reg   [0:79]  k;
wire  [0:63]  next_res;
wire  [0:79]  r_keys;

initial  begin
    cnt <= 0;
end

assign  result = res ^k[0:63];

// update the count,res,keys,ready
always @(posedge  clk)  begin
    cnt <= (cnt^31)? cnt+1: 0;
    res <= ((cnt) ?next_res:state) ;
    k   <= ((cnt) ?r_keys:keys) ;
    
end

PresentRound   PR(
.res(next_res),
.r_keys(r_keys),
.state(res),
.keys(k),
.round_counter(cnt[3:7]));

endmodule
