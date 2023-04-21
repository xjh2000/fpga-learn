module aes_rcon(input clk,              // system clock
                input start_flag,       // start flag
                output reg [31:0] out); // output rcon
    reg	[3:0]	rcnt;
    wire	[3:0]	rcnt_next;
    // change out data
    always @(posedge clk)
        if (start_flag)		out <= 32'h01_00_00_00;
        else		out            <= frcon(rcnt_next);

    assign rcnt_next = rcnt + 4'h1;
    // change rcnt
    always @(posedge clk)
        if (start_flag)		rcnt <= 4'h0;
        else		rcnt            <= rcnt_next;
    function [31:0]	frcon;
        input	[3:0]	i;
        case(i)
            4'h0: frcon    = 32'h01_00_00_00;
            4'h1: frcon    = 32'h02_00_00_00;
            4'h2: frcon    = 32'h04_00_00_00;
            4'h3: frcon    = 32'h08_00_00_00;
            4'h4: frcon    = 32'h10_00_00_00;
            4'h5: frcon    = 32'h20_00_00_00;
            4'h6: frcon    = 32'h40_00_00_00;
            4'h7: frcon    = 32'h80_00_00_00;
            4'h8: frcon    = 32'h1b_00_00_00;
            4'h9: frcon    = 32'h36_00_00_00;
            default: frcon = 32'h00_00_00_00;
        endcase
    endfunction
    
endmodule
