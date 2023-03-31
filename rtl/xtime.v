module xtime(a,b);
  input [0:7] a;
  output [0:7] b;
  wire [0:7] b1,b2;
  reg [0:7] c;
  reg c1;
  initial
  begin
   c1<=0;
   c<=8'h1b;
  end
  assign b1={a[1:7],c1};
  assign b2={a[1:7],c1};
  assign b=(a[0]^0)?(b2^c):b1;
endmodule
