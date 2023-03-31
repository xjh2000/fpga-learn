module round9(plain,rkey,r,cipher,key);
  input [0:127] plain;
  input [0:127] rkey;
  input [0:3] r;
  output [0:127] cipher;
  output [0:127] key;
  wire [0:127] plain1,cipher1,S5;
  wire [0:31] S1,S2,S3,S4;
  KeySetup keysetup(rkey,r,key);
  
  ByteSub b1(plain[0:31],S1);
  ByteSub b2(plain[32:63],S2);
  ByteSub b3(plain[64:95],S3);
  ByteSub b4(plain[96:127],S4);
  assign S5={S1,S2,S3,S4};
  assign plain1={S5[0:7],S5[40:47],S5[80:87],S5[120:127],S5[32:39],S5[72:79],S5[112:119],S5[24:31],S5[64:71],S5[104:111],S5[16:23],S5[56:63],S5[96:103],S5[8:15],S5[48:55],S5[88:95]};
  MixColunm b01(plain1[16:23],plain1[24:31],plain1[0:7],plain1[8:15],cipher1[0:7]);
  MixColunm b41(plain1[0:7],plain1[24:31],plain1[8:15],plain1[16:23],cipher1[8:15]);
  MixColunm b81(plain1[0:7],plain1[8:15],plain1[16:23],plain1[24:31],cipher1[16:23]);
  MixColunm b121(plain1[8:15],plain1[16:23],plain1[24:31],plain1[0:7],cipher1[24:31]);
  
  MixColunm b11(plain1[48:55],plain1[56:63],plain1[32:39],plain1[40:47],cipher1[32:39]);
  MixColunm b51(plain1[32:39],plain1[56:63],plain1[40:47],plain1[48:55],cipher1[40:47]);
  MixColunm b91(plain1[32:39],plain1[40:47],plain1[48:55],plain1[56:63],cipher1[48:55]);
  MixColunm b131(plain1[40:47],plain1[48:55],plain1[56:63],plain1[32:39],cipher1[56:63]);
  
  MixColunm b21(plain1[80:87],plain1[88:95],plain1[64:71],plain1[72:79],cipher1[64:71]);
  MixColunm b61(plain1[64:71],plain1[88:95],plain1[72:79],plain1[80:87],cipher1[72:79]);
  MixColunm b101(plain1[64:71],plain1[72:79],plain1[80:87],plain1[88:95],cipher1[80:87]);
  MixColunm b141(plain1[72:79],plain1[80:87],plain1[88:95],plain1[64:71],cipher1[88:95]);
  
  MixColunm b31(plain1[112:119],plain1[120:127],plain1[96:103],plain1[104:111],cipher1[96:103]);
  MixColunm b71(plain1[96:103],plain1[120:127],plain1[104:111],plain1[112:119],cipher1[104:111]);
  MixColunm b111(plain1[96:103],plain1[104:111],plain1[112:119],plain1[120:127],cipher1[112:119]);
  MixColunm b151(plain1[104:111],plain1[112:119],plain1[120:127],plain1[96:103],cipher1[120:127]);
  assign cipher=cipher1^key;

  
endmodule
 
  
