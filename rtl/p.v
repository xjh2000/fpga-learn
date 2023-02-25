`include "p_round.v"

module p(input [0:63] state,    // PlainText
         input [0:79] keys,     // key
         input clk,             // clock
         output [0:63] result);

reg   [0:7] cnt; /*synthesis syn_preserve = 1*/

reg   [0:63]  res;
reg   [0:79]  k;
wire  [0:63]  next_res;
wire  [0:79]  r_keys;

initial  begin
    cnt <= 0;
end

assign  result = end_conver(res ^k[0:63]);

// update the count,res,keys,ready
always @(posedge  clk)  begin
    cnt <= (cnt^31)? cnt+1: 0;
    res <= ((cnt) ?next_res:state) ;
    k   <= ((cnt) ?r_keys:keys) ;
end

p_round   u_p_round(
.res(next_res),
.r_keys(r_keys),
.state(res),
.keys(k),
.round_counter(cnt[3:7]));

function [0:63]     end_conver ;
    input     [0:63] data_in ;
    parameter         MASK = 32'h3 ;
    integer           k ;
    begin
        for(k = 0; k<64; k = k+1) begin
            end_conver[63-k] = data_in[k] ;
        end
    end
endfunction
endmodule
