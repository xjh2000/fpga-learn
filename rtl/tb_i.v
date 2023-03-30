`timescale  1ns / 1ps

module tb_i();
    parameter PERIOD = 10;
    reg clk;
    reg rst_n;
    reg encrypt_start;
    reg [0:127] state;
    reg [0:63] keys;
    reg [23:0] counter;
    wire  encrypt_end;
    wire [0:127] result;
    // generate colck
    initial begin
        rst_n         = 1'b1;
        clk           = 1'b0;
        encrypt_start = 1'b0;
        forever #(PERIOD/2)
            clk = ~clk;
        
    end
    
    initial begin
        state = 128'hffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff;
        keys  = 64'h0000_0000_0000_0000;
        #(PERIOD)
        encrypt_start = 1'b1;
    end
    
    
    always @(posedge clk) begin
        if (encrypt_end) begin
            encrypt_start <= 0;
        end
    end
    
    encrytion u_d(
    .Plain(state),
    .Key(keys),
    .clock(clk),
    .Cipher(result)
    );
    
    
    initial begin
        $dumpfile("./wave.vcd");
        $dumpvars(0, tb_i);
        #(PERIOD*40) $finish;
    end
    
endmodule
