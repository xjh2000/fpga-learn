module aes_cipher_top(clk,
                      rst,
                      ld,
                      done,
                      key,
                      text_in,
                      text_out);
    
    input		clk, rst;
    input		ld;
    output		done;
    
    input	[127:0]	key;
    input	[127:0]	text_in;
    output	[127:0]	text_out;
    
    ////////////////////////////////////////////////////////////////////
    //
    // Local Wires
    //
    
    wire	[31:0]	w0, w1, w2, w3;
    reg	[127:0]	text_in_r;
    reg	[127:0]	text_out;
    reg	[7:0]	sa00, sa01, sa02, sa03;
    reg	[7:0]	sa10, sa11, sa12, sa13;
    reg	[7:0]	sa20, sa21, sa22, sa23;
    reg	[7:0]	sa30, sa31, sa32, sa33;
    wire	[7:0]	sa00_next, sa01_next, sa02_next, sa03_next;
    wire	[7:0]	sa10_next, sa11_next, sa12_next, sa13_next;
    wire	[7:0]	sa20_next, sa21_next, sa22_next, sa23_next;
    wire	[7:0]	sa30_next, sa31_next, sa32_next, sa33_next;
    wire	[7:0]	sa00_sub, sa01_sub, sa02_sub, sa03_sub;
    wire	[7:0]	sa10_sub, sa11_sub, sa12_sub, sa13_sub;
    wire	[7:0]	sa20_sub, sa21_sub, sa22_sub, sa23_sub;
    wire	[7:0]	sa30_sub, sa31_sub, sa32_sub, sa33_sub;
    wire	[7:0]	sa00_sr, sa01_sr, sa02_sr, sa03_sr;
    wire	[7:0]	sa10_sr, sa11_sr, sa12_sr, sa13_sr;
    wire	[7:0]	sa20_sr, sa21_sr, sa22_sr, sa23_sr;
    wire	[7:0]	sa30_sr, sa31_sr, sa32_sr, sa33_sr;
    wire	[7:0]	sa00_mc, sa01_mc, sa02_mc, sa03_mc;
    wire	[7:0]	sa10_mc, sa11_mc, sa12_mc, sa13_mc;
    wire	[7:0]	sa20_mc, sa21_mc, sa22_mc, sa23_mc;
    wire	[7:0]	sa30_mc, sa31_mc, sa32_mc, sa33_mc;
    reg		done, ld_r;
    reg	[3:0]	dcnt;
    
    ////////////////////////////////////////////////////////////////////
    //
    // Misc Logic
    //
    
    always @(posedge clk)
        if (!rst)	dcnt <= 4'h0;
        else
        if (ld)		dcnt <= 4'hb;
        else
        if (|dcnt)	dcnt <= dcnt - 4'h1;
    
    always @(posedge clk) done              <= !(|dcnt[3:1]) & dcnt[0] & !ld;
    always @(posedge clk) if (ld) text_in_r <= text_in;
    always @(posedge clk) ld_r              <= ld;
    
    ////////////////////////////////////////////////////////////////////
    //
    // Initial Permutation (AddRoundKey)
    //
    
    always @(posedge clk)	sa33 <= ld_r ? text_in_r[007:000] ^ w3[07:00] : sa33_next;
    always @(posedge clk)	sa23 <= ld_r ? text_in_r[015:008] ^ w3[15:08] : sa23_next;
    always @(posedge clk)	sa13 <= ld_r ? text_in_r[023:016] ^ w3[23:16] : sa13_next;
    always @(posedge clk)	sa03 <= ld_r ? text_in_r[031:024] ^ w3[31:24] : sa03_next;
    always @(posedge clk)	sa32 <= ld_r ? text_in_r[039:032] ^ w2[07:00] : sa32_next;
    always @(posedge clk)	sa22 <= ld_r ? text_in_r[047:040] ^ w2[15:08] : sa22_next;
    always @(posedge clk)	sa12 <= ld_r ? text_in_r[055:048] ^ w2[23:16] : sa12_next;
    always @(posedge clk)	sa02 <= ld_r ? text_in_r[063:056] ^ w2[31:24] : sa02_next;
    always @(posedge clk)	sa31 <= ld_r ? text_in_r[071:064] ^ w1[07:00] : sa31_next;
    always @(posedge clk)	sa21 <= ld_r ? text_in_r[079:072] ^ w1[15:08] : sa21_next;
    always @(posedge clk)	sa11 <= ld_r ? text_in_r[087:080] ^ w1[23:16] : sa11_next;
    always @(posedge clk)	sa01 <= ld_r ? text_in_r[095:088] ^ w1[31:24] : sa01_next;
    always @(posedge clk)	sa30 <= ld_r ? text_in_r[103:096] ^ w0[07:00] : sa30_next;
    always @(posedge clk)	sa20 <= ld_r ? text_in_r[111:104] ^ w0[15:08] : sa20_next;
    always @(posedge clk)	sa10 <= ld_r ? text_in_r[119:112] ^ w0[23:16] : sa10_next;
    always @(posedge clk)	sa00 <= ld_r ? text_in_r[127:120] ^ w0[31:24] : sa00_next;
    
    // key expand
    aes_key_expand_128 u0(
    .clk(		clk	),
    .start_flag(		ld	),
    .key(		key	),
    .wo_0(		w0	),
    .wo_1(		w1	),
    .wo_2(		w2	),
    .wo_3(		w3	));
    
    // sub byte
    aes_sbox us00(	.in(	sa00	), .out(	sa00_sub	));
    aes_sbox us01(	.in(	sa01	), .out(	sa01_sub	));
    aes_sbox us02(	.in(	sa02	), .out(	sa02_sub	));
    aes_sbox us03(	.in(	sa03	), .out(	sa03_sub	));
    aes_sbox us10(	.in(	sa10	), .out(	sa10_sub	));
    aes_sbox us11(	.in(	sa11	), .out(	sa11_sub	));
    aes_sbox us12(	.in(	sa12	), .out(	sa12_sub	));
    aes_sbox us13(	.in(	sa13	), .out(	sa13_sub	));
    aes_sbox us20(	.in(	sa20	), .out(	sa20_sub	));
    aes_sbox us21(	.in(	sa21	), .out(	sa21_sub	));
    aes_sbox us22(	.in(	sa22	), .out(	sa22_sub	));
    aes_sbox us23(	.in(	sa23	), .out(	sa23_sub	));
    aes_sbox us30(	.in(	sa30	), .out(	sa30_sub	));
    aes_sbox us31(	.in(	sa31	), .out(	sa31_sub	));
    aes_sbox us32(	.in(	sa32	), .out(	sa32_sub	));
    aes_sbox us33(	.in(	sa33	), .out(	sa33_sub	));
    
    
    // shift row
    assign sa00_sr = sa00_sub;
    assign sa01_sr = sa01_sub;
    assign sa02_sr = sa02_sub;
    assign sa03_sr = sa03_sub;
    assign sa10_sr = sa11_sub;
    assign sa11_sr = sa12_sub;
    assign sa12_sr = sa13_sub;
    assign sa13_sr = sa10_sub;
    assign sa20_sr = sa22_sub;
    assign sa21_sr = sa23_sub;
    assign sa22_sr = sa20_sub;
    assign sa23_sr = sa21_sub;
    assign sa30_sr = sa33_sub;
    assign sa31_sr = sa30_sub;
    assign sa32_sr = sa31_sub;
    assign sa33_sr = sa32_sub;
    
    // mix column
    aes_mix_column um0(
    .s0(sa00_sr),
    .s1(sa10_sr),
    .s2(sa20_sr),
    .s3(sa30_sr),
    .s0_o(sa00_mc),
    .s1_o(sa10_mc),
    .s2_o(sa20_mc),
    .s3_o(sa30_mc)
    );

    aes_mix_column um1(
    .s0(sa01_sr),
    .s1(sa11_sr),
    .s2(sa21_sr),
    .s3(sa31_sr),
    .s0_o(sa01_mc),
    .s1_o(sa11_mc),
    .s2_o(sa21_mc),
    .s3_o(sa31_mc)
    );

     aes_mix_column um2(
    .s0(sa02_sr),
    .s1(sa12_sr),
    .s2(sa22_sr),
    .s3(sa32_sr),
    .s0_o(sa02_mc),
    .s1_o(sa12_mc),
    .s2_o(sa22_mc),
    .s3_o(sa32_mc)
    );

    
     aes_mix_column um3(
    .s0(sa03_sr),
    .s1(sa13_sr),
    .s2(sa23_sr),
    .s3(sa33_sr),
    .s0_o(sa03_mc),
    .s1_o(sa13_mc),
    .s2_o(sa23_mc),
    .s3_o(sa33_mc)
    );
  
    assign sa00_next                            = sa00_mc ^ w0[31:24];
    assign sa01_next                            = sa01_mc ^ w1[31:24];
    assign sa02_next                            = sa02_mc ^ w2[31:24];
    assign sa03_next                            = sa03_mc ^ w3[31:24];
    assign sa10_next                            = sa10_mc ^ w0[23:16];
    assign sa11_next                            = sa11_mc ^ w1[23:16];
    assign sa12_next                            = sa12_mc ^ w2[23:16];
    assign sa13_next                            = sa13_mc ^ w3[23:16];
    assign sa20_next                            = sa20_mc ^ w0[15:08];
    assign sa21_next                            = sa21_mc ^ w1[15:08];
    assign sa22_next                            = sa22_mc ^ w2[15:08];
    assign sa23_next                            = sa23_mc ^ w3[15:08];
    assign sa30_next                            = sa30_mc ^ w0[07:00];
    assign sa31_next                            = sa31_mc ^ w1[07:00];
    assign sa32_next                            = sa32_mc ^ w2[07:00];
    assign sa33_next                            = sa33_mc ^ w3[07:00];
    
    ////////////////////////////////////////////////////////////////////
    //
    // Final text output
    //
    
    always @(posedge clk) text_out[127:120] <= sa00_sr ^ w0[31:24];
    always @(posedge clk) text_out[095:088] <= sa01_sr ^ w1[31:24];
    always @(posedge clk) text_out[063:056] <= sa02_sr ^ w2[31:24];
    always @(posedge clk) text_out[031:024] <= sa03_sr ^ w3[31:24];
    always @(posedge clk) text_out[119:112] <= sa10_sr ^ w0[23:16];
    always @(posedge clk) text_out[087:080] <= sa11_sr ^ w1[23:16];
    always @(posedge clk) text_out[055:048] <= sa12_sr ^ w2[23:16];
    always @(posedge clk) text_out[023:016] <= sa13_sr ^ w3[23:16];
    always @(posedge clk) text_out[111:104] <= sa20_sr ^ w0[15:08];
    always @(posedge clk) text_out[079:072] <= sa21_sr ^ w1[15:08];
    always @(posedge clk) text_out[047:040] <= sa22_sr ^ w2[15:08];
    always @(posedge clk) text_out[015:008] <= sa23_sr ^ w3[15:08];
    always @(posedge clk) text_out[103:096] <= sa30_sr ^ w0[07:00];
    always @(posedge clk) text_out[071:064] <= sa31_sr ^ w1[07:00];
    always @(posedge clk) text_out[039:032] <= sa32_sr ^ w2[07:00];
    always @(posedge clk) text_out[007:000] <= sa33_sr ^ w3[07:00];
    
    ////////////////////////////////////////////////////////////////////
    //
    // Generic Functions
    //
    
    function [31:0] mix_col;
        input	[7:0]	s0,s1,s2,s3;
        reg	[7:0]	s0_o,s1_o,s2_o,s3_o;
        begin
            mix_col[31:24] = xtime(s0)^xtime(s1)^s1^s2^s3;
            mix_col[23:16] = s0^xtime(s1)^xtime(s2)^s2^s3;
            mix_col[15:08] = s0^s1^xtime(s2)^xtime(s3)^s3;
            mix_col[07:00] = xtime(s0)^s0^s1^s2^xtime(s3);
        end
    endfunction
    
    function [7:0] xtime;
        input [7:0] b; xtime = {b[6:0],1'b0}^(8'h1b&{8{b[7]}});
    endfunction
    
    ////////////////////////////////////////////////////////////////////
    //
    // Modules
    //
    
    
    
endmodule
