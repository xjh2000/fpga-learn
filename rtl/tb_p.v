`timescale  1ns / 1ps
`include "p.v"
module tb_p();
    parameter PERIOD = 10;
    reg clk;
    reg rst_n;
    reg [63:0] state;
    reg [79:0] keys;
    reg [23:0] counter;
    wire [63:0] d_result;
    wire [63:0] result;
    
    // generate colck
    initial begin
        rst_n = 1'b1;
        clk   = 1'b0;
        forever #(PERIOD/2)
            clk = ~clk;
    end
    
    initial begin
        state = 64'hffff_ffff_ffff_ffff;
        keys  = 80'hffff_ffff_ffff_ffff_ffff;
        
    end
    
    assign result = end_conver(d_result);
    
    p u_p(
    .result(d_result),
    .state(state),
    .keys(keys),
    .clk(clk));
    
    initial begin
        $dumpfile("./wave.vcd");
        $dumpvars(0, tb_p);
        #(PERIOD*40) $finish;
    end
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
