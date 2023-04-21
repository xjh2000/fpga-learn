`timescale  1ns / 1ps
module tb_p();
    parameter PERIOD = 10;
    reg clk;
    reg rst_n;
    reg start_flag;
    reg [127:0] state;
    reg [127:0] keys;
    reg [23:0] counter;
    wire [127:0] result;
    wire end_flag ;
    
    // generate colck
    initial begin
        rst_n = 1'b1;
        clk   = 1'b0;
        forever #(PERIOD/2)
            clk = ~clk;
    end
    
    
    initial begin
        // state                    = 64'hffff_ffff_ffff_ffff;
        // keys                     = 80'hffff_ffff_ffff_ffff_ffff;
        state                       = 128'h6bc1bee22e409f96e93d7e117393172a;
        keys                        = 128'h2b7e151628aed2a6abf7158809cf4f3c;
        #((PERIOD/2)*1)  start_flag = 1'b1;
        #((PERIOD/2)*2)  start_flag = 1'b0;
    end
    
    
    
    aes_cipher_top u_aes(
    .text_out(result),
    .text_in(state),
    .key(keys),
    .ld(start_flag),
    .done(end_flag),
    .clk(clk));
    
    initial begin
        $dumpfile("./wave.vcd");
        $dumpvars(0, tb_p);
        #(PERIOD*40) $finish;
    end
    
endmodule
