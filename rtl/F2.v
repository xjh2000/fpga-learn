//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:35:22 05/30/2021 
// Design Name: 
// Module Name:    F2 
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
module F2(w,rkey,W1);
  input[0:31] w;
  input[0:31] rkey;
  output[0:31] W1;
  wire[0:7] Row[0:3];
  wire[0:31] T;
  assign T=w^rkey;
  assign Row[0]=T[24:31];
  assign Row[1]={T[18:23],T[16:17]};
  assign Row[2]={T[11:15],T[8:10]};
  assign Row[3]={T[6:7],T[0:5]};
  assign W1={Row[3],Row[2],Row[1],Row[0]};

endmodule