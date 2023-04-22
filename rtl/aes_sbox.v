module aes_sbox(input [7:0] in,    // input data byte
                output [7:0] out); // output data byte
// [y0]    [1 0 0 0 1 1 1 1] [x0]   [1]
// [y1]    [1 1 0 0 0 1 1 1] [x1]   [1]
// [y2]    [1 1 1 0 0 0 1 1] [x2]   [0]
// [y3]    [1 1 1 1 0 0 0 1] [x3]   [0]
// [y4] = [1 1 1 1 1 0 0 0] [x4] + [0]
// [y5]    [0 1 1 1 1 1 0 0] [x5]   [1]
// [y6]    [0 0 1 1 1 1 1 0] [x6]   [1]
// [y7]    [0 0 0 1 1 1 1 1] [x7]   [0]

assign out[0] = in[0]^in[4]^in[5]^in[6]^in[7]^1;
assign out[1] = in[0]^in[1]^in[5]^in[6]^in[7]^1;
assign out[2] = in[0]^in[1]^in[2]^in[6]^in[7]^0;
assign out[3] = in[0]^in[1]^in[2]^in[3]^in[7]^0;
assign out[4] = in[0]^in[1]^in[2]^in[3]^in[4]^0;
assign out[5] = in[1]^in[2]^in[3]^in[4]^in[5]^1;
assign out[6] = in[2]^in[3]^in[4]^in[5]^in[6]^1;
assign out[7] = in[3]^in[4]^in[5]^in[6]^in[7]^0;

endmodule
