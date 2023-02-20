`timescale   1ns/1ns
`include "../rtl/Present.v"

module   test;
    reg  clk;
    reg [63:0]  state;
    reg [79:0]  keys;
    
    wire[63:0]  res;
    
    initial  begin
         clk<=0;
         state<=64'hffff_ffff_ffff_ffff;
         keys<=80'hffff_ffff_ffff_ffff_ffff;
     end
     
     always #10 clk=~clk;
     Present PS(res,state,keys,clk);
 endmodule
