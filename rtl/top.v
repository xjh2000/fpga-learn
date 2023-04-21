module top(output out_result,
           input sys_clk,     // 50 M system clock
           input sys_rst_n);
    
    reg [127:0] plain; /*synthesis syn_preserve = 1*/
    reg [127:0] key;  /*synthesis syn_preserve = 1*/
    reg  clk;
    reg [23:0] counter;
    reg [127:0] cipher;  /*synthesis syn_preserve = 1*/
    reg ld ;
    wire [127:0] result; /*synthesis syn_keep = 1*/
    
    
    // p clk generate
    always @(posedge sys_clk) begin
        
        if (counter < 24'd100 - 1'd1) begin
            counter <= counter + 1'b1;
            ld      <= 0;
            end else begin
            ld      <= 1;
            plain   <= 128'h6bc1bee22e409f96e93d7e117393172a;
            key     <= 128'h2b7e151628aed2a6abf7158809cf4f3c;
            clk     <= ~clk;
            counter <= 24'd0;
        end
    end
    
    aes_cipher_top u_aes(
    .clk(sys_clk),
    .rst(sys_rst_n),
    .ld(ld),
    .done(out_result),
    .key(key),
    .text_in(plain),
    .text_out(result));
    
    function [127:0]     end_conver ;
        input     [0:127] data_in ;
        parameter         MASK = 32'h3 ;
        integer           k ;
        begin
            for(k = 0; k<128; k = k+1) begin
                end_conver[127-k] = data_in[k] ;
            end
        end
    endfunction
    
endmodule
