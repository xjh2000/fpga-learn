module seg_led (input clk,                 // system signal
                input rst_n,               // reset signal
                input [23:0] data,         // 6 led
                input en,                  // enable flag
                output reg [5:0] seg_sel,  // Nixie tube select
                output reg [7:0] seg_led); // Nixie tube show
    
    // parameter define
    localparam  CLK_DIVIDE = 4'd10     ;        // clk divide
    localparam  MAX_NUM    = 13'd5_000  ;       // 1ms on 50MHz
    
    //reg define
    reg    [3:0]             clk_cnt  ;         // clk divide count
    reg                       dri_clk  ;        // 5MHz after clk divide
    
    reg    [12:0]             cnt0     ;        // count driver by dri_clk
    reg                       flag     ;        // cnt0 go MAX_NUM that mean pass 1ms
    
    reg    [7:0]              cnt_sel  ;        // select count
    reg    [3:0]              num_disp ;        // display number
    
    
    // main code
    
    // creat dri_clk controlled by CLK_DIVIDE
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            clk_cnt <= 4'd0;
            dri_clk <= 1'b1;
        end
        else if (clk_cnt == CLK_DIVIDE / 2 - 1) begin
            clk_cnt <= 4'd0;
            dri_clk <= ~dri_clk;
        end
        else begin
            clk_cnt <= clk_cnt + 1'b1;
            dri_clk <= dri_clk;
        end
    end
    
    // when go to 1ms, flag will be go high driver by cnt0
    always @ (posedge dri_clk or negedge rst_n) begin
        if (rst_n == 1'b0) begin
            cnt0 <= 13'b0;
            flag <= 1'b0;
        end
        else if (cnt0 < MAX_NUM - 1'b1) begin
            cnt0 <= cnt0 + 1'b1;
            flag <= 1'b0;
        end
        else begin
            cnt0 <= 13'b0;
            flag <= 1'b1;
        end
    end
    
    // add cnt_sel driver by flag , cnt_sel for show logic , select seg_sel
    always @ (posedge dri_clk or negedge rst_n) begin
        if (rst_n == 1'b0)
            cnt_sel <= 8'b0;
        else if (flag) begin
            if (cnt_sel < 8'd11)
                cnt_sel <= cnt_sel + 1'b1;
            else
                cnt_sel <= 8'b0;
        end
        else
            cnt_sel <= cnt_sel;
    end
    
    // show flow , one number with one number
    always @ (posedge dri_clk or negedge rst_n) begin
        if (!rst_n) begin
            seg_sel     <= 6'b000000;              // not work on low power
            num_disp    <= 4'b0;
            // dot_disp <= 1'b1;
        end
        else begin
            if (en) begin
                case (cnt_sel)
                    8'd0 :begin
                        seg_sel  <= 6'b000001;
                        num_disp <= data[3:0] ;
                    end
                    8'd1 :begin
                        seg_sel  <= 6'b000000;  // release voltage for MOS
                        num_disp <= 4'd10;
                    end
                    8'd2 :begin
                        seg_sel  <= 6'b000010;
                        num_disp <= data[7:4] ;
                    end
                    8'd3 :begin
                        seg_sel  <= 6'b000000;
                        num_disp <= 4'd10;
                    end
                    8'd4 :begin
                        seg_sel  <= 6'b000100;
                        num_disp <= data[11:8];
                    end
                    8'd5 :begin
                        seg_sel  <= 6'b000000;
                        num_disp <= 4'd10;
                    end
                    8'd6 :begin
                        seg_sel  <= 6'b001000;
                        num_disp <= data[15:12];
                    end
                    8'd7 :begin
                        seg_sel  <= 6'b000000;
                        num_disp <= 4'd10;
                    end
                    8'd8 :begin
                        seg_sel  <= (6'b010000);
                        num_disp <= data[19:16];
                    end
                    8'd9 :begin
                        seg_sel  <= 6'b000000;
                        num_disp <= 4'd10;
                    end
                    8'd10 :begin
                        seg_sel  <= 6'b100000;
                        num_disp <= data[23:20];
                    end
                    8'd11 :begin
                        seg_sel  <= 6'b000000;
                        num_disp <= 4'd10;
                    end
                    default :begin
                        seg_sel  <= 6'b000000;
                        num_disp <= 4'b0;
                    end
                endcase
            end
            else begin
                seg_sel  <= 6'b000000;
                num_disp <= 4'b0;
                
            end
        end
    end
    
    // num_disp to seg_led , show segment code
    always @ (posedge dri_clk or negedge rst_n) begin
        if (!rst_n)
            seg_led <= ~(8'hc0);
        else begin
            case (num_disp)
                4'd0 : seg_led  <= ~{(1'b1),(7'b1000000)};   // 0
                4'd1 : seg_led  <= ~{(1'b1),(7'b1111001)};   // 1
                4'd2 : seg_led  <= ~{(1'b1),(7'b0100100)};   // 2
                4'd3 : seg_led  <= ~{(1'b1),(7'b0110000)};   // 3
                4'd4 : seg_led  <= ~{(1'b1),(7'b0011001)};   // 4
                4'd5 : seg_led  <= ~{(1'b1),(7'b0010010)};   // 5
                4'd6 : seg_led  <= ~{(1'b1),(7'b0000010)};   // 6
                4'd7 : seg_led  <= ~{(1'b1),(7'b1111000)};   // 7
                4'd8 : seg_led  <= ~{(1'b1),(7'b0000000)};   // 8
                4'd9 : seg_led  <= ~{(1'b1),(7'b0010000)};   // 9
                4'd10 : seg_led <= ~{(1'b1),(7'b0001000)};  // a
                4'd11 : seg_led <= ~{(1'b1),(7'b0000011)};  // b
                4'd12 : seg_led <= ~{(1'b1),(7'b1000110)};  // c
                4'd13 : seg_led <= ~{(1'b1),(7'b0100001)};  // d
                4'd14 : seg_led <= ~{(1'b1),(7'b0000100)};  // e
                4'd15 : seg_led <= ~{(1'b1),(7'b0001110)};  // f
                
                default:
                seg_led <= ~8'b11111111; // do not show
            endcase
        end
    end
    
    
endmodule //seg_led
