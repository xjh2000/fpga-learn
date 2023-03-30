//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:30:20 05/30/2021 
// Design Name: 
// Module Name:    eS 
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
module eS(Row0,Row1,Row2,Row3,rkey,row00,row11,row22,row33);
  input[0:15] Row0;
  input[0:15] Row1;
  input[0:15] Row2;
  input[0:15] Row3;
  input[0:31] rkey;
  output[0:15] row00;
  output[0:15] row11;
  output[0:15] row22;
  output[0:15] row33;
  wire[0:7] s0,s1,s2,s3,s[1:7];
  
 
  assign s[1]=~(Row1[8:15]);
  assign s[2]=(Row0[8:15]&s[1]);
  assign s[3]=(Row2[8:15]^Row3[8:15]);

  assign s1=s[3]^s[2];
  assign s[4]=(Row3[8:15]|s[1]);
  assign s[5]=((Row0[8:15]^s[4]));

  assign s0=Row2[8:15]^s[5];
  assign s[6]=(Row1[8:15]^Row2[8:15]);
  assign s[7]=(s[3]&s[5]);

  assign s2=s[6]^s[7];
  assign s3=((rkey[24:31]&rkey[16:23])&((~Row2[8:15]&~Row1[8:15])|(Row3[8:15]&~Row1[8:15]&~Row0[8:15])|(~Row3[8:15]&~Row1[8:15]&Row0[8:15])|(~Row3[8:15]&Row2[8:15]&Row1[8:15])))|
		 (((rkey[0:7]^rkey[8:15])&~rkey[24:31])&((~Row3[8:15]&~Row1[8:15]&Row0[8:15])|(~Row2[8:15]&Row1[8:15]&~Row0[8:15])|(Row3[8:15]&Row1[8:15]&Row0[8:15])|(Row3[8:15]&~Row2[8:15])))|
		 
		 ((~(rkey[0:7]^rkey[8:15])&~rkey[24:31])&((~Row2[8:15]&~Row0[8:15])|(~Row3[8:15]&~Row1[8:15]&~Row0[8:15])|(Row3[8:15]&~Row2[8:15]&~Row1[8:15])|(~Row3[8:15]&Row1[8:15]&Row0[8:15])))|
		
		 ((~rkey[16:23]&rkey[24:31])&((~Row3[8:15]&~Row1[8:15]&Row0[8:15])|(Row3[8:15]&Row1[8:15]&Row0[8:15])|(Row2[8:15]&Row1[8:15]&~Row0[8:15])|(Row3[8:15]&Row2[8:15])));
		 

  
  assign row00={Row0[0:7],s0};
  assign row11={Row1[0:7],s1};
  assign row22={Row2[0:7],s2};
  assign row33={Row3[0:7],s3};

endmodule
