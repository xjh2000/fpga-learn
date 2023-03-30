//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:29:02 05/30/2021 
// Design Name: 
// Module Name:    expandrey 
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
module expandrey(Key,i,tt,rkey,key11);
  input[0:63] Key;
  input[0:5] i;
  input[0:31] tt;
  input[0:31] rkey;
  output[0:63] key11;
  wire[0:4] b,d,x1[0:3],x2[0:3];
  wire[0:15] Row[0:3],row1[0:3],w[0:3],z;
  assign Row[0]=Key[48:63];
  assign Row[1]=Key[32:47];
  assign Row[2]=Key[16:31];
  assign Row[3]=Key[0:15];
 
  
  eS s(Row[0],Row[1],Row[2],Row[3],rkey,row1[0],row1[1],row1[2],row1[3]);
  one_fesitel one(row1[0],row1[1],row1[2],row1[3],tt,w[0],w[1],w[2],w[3]);

  
  assign b=w[3][0:4];
  assign d=b^i;
  assign z={d[0:4],w[3][5:15]};

  assign key11={z,w[2],w[1],w[0]};

endmodule
