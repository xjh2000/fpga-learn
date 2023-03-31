module ByteSub(r,s);
  input [0:31] r;
  output [0:31] s;
  reg [0:7] S[0:15][0:15];
  initial
  begin
    S[0][0]=8'h63;S[0][1]=8'h7c;S[0][2]=8'h77;S[0][3]=8'h7b;S[0][4]=8'hf2;S[0][5]=8'h6b;S[0][6]=8'h6f;S[0][7]=8'hc5;S[0][8]=8'h30;S[0][9]=8'h01;S[0][10]=8'h67;S[0][11]=8'h2b;S[0][12]=8'hfe;S[0][13]=8'hd7;S[0][14]=8'hab;S[0][15]=8'h76;
    S[1][0]=8'hca;S[1][1]=8'h82;S[1][2]=8'hc9;S[1][3]=8'h7d;S[1][4]=8'hfa;S[1][5]=8'h59;S[1][6]=8'h47;S[1][7]=8'hf0;S[1][8]=8'had;S[1][9]=8'hd4;S[1][10]=8'ha2;S[1][11]=8'haf;S[1][12]=8'h9c;S[1][13]=8'ha4;S[1][14]=8'h72;S[1][15]=8'hc0;
    S[2][0]=8'hb7;S[2][1]=8'hfd;S[2][2]=8'h93;S[2][3]=8'h26;S[2][4]=8'h36;S[2][5]=8'h3f;S[2][6]=8'hf7;S[2][7]=8'hcc;S[2][8]=8'h34;S[2][9]=8'ha5;S[2][10]=8'he5;S[2][11]=8'hf1;S[2][12]=8'h71;S[2][13]=8'hd8;S[2][14]=8'h31;S[2][15]=8'h15;
    S[3][0]=8'h04;S[3][1]=8'hc7;S[3][2]=8'h23;S[3][3]=8'hc3;S[3][4]=8'h18;S[3][5]=8'h96;S[3][6]=8'h05;S[3][7]=8'h9a;S[3][8]=8'h07;S[3][9]=8'h12;S[3][10]=8'h80;S[3][11]=8'he2;S[3][12]=8'heb;S[3][13]=8'h27;S[3][14]=8'hb2;S[3][15]=8'h75;
    S[4][0]=8'h09;S[4][1]=8'h83;S[4][2]=8'h2c;S[4][3]=8'h1a;S[4][4]=8'h1b;S[4][5]=8'h6e;S[4][6]=8'h5a;S[4][7]=8'ha0;S[4][8]=8'h52;S[4][9]=8'h3b;S[4][10]=8'hd6;S[4][11]=8'hb3;S[4][12]=8'h29;S[4][13]=8'he3;S[4][14]=8'h2f;S[4][15]=8'h84;
    S[5][0]=8'h53;S[5][1]=8'hd1;S[5][2]=8'h00;S[5][3]=8'hed;S[5][4]=8'h20;S[5][5]=8'hfc;S[5][6]=8'hb1;S[5][7]=8'h5b;S[5][8]=8'h6a;S[5][9]=8'hcb;S[5][10]=8'hbe;S[5][11]=8'h39;S[5][12]=8'h4a;S[5][13]=8'h4c;S[5][14]=8'h58;S[5][15]=8'hcf;
    S[6][0]=8'hd0;S[6][1]=8'hef;S[6][2]=8'haa;S[6][3]=8'hfb;S[6][4]=8'h43;S[6][5]=8'h4d;S[6][6]=8'h33;S[6][7]=8'h85;S[6][8]=8'h45;S[6][9]=8'hf9;S[6][10]=8'h02;S[6][11]=8'h7f;S[6][12]=8'h50;S[6][13]=8'h3c;S[6][14]=8'h9f;S[6][15]=8'ha8;
    S[7][0]=8'h51;S[7][1]=8'ha3;S[7][2]=8'h40;S[7][3]=8'h8f;S[7][4]=8'h92;S[7][5]=8'h9d;S[7][6]=8'h38;S[7][7]=8'hf5;S[7][8]=8'hbc;S[7][9]=8'hb6;S[7][10]=8'hda;S[7][11]=8'h21;S[7][12]=8'h10;S[7][13]=8'hff;S[7][14]=8'hf3;S[7][15]=8'hd2;
    S[8][0]=8'hcd;S[8][1]=8'h0c;S[8][2]=8'h13;S[8][3]=8'hec;S[8][4]=8'h5f;S[8][5]=8'h97;S[8][6]=8'h44;S[8][7]=8'h17;S[8][8]=8'hc4;S[8][9]=8'ha7;S[8][10]=8'h7e;S[8][11]=8'h3d;S[8][12]=8'h64;S[8][13]=8'h5d;S[8][14]=8'h19;S[8][15]=8'h73;
    S[9][0]=8'h60;S[9][1]=8'h81;S[9][2]=8'h4f;S[9][3]=8'hdc;S[9][4]=8'h22;S[9][5]=8'h2a;S[9][6]=8'h90;S[9][7]=8'h88;S[9][8]=8'h46;S[9][9]=8'hee;S[9][10]=8'hb8;S[9][11]=8'h14;S[9][12]=8'hde;S[9][13]=8'h5e;S[9][14]=8'h0b;S[9][15]=8'hdb;
    S[10][0]=8'he0;S[10][1]=8'h32;S[10][2]=8'h3a;S[10][3]=8'h0a;S[10][4]=8'h49;S[10][5]=8'h06;S[10][6]=8'h24;S[10][7]=8'h5c;S[10][8]=8'hc2;S[10][9]=8'hd3;S[10][10]=8'hac;S[10][11]=8'h62;S[10][12]=8'h91;S[10][13]=8'h95;S[10][14]=8'he4;S[10][15]=8'h79;
    S[11][0]=8'he7;S[11][1]=8'hc8;S[11][2]=8'h37;S[11][3]=8'h6d;S[11][4]=8'h8d;S[11][5]=8'hd5;S[11][6]=8'h4e;S[11][7]=8'ha9;S[11][8]=8'h6c;S[11][9]=8'h56;S[11][10]=8'hf4;S[11][11]=8'hea;S[11][12]=8'h65;S[11][13]=8'h7a;S[11][14]=8'hae;S[11][15]=8'h08;
    S[12][0]=8'hba;S[12][1]=8'h78;S[12][2]=8'h25;S[12][3]=8'h2e;S[12][4]=8'h1c;S[12][5]=8'ha6;S[12][6]=8'hb4;S[12][7]=8'hc6;S[12][8]=8'he8;S[12][9]=8'hdd;S[12][10]=8'h74;S[12][11]=8'h1f;S[12][12]=8'h4b;S[12][13]=8'hbd;S[12][14]=8'h8b;S[12][15]=8'h8a;
    S[13][0]=8'h70;S[13][1]=8'h3e;S[13][2]=8'hb5;S[13][3]=8'h66;S[13][4]=8'h48;S[13][5]=8'h03;S[13][6]=8'hf6;S[13][7]=8'h0e;S[13][8]=8'h61;S[13][9]=8'h35;S[13][10]=8'h57;S[13][11]=8'hb9;S[13][12]=8'h86;S[13][13]=8'hc1;S[13][14]=8'h1d;S[13][15]=8'h9e;
    S[14][0]=8'he1;S[14][1]=8'hf8;S[14][2]=8'h98;S[14][3]=8'h11;S[14][4]=8'h69;S[14][5]=8'hd9;S[14][6]=8'h8e;S[14][7]=8'h94;S[14][8]=8'h9b;S[14][9]=8'h1e;S[14][10]=8'h87;S[14][11]=8'he9;S[14][12]=8'hce;S[14][13]=8'h55;S[14][14]=8'h28;S[14][15]=8'hdf;
    S[15][0]=8'h8c;S[15][1]=8'ha1;S[15][2]=8'h89;S[15][3]=8'h0d;S[15][4]=8'hbf;S[15][5]=8'he6;S[15][6]=8'h42;S[15][7]=8'h68;S[15][8]=8'h41;S[15][9]=8'h99;S[15][10]=8'h2d;S[15][11]=8'h0f;S[15][12]=8'hb0;S[15][13]=8'h54;S[15][14]=8'hbb;S[15][15]=8'h16;
  end
  assign s={S[{r[0],r[1],r[2],r[3]}][{r[4],r[5],r[6],r[7]}],S[{r[8],r[9],r[10],r[11]}][{r[12],r[13],r[14],r[15]}],S[{r[16],r[17],r[18],r[19]}][{r[20],r[21],r[22],r[23]}],S[{r[24],r[25],r[26],r[27]}][{r[28],r[29],r[30],r[31]}]};
                       
endmodule
   
