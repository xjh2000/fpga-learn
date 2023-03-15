`timescale  1ns / 1ps

module tb_i();
    parameter PERIOD = 10;
    reg clk;
    reg rst_n;
    reg encrypt_start;
    reg [63:0] state;
    reg [79:0] keys;
    reg [23:0] counter;
    wire  encrypt_end;
    wire [63:0] result;     // small encode
    // generate colck
    initial begin
        rst_n         = 1'b1;
        clk           = 1'b0;
        encrypt_start = 1'b0;
        forever #(PERIOD/2)
            clk = ~clk;
        
    end
    
    initial begin
        state = 64'hffff_ffff_ffff_ffff;
        keys  = 80'hffff_ffff_ffff_ffff_ffff;
        #(PERIOD)
        encrypt_start = 1'b1;
    end
    
    
    always @(posedge clk) begin
        if (encrypt_end) begin
            encrypt_start <= 0;
        end
    end
    
    IVLBC u_i(
    .result(result),
    .state(state),
    .encrypt_start(encrypt_start),
    .encrypt_end(encrypt_end),
    .keys(keys),
    .sys_clk(clk));
    
    initial begin
        $dumpfile("./wave.vcd");
        $dumpvars(0, tb_i);
        #(PERIOD*40) $finish;
    end
    
endmodule
