`include "../rtl/PresentRound.v"
`timescale 1ns/1ns

module PresentRound_tb ();
    reg clk;
    reg ready;
    
    reg  [0:7]   cnt;
    reg  [0:63]  state;
    reg  [0:79]  keys;
    wire [0:63]  res;
    wire [0:79]  r_keys;
    wire [0:63]  result;
    
    
    initial  begin
        clk   = 1'b0;
        ready = 1;
        cnt   = 0;
        state = 64'hffff_ffff_ffff_ffff;
        keys  = 80'hffff_ffff_ffff_ffff_ffff;
    end
    
    always #1 clk = ~clk;
    
    assign  result = state ^keys[0:63];
    always @(posedge  clk)  begin
        cnt   <= (cnt^31)? cnt+1: cnt;
        state <= ready ? ((cnt) ?res:state) :state;
        keys  <= ready ? ((cnt) ?r_keys:keys) :keys;
        ready <= (cnt^31)? 1:0;
    end
    
    PresentRound   u_PresentRound(res,r_keys,state,keys,cnt[3:7]);
endmodule //PresentRound_tb
