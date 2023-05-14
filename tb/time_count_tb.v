`timescale 1ns/1ns

module time_count_tb ();
    parameter PERIOD = 2;
    reg clk;
    reg rst_n;
    
    // generate colck
    initial begin
        rst_n = 1'b1;
        clk   = 1'b0;
        forever #(PERIOD/2)
            clk = ~clk;
    end
    wire flag;
    
    // 0.5 when 50MHz
    time_count  #(.MAX_NUM    (25_000_000)) tc1(
    .clk(clk),
    .rst_n(rst_n),
    .flag(flag)
    );
    
    
    
endmodule //time_count_tb
