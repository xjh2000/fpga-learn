module SubNibble(s_in,s_out1);
	input [63:0]s_in;
	output [63:0]s_out1;

                wire [63:0]s_out,s_out1;

	sbox s1(s_in[3:0],s_out[3:0]);
	sbox s2(s_in[7:4],s_out[7:4]);
	sbox s3(s_in[11:8],s_out[11:8]);
	sbox s4(s_in[15:12],s_out[15:12]);
	sbox s5(s_in[19:16],s_out[19:16]);
	sbox s6(s_in[23:20],s_out[23:20]);
	sbox s7(s_in[27:24],s_out[27:24]);
	sbox s8(s_in[31:28],s_out[31:28]);
	sbox s9(s_in[35:32],s_out[35:32]);
	sbox s10(s_in[39:36],s_out[39:36]);
	sbox s11(s_in[43:40],s_out[43:40]);
	sbox s12(s_in[47:44],s_out[47:44]);
	sbox s13(s_in[51:48],s_out[51:48]);
	sbox s14(s_in[55:52],s_out[55:52]);
	sbox s15(s_in[59:56],s_out[59:56]);
	sbox s16(s_in[63:60],s_out[63:60]);

assign s_out1={s_out[63:60],s_out[35:32],s_out[23:20],s_out[11:8],s_out[47:44],s_out[19:16],s_out[7:4],s_out[59:56],s_out[31:28],s_out[3:0],s_out[55:52],s_out[43:40],s_out[15:12],s_out[51:48],s_out[39:36],s_out[27:24]};
endmodule


