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
                 Cipher);
    
    input [0:127] Plain;
    input [0:63] Key;
    input clock;
    output [0:127] Cipher;
    reg[0:5] r; /*synthesis syn_preserve = 1*/
    reg[0:31] rkey1;
    reg[0:127] cipher2;
    reg [0:63] Key1;
    reg[0:31] t1;
    wire[0:63] key11;
    wire[0:127] cipher3;
    wire[0:31] rt;
    initial begin
        r <= 0;
    end
    
    always @(posedge clock)
    begin
        r <= (r^32)?r+1:0;
        rkey1 = (r)?key11[0:31]:Key[0:31];
        Key1  = (r)?key11:Key;
        cipher2 <= (r)?cipher3:Plain;
    end
    
    expandrey c(Key1,r,t1,rkey1,key11);
    fesitel d(cipher2,rkey1,cipher3);
    assign Cipher = {cipher2[64:95],cipher2[96:127],cipher2[0:31],cipher2[32:63]};
endmodule
