module Round1(plain,key,clock,cipher);
  input [0:127] plain;
  input [0:127] key;
  input clock;
  output [0:127] cipher;
  wire [0:127] rkey1,rkey2;
  wire [0:127] cipher1,cipher3;

  reg [0:127] key1,cipher2;
  reg [0:3] r;

  initial
  begin
    r<=0;
  end
  
  assign cipher1=plain^key;
  
  always @(posedge clock)
  begin
   r<=(r^9)?r+1:0;
   key1=(r)?rkey1:key;
   cipher2<=(r)?cipher3:cipher1;
  end

  round9 f(cipher2,key1,r,cipher3,rkey1);
  
  KeySetup f3(key1,4'd10,rkey2);
  round10 f1(cipher2,rkey2,cipher);
endmodule
  
  
  
  
  
    
  
  
  

    
    
  
  
  
  
  
  
