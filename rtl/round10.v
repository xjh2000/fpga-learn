module round10(plain,rkey,cipher);
  input [0:127] plain;
  input [0:127] rkey;
  output [0:127] cipher;
  wire [0:127] plain1,S5;
  wire [0:31] S1,S2,S3,S4;
  ByteSub b11(plain[0:31],S1);
  ByteSub b22(plain[32:63],S2);
  ByteSub b33(plain[64:95],S3);
  ByteSub b44(plain[96:127],S4);
  assign S5={S1,S2,S3,S4};
  assign plain1={S5[0:7],S5[40:47],S5[80:87],S5[120:127],S5[32:39],S5[72:79],S5[112:119],S5[24:31],S5[64:71],S5[104:111],S5[16:23],S5[56:63],S5[96:103],S5[8:15],S5[48:55],S5[88:95]};
  assign cipher=plain1^rkey;
endmodule
   
  


