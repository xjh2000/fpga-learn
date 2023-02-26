`include "p_round.v"

module p(input [0:63] state,     // PlainText
         input [0:79] keys,      // key
         input sys_clk,          // clock
         input encrypt_start,    // start encrypt
         output reg encrypt_end, // encrypt finish
         output [0:63] result);  // final result

reg   [0:7] cnt; /*synthesis syn_preserve = 1*/
reg   [0:63]  res;
reg   [0:79]  k;
wire  [0:63]  next_res;
wire  [0:79]  r_keys;

// just work in simlution
initial begin
    cnt = 1;
end

assign  result = res ^k[0:63];

// if encrypt_start is up, update the count,res,keys
always @(posedge  sys_clk)  begin
    cnt <= (encrypt_start)? cnt+1: 1;
    res <= ((encrypt_start) ?next_res:state) ;
    k   <= ((encrypt_start) ?r_keys:keys) ;
end


always @(posedge  sys_clk) begin
    if (cnt == 31 && encrypt_start) begin
        encrypt_end = 1;
    end
    else begin
        encrypt_end = 0;
    end
end

p_round   u_p_round(
.res(next_res),
.r_keys(r_keys),
.state(res),
.keys(k),
.round_counter(cnt[3:7]));



endmodule
