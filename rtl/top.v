module top(input sys_clk,    // 50 M system clock
           input sys_rst_n,  // reset sign
           input uart_rxd,   // uart receive
           output uart_txd); // uart send
    
    // parameter define
    parameter  CLK_FREQ = 50000000;         // sys clock frequency
    parameter  UART_BPS = 115200;           // uart bound frequency
    
    // wire define
    wire       uart_recv_done;              // receive done flag
    wire [63:0] uart_recv_data;    /*synthesis syn_keep = 1*/        // receive data buff
    wire       uart_send_en;                // send start flag
    wire [63:0] uart_send_data;              // send data buff
    wire       uart_tx_busy;                // when send is busy
    
    //*****************************************************
    //**                    main code
    //*****************************************************
    
    // uart receive module
    p_uart_recv #(
    .CLK_FREQ       (CLK_FREQ),
    .UART_BPS       (UART_BPS))
    u_p_uart_recv(
    .sys_clk        (sys_clk),
    .sys_rst_n      (sys_rst_n),
    
    .uart_rxd       (uart_rxd),
    .uart_done      (uart_recv_done),
    .uart_data      (uart_recv_data)
    );
    
    // uart send module
    p_uart_send #(
    .CLK_FREQ       (CLK_FREQ),
    .UART_BPS       (UART_BPS))
    u_p_uart_send(
    .sys_clk        (sys_clk),
    .sys_rst_n      (sys_rst_n),
    
    .uart_en        (uart_send_en),
    .uart_din       (uart_send_data),
    .uart_tx_busy   (uart_tx_busy),
    .uart_txd       (uart_txd)
    );
    
    // uart loop module
    i_loop u_i_loop(
    .sys_clk        (sys_clk),
    .sys_rst_n      (sys_rst_n),
    
    .recv_done      (uart_recv_done),
    .recv_data      (uart_recv_data),
    
    .tx_busy        (uart_tx_busy),
    .send_en        (uart_send_en),
    .send_data      (uart_send_data)
    );
    
endmodule
