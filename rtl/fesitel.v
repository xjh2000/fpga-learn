//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:29:37 05/30/2021 
// Design Name: 
// Module Name:    fesitel 
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
module fesitel(plain,rkey,cipher);
  input[0:127] plain;
  input[0:31] rkey;
  output[0:127] cipher;
  wire[0:31] c0,c1,c2,c3,W,w1,f1,f2,f11,f21;
  assign c0=plain[0:31];
  assign c1=plain[32:63];
  assign c2=plain[64:95];
  assign c3=plain[96:127];
  assign W=c1^c2;
  fS t(W,rkey,w1);
  F1 a(w1,rkey,f1);
  F2 b(w1,rkey,f2);
  assign f11=f1^c0;
  assign f21=f2^c3;
  assign cipher={c2,f21,f11,c1};
  
endmodule