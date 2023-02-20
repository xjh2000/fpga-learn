module uart_loop(input sys_clk,               // system clock
                 input sys_rst_n,             // reset sign
                 input recv_done,             // reveive done
                 input [7:0] recv_data,       // receive data buff
                 input tx_busy,               // send busy
                 output reg send_en,          // send start
                 output reg [7:0] send_data); // send buff
    
    //reg define
    reg recv_done_d0;
    reg recv_done_d1;
    reg tx_ready;
    
    //wire define
    wire recv_done_flag;
    
    //*****************************************************
    //**                    main code
    //*****************************************************
    // capture up edge
    assign recv_done_flag = (~recv_done_d1) & recv_done_d0;
    
    // delay two clock
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (!sys_rst_n) begin
            recv_done_d0 <= 1'b0;
            recv_done_d1 <= 1'b0;
        end
        else begin
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
                tx_ready  <= 1'b1;                 
                send_en   <= 1'b0;
                send_data <= recv_data;             
            end
            else if (tx_ready && (~tx_busy)) begin   
                tx_ready <= 1'b0;                   
                send_en  <= 1'b1;                   
            end
        end         
    end   
            
endmodule
