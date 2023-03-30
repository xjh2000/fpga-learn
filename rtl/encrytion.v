//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    17:28:13 05/30/2021
// Design Name:
// Module Name:    encrytion
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module encrytion(Plain,
                 Key,
                 clock,
                 encrypt_start, // start encrypt
                 encrypt_end,   // encrypt finish
                 Cipher);
    input [0:127] Plain;
    input [0:63] Key;
    input encrypt_start;
    input clock;
    output reg encrypt_end;
    output [0:127] Cipher;
    reg[0:5] r;
    reg[0:31] rkey1;
    reg[0:127] cipher2;
    reg [0:63] Key1;
    reg[0:31] t1;
    wire[0:63] key11;
    wire[0:127] cipher3;
    wire[0:31] rt;
    
    initial
    begin
        r <= 6'h0;
    end
    
    always @(posedge clock)
    begin
        r <= (encrypt_start)?r+1:1;
        rkey1 = (encrypt_start)?key11[0:31]:Key[0:31];
        Key1  = (encrypt_start)?key11:Key;
        cipher2 <= (encrypt_start)?cipher3:Plain;
    end
    
    // end encrypt if encrypt finish by r
    always @(posedge  clock) begin
        if (r == 32 && encrypt_start) begin
            encrypt_end = 1;
        end
        else begin
            encrypt_end = 0;
        end
    end
    
    expandrey c(Key1,r,t1,rkey1,key11);
    fesitel d(cipher2,rkey1,cipher3);
    assign Cipher = {cipher2[64:95],cipher2[96:127],cipher2[0:31],cipher2[32:63]};
endmodule
