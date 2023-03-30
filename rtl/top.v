module top(output out_result,
           input sys_clk,     // 50 M system clock
           input sys_rst_n);
    
    reg [0:127] plain; /*synthesis syn_preserve = 1*/
    reg [0:63] key;  /*synthesis syn_preserve = 1*/
    reg  clk;
    reg [23:0] counter;
    reg [27:0] led_counter;
    reg [0:127] cipher;  /*synthesis syn_preserve = 1*/
    
    wire [0:127] result; /*synthesis syn_keep = 1*/
    
    assign out_result = (result == 128'h00|| led_counter == 28'd0)?~out_result:out_result;
    
    
    // p clk generate
    always @(posedge sys_clk) begin
        cipher = end_conver(result);
        
        if (led_counter<28'd25_000_000 -1'd1) begin
            led_counter <= led_counter + 1'd1;
            end else begin
            led_counter <= 28'd0;
        end
        
        if (counter < 24'd100 - 1'd1) begin
            counter <= counter + 1'b1;
            end else begin
            plain   <= 128'hffff_ffff_ffff_ffff_ffff_ffff_ffff_ffff;
            key     <= 64'h0000_0000_0000_0000;
            clk     <= ~clk;
            counter <= 24'd0;
        end
    end
    
    encrytion u_e(
    .Plain(plain),
    .Key(key),
    .clock(clk),
    .Cipher(result));
    
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
