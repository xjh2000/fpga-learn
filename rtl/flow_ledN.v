module flow_ledN(input sys_clk,         // system clock
                 input sys_rst_n,       // system reset
                 output reg [3:0] led); // four led out pin
    
    reg [23:0] counter;
    
    // counter reg number increment
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (!sys_rst_n)
            counter <= 24'd0;
        else if (counter < 24'd1000_0000 - 1'd1)
            counter <= counter + 1'b1;
        else
            counter <= 24'd0;
    end
    
    // cyclic shift by counter
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (!sys_rst_n)
            led <= 4'b0001;
        else if (counter == 24'd1000_0000 - 1'd1)
            led[3:0] <= {led[2:0],led[3]};
        else
            led <= led;
    end
endmodule
