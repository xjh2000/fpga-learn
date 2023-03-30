module i_loop(input sys_clk,                // system clock
              input sys_rst_n,              // reset sign
              input recv_done,              // reveive done
              input [127:0] recv_data,       // receive data buff
              input tx_busy,                // send busy
              output reg send_en,           // send start
              output reg [127:0] send_data); // send buff
    
    //reg define
    reg recv_done_d0;
    reg recv_done_d1;
    reg tx_ready;
    reg encrypt_start;
    
    wire encrypt_end;
    
    //wire define
    wire recv_done_flag;
    
    reg [127:0] state;
    reg [63:0] keys; /*synthesis syn_preserve = 1*/
    reg  clk;
    reg [23:0] counter;
    
    wire [0:127] result; /*synthesis syn_keep = 1*/
    
    // capture up edge
    assign recv_done_flag = (~recv_done_d1) & recv_done_d0;
    
    // p clk generate
    always @(posedge sys_clk) begin
        
        if (counter < 24'd100 - 1'd1) begin
            counter <= counter + 1'b1;
            end else begin
            keys    <= 80'hffff_ffff_ffff_ffff_ffff;
            clk     <= ~clk;
            counter <= 24'd0;
        end
        
    end
    
    
    
    // delay two clock
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (!sys_rst_n) begin
            recv_done_d0 <= 1'b0;
            recv_done_d1 <= 1'b0;
        end
        else
        begin
            recv_done_d0 <= recv_done;
            recv_done_d1 <= recv_done_d0;
        end
    end
    
    // receive done then send data when send module not busy
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (!sys_rst_n) begin
            tx_ready  <= 1'b0;
            send_en   <= 1'b0;
            send_data <= 8'd0;
        end
        else begin
            if (recv_done_flag) begin
                tx_ready      <= 1'b1;
                send_en       <= 1'b0;
                state         <= recv_data;
                encrypt_start <= 1'b1;
            end
            else begin
                if (tx_ready && (~tx_busy) && (encrypt_end)) begin
                    tx_ready  <= 1'b0;
                    send_en   <= 1'b1;
                    send_data <= result;
                end
                    if (encrypt_end) begin
                        encrypt_start <= 1'b0;
                    end
            end
            
        end
    end
    
    encrytion u_e(
    .Plain(state),
    .Key(keys),
    .clock(clk),
    .encrypt_start(encrypt_start), // start encrypt
    .encrypt_end(encrypt_end),   // encrypt finish
    .Cipher(result));
    
endmodule
