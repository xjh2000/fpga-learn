module matrix (state,res);
  input [15:0]state;
  output [15:0]res;
  
  assign res={state[11:8]^state[7:4]^state[3:0],state[15:12]^state[7:4]^state[3:0],state[15:12]^state[11:8]^state[3:0],state[15:12]^state[11:8]^state[7:4]};
endmodule 