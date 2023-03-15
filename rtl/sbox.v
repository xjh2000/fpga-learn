
module sbox(s_in,s_out);
	input [3:0]s_in;
	output reg [3:0] s_out;
	
	always @(s_in)
		case(s_in)
			4'd0: s_out = 4'd0;
			4'd1: s_out = 4'd15;
			4'd2: s_out = 4'd14;
			4'd3: s_out = 4'd5;
			4'd4: s_out = 4'd13;
			4'd5: s_out = 4'd3;
			4'd6: s_out = 4'd6;
			4'd7: s_out = 4'd12;
			4'd8: s_out = 4'd11;
			4'd9: s_out = 4'd9;
			4'd10: s_out = 4'd10;
			4'd11: s_out = 4'd8;
			4'd12: s_out = 4'd7;
			4'd13: s_out = 4'd4;
			4'd14: s_out = 4'd2;
			4'd15: s_out = 4'd1;
		endcase
	
endmodule