module aes_key_expand_128(clk,
                      start_flag,
                      key,
                      wo_0,
                      wo_1,
                      wo_2,
                      wo_3);
    input		clk;
    input		start_flag;
    input	[127:0]	key;
    output	[31:0]	wo_0, wo_1, wo_2, wo_3;
    reg	[31:0]	w[3:0];
    wire	[31:0]	tmp_w;
    wire	[31:0]	subword;
    wire	[31:0]	rcon;
    
    assign wo_0 = w[0];
    assign wo_1 = w[1];
    assign wo_2 = w[2];
    assign wo_3 = w[3];
    
    // parallel_case
    // first we need w_next[0] = SubWord(w[3]) ^ RCON
    // then w_next[1] = w[1] ^ w_next[0]
    // then w_next[2] = w[2] ^ w_next[1]
    // then w_next[3] = w[3] ^ w_next[2]
    
    always @(posedge clk)	w[0] <= start_flag ? key[127:096] : w[0]^subword^rcon;
    always @(posedge clk)	w[1] <= start_flag ? key[095:064] : w[0]^w[1]^subword^rcon;
    always @(posedge clk)	w[2] <= start_flag ? key[063:032] : w[0]^w[2]^w[1]^subword^rcon;
    always @(posedge clk)	w[3] <= start_flag ? key[031:000] : w[0]^w[3]^w[2]^w[1]^subword^rcon;
    
    assign tmp_w = w[3];
    
    // RotWord and SubWord
    aes_sbox u0(	.in(tmp_w[23:16]), .out(subword[31:24]));
    aes_sbox u1(	.in(tmp_w[15:08]), .out(subword[23:16]));
    aes_sbox u2(	.in(tmp_w[07:00]), .out(subword[15:08]));
    aes_sbox u3(	.in(tmp_w[31:24]), .out(subword[07:00]));
    
    aes_rcon r0(	.clk(clk), .start_flag(start_flag), .out(rcon));
endmodule
