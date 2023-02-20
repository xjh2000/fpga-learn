`include "Present.v"
module PresentFpga (output out_result,
                    input sys_clk,
                    input sys_rst);
    reg [0:63] state;
    reg [0:79] keys;
    reg  clk;
    reg [23:0] counter;
    wire [0:63] result; /*synthesis syn_keep = 1*/
    
    initial begin
        state <= 64'hffff_ffff_ffff_ffff;
        keys  <= 80'hffff_ffff_ffff_ffff_ffff;
        clk = 1'h0;
    end
    
    assign out_result = (result == 64'h3333_DCD3_2132_10D2)?1'b1:1'b0;
    
    always @(posedge sys_clk) begin
        
        if (counter < 24'd100 - 1'd1) begin
            counter <= counter + 1'b1;
            end else begin
            clk     <= ~clk;
            counter <= 24'd0;
        end
        
        
        
    end
    
    Present u_present(
    .result(result),
    .state(state),
    .keys(keys),
    .clk(clk));
    
endmodule //PresentFpga
