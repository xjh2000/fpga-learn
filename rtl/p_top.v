`include "p.v"
module p_top (output out_result,
              input sys_clk,
              input sys_rst);
    reg [0:63] state; 
    reg [0:79] keys; /*synthesis syn_preserve = 1*/
    reg  clk;
    reg [23:0] counter;
    wire [0:63] result; /*synthesis syn_keep = 1*/
    
    
    assign out_result = (result == 64'h3333_DCD3_2132_10D2)?1'b1:1'b0;
    
    always @(posedge sys_clk) begin
        
        if (counter < 24'd100 - 1'd1) begin
            counter <= counter + 1'b1;
            end else begin
            state   <= 64'hffff_ffff_ffff_ffff;
            keys    <= 80'hffff_ffff_ffff_ffff_ffff;
            clk     <= ~clk;
            counter <= 24'd0;
        end
    end
    
    p u_p(
    .result(result),
    .state(state),
    .keys(keys),
    .sys_clk(clk));
    
endmodule 
