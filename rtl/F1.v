//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:34:49 05/30/2021 
// Design Name: 
// Module Name:    F1 
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
module F1(w,rkey,W1);
  input[0:31] w;
  input[0:31] rkey;
  output[0:31] W1;
  wire[0:7] Row[0:3];
  wire[0:31] T;
  assign T=w^rkey;
  assign Row[0]=T[24:31];
  assign Row[1]={T[17:23],T[16]};
  assign Row[2]={T[12:15],T[8:11]};
  assign Row[3]={T[5:7],T[0:4]};
  assign W1={Row[3],Row[2],Row[1],Row[0]};

endmodule