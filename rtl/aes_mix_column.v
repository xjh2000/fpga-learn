module aes_mix_column (input [7:0] s0,
                       input [7:0] s1,
                       input [7:0] s2,
                       input [7:0] s3,
                       output reg [7:0] s0_o,
                       output reg [7:0] s1_o,
                       output reg [7:0] s2_o,
                       output reg [7:0] s3_o);

always @(s0 or s1 or s2 or s3) begin
    s0_o = xtime(s0)^xtime(s1)^s1^s2^s3;
    s1_o = s0^xtime(s1)^xtime(s2)^s2^s3;
    s2_o = s0^s1^xtime(s2)^xtime(s3)^s3;
    s3_o = xtime(s0)^s0^s1^s2^xtime(s3);
end

function [7:0] xtime;
    input [7:0] b; xtime = {b[6:0],1'b0}^(8'h1b&{8{b[7]}});
endfunction

endmodule //aes_mix_column
