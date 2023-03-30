//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:30:59 05/30/2021 
// Design Name: 
// Module Name:    one_fesitel 
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
module one_fesitel(row00,row11,row22,row33,tt,w00,w11,w22,w33);
  input[0:15] row00;
  input[0:15] row11;
  input[0:15] row22;
  input[0:15] row33;
  input[0:31] tt;
  output[0:15] w00;
  output[0:15] w11;
  output[0:15] w22;
  output[0:15] w33;
  wire[0:15] Row[0:1];
 
  
  
  assign Row[0]=row00;
  
  assign Row[1]=row22;
  
  assign w00=Row[0]^row11;
  assign w11=row22;
  assign w22=Row[1]^row33;
  assign w33=row00;

endmodule
