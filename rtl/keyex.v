module keyex(key,cnt,r_key);
  input[79:0]key;
  input[4:0]cnt; 
  output[79:0]r_key;

 wire  [3:0] rk;
 sbox  sk(key[3:0],rk[3:0]);
 assign r_key={key[39:35]^cnt,key[34:4],rk[3:0],key[68:40],key[79:69]};

endmodule
