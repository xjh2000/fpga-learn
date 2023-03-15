module IVLBC(input [63:0] state,     // PlainText
             input [79:0] keys,      // key
             input sys_clk,          // clock
             input encrypt_start,    // start encrypt
             output reg encrypt_end, // encrypt finish
             output [63:0] result);  // final result

reg   [4:0] cnt;
reg   [63:0]  res;
reg   [79:0]  k;
wire  [63:0]  te,te1,s_add;
wire  [79:0]  r_keys;



always @(posedge sys_clk)  begin
    cnt <= (encrypt_start)? cnt+1: 1;
    res <= ((encrypt_start) ?te:state) ;
    k   <= ((encrypt_start) ?r_keys:keys) ;
    if (cnt == 29) begin
        res <= res;
        end else begin
        res <= ((encrypt_start) ?te:state) ;
    end
end

// end encrypt if encrypt finish by cnt
always @(posedge  sys_clk) begin
    if (cnt == 29 && encrypt_start) begin
        encrypt_end = 1;
    end
    else begin
        encrypt_end = 0;
    end
end

// round encrypt
keyex  kq(k,cnt,r_keys);
assign s_add = res ^ r_keys[79:16];
SubNibble   s1(s_add,te1);
matrix m1(te1[63:48],te[63:48]);
matrix m2(te1[47:32],te[47:32]);
matrix m3(te1[31:16],te[31:16]);
matrix m4(te1[15:0],te[15:0]);
assign result = res^k[79:16];

endmodule

