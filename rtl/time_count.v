module time_count(input clk,        // system signal
                  input rst_n,      // reset signal
                  output reg flag); // output flag
    
    // parameter define
    parameter  MAX_NUM = 50_000_000; // defualt 0.5s on frequencef 50MHz
    
    // reg define
    reg [24:0] cnt;                 // max cnt 33_554_431
    
    // main code
    // when cnt is go max_num - 1 , then flag wil be set up , the flag will be periodic output
    always @ (posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            flag <= 1'b0;
            cnt  <= 1'b0;
        end
        else if (cnt < MAX_NUM - 1'b1) begin
            cnt  <= cnt +1'b1;
            flag <= 1'b0;
        end
        else begin
            cnt  <= 1'b0;
            flag <= 1'b1;
        end
    end
    
endmodule
