module MixColunm(x010,x011,x02,x03,b);
  input [0:7] x010;
  input [0:7] x011;
  input [0:7] x02;
  input [0:7] x03;
  output [0:7] b;
  wire[0:7] x1,x2,x3;
  xtime c1(x02,x1);
  xtime c2(x03,x2);
  assign b=x010^x011^x1^x2^x03;
endmodule