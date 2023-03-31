module KeySetup(key,
                r,
                rkey);
    input [0:127] key;
    input [0:3] r;
    output [0:127] rkey;
    reg [0:31] Rcon[1:10];
    wire [0:31] rkey1,rkey2,rkey3,rkey4,rkey5,rkey6;
    initial
    begin
        Rcon[1] = 32'h01000000;Rcon[2] = 32'h02000000;Rcon[3] = 32'h04000000;Rcon[4] = 32'h08000000;Rcon[5] = 32'h10000000;
        Rcon[6] = 32'h20000000;Rcon[7] = 32'h40000000;Rcon[8] = 32'h80000000;Rcon[9] = 32'h1b000000;Rcon[10] = 32'h36000000;
    end
    assign rkey1 = key[0:31];
    assign rkey2 = key[32:63];
    assign rkey3 = key[64:95];
    assign rkey4 = key[96:127];
    assign rkey5 = {rkey4[8:15],rkey4[16:23],rkey4[24:31],rkey4[0:7]};
    ByteSub bytesub(rkey5,rkey6);
    assign rkey[0:31]   = rkey1^(rkey6^Rcon[r]);
    assign rkey[32:63]  = rkey[0:31]^rkey2;
    assign rkey[64:95]  = rkey[32:63]^rkey3;
    assign rkey[96:127] = rkey[64:95]^rkey4;
endmodule
    
