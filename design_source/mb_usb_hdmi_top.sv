////-------------------------------------------------------------------------
////    mb_usb_hdmi_top.sv                                                 --
////    Zuofu Cheng                                                        --
////    2-29-24                                                            --
////                                                                       --
////                                                                       --
////    Spring 2024 Distribution                                           --
////                                                                       --
////    For use with ECE 385 USB + HDMI                                    --
////    University of Illinois ECE Department                              --
////-------------------------------------------------------------------------


//module mb_usb_hdmi_top(
//    input logic Clk,
//    input logic reset_rtl_0,
    
//    //USB signals
//    input logic [0:0] gpio_usb_int_tri_i,
//    output logic gpio_usb_rst_tri_o,
//    input logic usb_spi_miso,
//    output logic usb_spi_mosi,
//    output logic usb_spi_sclk,
//    output logic usb_spi_ss,
    
//    //UART
//    input logic uart_rtl_0_rxd,
//    output logic uart_rtl_0_txd,
    
//    //HDMI
//    output logic hdmi_tmds_clk_n,
//    output logic hdmi_tmds_clk_p,
//    output logic [2:0]hdmi_tmds_data_n,
//    output logic [2:0]hdmi_tmds_data_p,
        
//    //HEX displays
//    output logic [7:0] hex_segA,
//    output logic [3:0] hex_gridA,
//    output logic [7:0] hex_segB,
//    output logic [3:0] hex_gridB
//);
    
//    logic [31:0] keycode0_gpio, keycode1_gpio;
//    logic clk_25MHz, clk_125MHz, clk, clk_100MHz;
//    logic locked;
//    logic [9:0] drawX, drawY, ballxsig, ballysig, ballsizesig;

//    logic hsync, vsync, vde;
//    logic [3:0] red, green, blue;
//    logic reset_ah;
    
//    assign reset_ah = reset_rtl_0;
    
    
//    //Keycode HEX drivers
//    hex_driver HexA (
//        .clk(Clk),
//        .reset(reset_ah),
//        .in({keycode0_gpio[31:28], keycode0_gpio[27:24], keycode0_gpio[23:20], keycode0_gpio[19:16]}),
//        .hex_seg(hex_segA),
//        .hex_grid(hex_gridA)
//    );
    
//    hex_driver HexB (
//        .clk(Clk),
//        .reset(reset_ah),
//        .in({keycode0_gpio[15:12], keycode0_gpio[11:8], keycode0_gpio[7:4], keycode0_gpio[3:0]}),
//        .hex_seg(hex_segB),
//        .hex_grid(hex_gridB)
//    );
    
//    mb_block mb_block_i (
//        .clk_100MHz(Clk),
//        .gpio_usb_int_tri_i(gpio_usb_int_tri_i),
//        .gpio_usb_keycode_0_tri_o(keycode0_gpio),
//        .gpio_usb_keycode_1_tri_o(keycode1_gpio),
//        .gpio_usb_rst_tri_o(gpio_usb_rst_tri_o),
//        .reset_rtl_0(~reset_ah), //Block designs expect active low reset, all other modules are active high
//        .uart_rtl_0_rxd(uart_rtl_0_rxd),
//        .uart_rtl_0_txd(uart_rtl_0_txd),
//        .usb_spi_miso(usb_spi_miso),
//        .usb_spi_mosi(usb_spi_mosi),
//        .usb_spi_sclk(usb_spi_sclk),
//        .usb_spi_ss(usb_spi_ss)
//    );
        
//    //clock wizard configured with a 1x and 5x clock for HDMI
//    clk_wiz_0 clk_wiz (
//        .clk_out1(clk_25MHz),
//        .clk_out2(clk_125MHz),
//        .reset(reset_ah),
//        .locked(locked),
//        .clk_in1(Clk)
//    );
    
//    //VGA Sync signal generator
//    vga_controller vga (
//        .pixel_clk(clk_25MHz),
//        .reset(reset_ah),
//        .hs(hsync),
//        .vs(vsync),
//        .active_nblank(vde),
//        .drawX(drawX),
//        .drawY(drawY)
//    );    

//    //Real Digital VGA to HDMI converter
//    hdmi_tx_0 vga_to_hdmi (
//        //Clocking and Reset
//        .pix_clk(clk_25MHz),
//        .pix_clkx5(clk_125MHz),
//        .pix_clk_locked(locked),
//        //Reset is active LOW
//        .rst(reset_ah),
//        //Color and Sync Signals
//        .red(red),
//        .green(green),
//        .blue(blue),
//        .hsync(hsync),
//        .vsync(vsync),
//        .vde(vde),
        
//        //aux Data (unused)
//        .aux0_din(4'b0),
//        .aux1_din(4'b0),
//        .aux2_din(4'b0),
//        .ade(1'b0),
        
//        //Differential outputs
//        .TMDS_CLK_P(hdmi_tmds_clk_p),          
//        .TMDS_CLK_N(hdmi_tmds_clk_n),          
//        .TMDS_DATA_P(hdmi_tmds_data_p),         
//        .TMDS_DATA_N(hdmi_tmds_data_n)          
//    );
    
    
    
    
    
    
    
    
//    // all intial elements
//    logic [3:0] current_x_position;
//    logic [4:0] current_y_position;
//    logic [3:0] new_x_position;
//    logic [4:0] new_y_position;
//    logic [1:0] rot;
//    logic [7:0] test_blk_1;
//    logic [7:0] test_blk_2;
//    logic [7:0] test_blk_3;
//    logic [7:0] test_blk_4;
//    logic [2:0] test_width;
//    logic [2:0] test_height;
////    logic [2:0] timer;
//    logic [3:0] test_pos_x;
//    logic [4:0] test_pos_y;
//    initial begin
//    current_x_position = 5;
//    current_y_position = 2;
//    rot = 0;
    
//    end
    
//    // game clock for piece dropping
//    logic game_clk;
//    logic game_clk_reset;
//    game_clock_ game_clock_ (
//        .clk(Clk),
//        .rst(game_clk_reset),
//        .game_clk(game_clk)
//    );
    
//    reg [219:0] fallen_pieces;
//    reg [219:0] new_fallen_pieces;
//    initial begin
//    fallen_pieces = '{default:1'b0}; // Initialize all elements to 0
//    new_fallen_pieces = '{default:1'b0}; // Initialize all elements to 0
//    end
    
//    logic collision_detected;
//    logic intersection_bottom;

    
//    //Ball Module // calculates position of piece 
//    ball ball_instance(
//        .Reset(reset_ah),
//        .frame_clk(vsync),                    //Figure out what this should be so that the ball will move
//        .keycode(keycode0_gpio[7:0]),         //Notice: only one keycode connected to ball by default
//        .current_x_pos(current_x_position),
//        .current_y_pos(current_y_position),
//        .fallen_pieces(fallen_pieces),
////        .game_clk(game_clk),
//        .BallX(ballxsig),
//        .BallY(ballysig),
//        .BallS(ballsizesig),
//        .new_x_pos(new_x_position),
//        .new_y_pos(new_y_position),
//        .new_fallen_pieces(new_fallen_pieces),
//        .collision_detected(collision_detected),
//        .intersection_bottom(intersection_bottom),
//        .test_blk_1(test_blk_1),
//        .test_blk_2(test_blk_2),
//        .test_blk_3(test_blk_3),
//        .test_blk_4(test_blk_4),
//        .test_width(test_width),
//        .test_height(test_height)
////        .game_clk_reset(game_clk_reset),
////        .timer(timer) // call this timer2 or test_timer for the second call or will fuck with system 
//    );
//    assign current_x_position = new_x_position;
//    assign current_y_position = new_y_position;
//    assign fallen_pieces = new_fallen_pieces;
    
    
    
//    // calculates current block's 4 pieces
////    calculate_cur_block_pos calculate_cur_block_pos(
////        .piece(3'b000),
////        .pos_x(current_x_position),
////        .pos_y(current_y_position),
////        .rot(rot),
////        .blk_1(test_blk_1),
////        .blk_2(test_blk_2),
////        .blk_3(test_blk_3),
////        .blk_4(test_blk_4),
////        .width(test_width),
////        .height(test_height)
////    );
//    always_ff @(posedge vsync) begin
////        if (collision_detected || intersection_bottom) begin
//        if (intersection_bottom) begin
//            fallen_pieces[test_blk_1] <= 1;
//            fallen_pieces[test_blk_2] <= 1;
//            fallen_pieces[test_blk_3] <= 1;
//            fallen_pieces[test_blk_4] <= 1;
//        end
//    end

////    calc_test_pos_rot calc_test_pos_rot_ (
////        .timer(timer),
////        .cur_pos_x(cur_pos_x),
////        .cur_pos_y(cur_pos_y),
////        .test_pos_x(test_pos_x),
////        .test_pos_y(test_pos_y)
////    );
////    logic [7:0] test_blk_1;
////    logic [7:0] test_blk_2;
////    logic [7:0] test_blk_3;
////    logic [7:0] test_blk_4;
////    logic [2:0] test_width;
////    logic [2:0] test_height;
    
////    calculate_cur_block_pos calculate_cur_block_pos2(
////        .piece(3'b000),
////        .pos_x(test_pos_x),
////        .pos_y(test_pos_y),
////        .rot(rot),
////        .blk_1(test_blk_1),
////        .blk_2(test_blk_2),
////        .blk_3(test_blk_3),
////        .blk_4(test_blk_4),
////        .width(test_width),
////        .height(test_height)
////    );
    
    
    
    
////    function intersects_fallen_pieces;
////        input logic [7:0] blk1;
////        input logic [7:0] blk2;
////        input logic [7:0] blk3;
////        input logic [7:0] blk4;
////        begin
////            intersects_fallen_pieces = fallen_pieces[blk1] ||
////                                       fallen_pieces[blk2] ||
////                                       fallen_pieces[blk3] ||
////                                       fallen_pieces[blk4];
////        end
////    endfunction
    
//    //Color Mapper Module   // display tetris
//    color_mapper color_instance(
//        .BallX(ballxsig),
//        .BallY(ballysig),
//        .DrawX(drawX),
//        .DrawY(drawY),
//        .Ball_size(ballsizesig),
//        .fallen_pieces(fallen_pieces),
//        .clk(Clk),
//        .cur_blk_1(test_blk_1),
//        .cur_blk_2(test_blk_2),
//        .cur_blk_3(test_blk_3),
//        .cur_blk_4(test_blk_4),
//        .Red(red),
//        .Green(green),
//        .Blue(blue)
//    );
    
//    // main game logic
////     always @ (posedge clk) begin
////         if(current_y_position +2 == 22) begin
////            current_y_position = current_y_position;
////         end
////         else begin 
////         current_x_position <= current_x_position;
////         current_y_position <= current_y_position+1;
////         end
////    end
    
//endmodule
//-------------------------------------------------------------------------
//    mb_usb_hdmi_top.sv                                                 --
//    Zuofu Cheng                                                        --
//    2-29-24                                                            --
//                                                                       --
//                                                                       --
//    Spring 2024 Distribution                                           --
//                                                                       --
//    For use with ECE 385 USB + HDMI                                    --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module mb_usb_hdmi_top(
    input logic Clk,
    input logic reset_rtl_0,
    
    //USB signals
    input logic [0:0] gpio_usb_int_tri_i,
    output logic gpio_usb_rst_tri_o,
    input logic usb_spi_miso,
    output logic usb_spi_mosi,
    output logic usb_spi_sclk,
    output logic usb_spi_ss,
    
    //UART
    input logic uart_rtl_0_rxd,
    output logic uart_rtl_0_txd,
    
    //HDMI
    output logic hdmi_tmds_clk_n,
    output logic hdmi_tmds_clk_p,
    output logic [2:0]hdmi_tmds_data_n,
    output logic [2:0]hdmi_tmds_data_p,
        
    //HEX displays
    output logic [7:0] hex_segA,
    output logic [3:0] hex_gridA,
    output logic [7:0] hex_segB,
    output logic [3:0] hex_gridB
);
    
    logic [31:0] keycode0_gpio, keycode1_gpio;
    logic clk_25MHz, clk_125MHz, clk, clk_100MHz;
    logic locked;
    logic [9:0] drawX, drawY, ballxsig, ballysig, ballsizesig;

    logic hsync, vsync, vde;
    logic [3:0] red, green, blue;
    logic reset_ah;
    
    assign reset_ah = reset_rtl_0;
    
    logic [4:0] score_1; // 1's place
    logic [4:0] score_2; // 10's place
    logic [4:0] score_3; // 100's place
    logic [4:0] score_4; // 1000's place
    
    //Keycode HEX drivers
    hex_driver HexA (
        .clk(Clk),
        .reset(reset_ah),
//        .in({keycode0_gpio[31:28], keycode0_gpio[27:24], keycode0_gpio[23:20], keycode0_gpio[19:16]}),
        .in({score_4, score_3, score_2, score_1}),
        .hex_seg(hex_segA),
        .hex_grid(hex_gridA)
    );
    
    hex_driver HexB (
        .clk(Clk),
        .reset(reset_ah),
        .in({keycode0_gpio[15:12], keycode0_gpio[11:8], keycode0_gpio[7:4], keycode0_gpio[3:0]}),
        .hex_seg(hex_segB),
        .hex_grid(hex_gridB)
    );
    
    mb_block mb_block_i (
        .clk_100MHz(Clk),
        .gpio_usb_int_tri_i(gpio_usb_int_tri_i),
        .gpio_usb_keycode_0_tri_o(keycode0_gpio),
        .gpio_usb_keycode_1_tri_o(keycode1_gpio),
        .gpio_usb_rst_tri_o(gpio_usb_rst_tri_o),
        .reset_rtl_0(~reset_ah), //Block designs expect active low reset, all other modules are active high
        .uart_rtl_0_rxd(uart_rtl_0_rxd),
        .uart_rtl_0_txd(uart_rtl_0_txd),
        .usb_spi_miso(usb_spi_miso),
        .usb_spi_mosi(usb_spi_mosi),
        .usb_spi_sclk(usb_spi_sclk),
        .usb_spi_ss(usb_spi_ss)
    );
        
    //clock wizard configured with a 1x and 5x clock for HDMI
    clk_wiz_0 clk_wiz (
        .clk_out1(clk_25MHz),
        .clk_out2(clk_125MHz),
        .reset(reset_ah),
        .locked(locked),
        .clk_in1(Clk)
    );
    
    //VGA Sync signal generator
    vga_controller vga (
        .pixel_clk(clk_25MHz),
        .reset(reset_ah),
        .hs(hsync),
        .vs(vsync),
        .active_nblank(vde),
        .drawX(drawX),
        .drawY(drawY)
    );    

    //Real Digital VGA to HDMI converter
    hdmi_tx_0 vga_to_hdmi (
        //Clocking and Reset
        .pix_clk(clk_25MHz),
        .pix_clkx5(clk_125MHz),
        .pix_clk_locked(locked),
        //Reset is active LOW
        .rst(reset_ah),
        //Color and Sync Signals
        .red(red),
        .green(green),
        .blue(blue),
        .hsync(hsync),
        .vsync(vsync),
        .vde(vde),
        
        //aux Data (unused)
        .aux0_din(4'b0),
        .aux1_din(4'b0),
        .aux2_din(4'b0),
        .ade(1'b0),
        
        //Differential outputs
        .TMDS_CLK_P(hdmi_tmds_clk_p),          
        .TMDS_CLK_N(hdmi_tmds_clk_n),          
        .TMDS_DATA_P(hdmi_tmds_data_p),         
        .TMDS_DATA_N(hdmi_tmds_data_n)          
    );
    
    
    
    
    
    
    
    
    // all intial elements
    logic [3:0] current_x_position;
    logic [4:0] current_y_position;
    logic [3:0] new_x_position;
    logic [4:0] new_y_position;
    logic [1:0] rot;
    logic [1:0] new_rot;
    logic [7:0] test_blk_1;
    logic [7:0] test_blk_2;
    logic [7:0] test_blk_3;
    logic [7:0] test_blk_4;
    logic [2:0] test_width;
    logic [2:0] test_height;
//    logic [2:0] timer;
    logic [3:0] test_pos_x;
    logic [4:0] test_pos_y;
    logic shift_now;
    initial begin
    current_x_position = 5;
    current_y_position = 2;
    rot = 0;
    shift_now = 0;
    score_1 = 0; // 1's place
    score_2 = 0; // 10's place
    score_3 = 0; // 100's place
    score_4 = 0; // 1000's place
    end
    
    // game clock for piece dropping
    logic game_clk;
    logic game_clk_reset;
//    game_clock_ game_clock_ (
//        .clk(Clk),
//        .rst(game_clk_reset),
//        .game_clk(game_clk)
//    );
    
    reg [219:0] fallen_pieces;
    reg [219:0] new_fallen_pieces;
    initial begin
    fallen_pieces = '{default:1'b0}; // Initialize all elements to 0
    new_fallen_pieces = '{default:1'b0}; // Initialize all elements to 0
    end
    
    logic collision_detected;
    logic intersection_bottom;
    
    logic [4:0] remove_row_y;
    logic remove_row_en;
    logic [4:0] shifting_row;
    logic game_over_en;
    logic [2:0] cur_piece;
    
    //Ball Module // calculates position of piece 
    //Ball Module // calculates position of piece 
    ball ball_instance(
        .Reset(reset_ah),
        .frame_clk(vsync),                    //Figure out what this should be so that the ball will move
        .keycode(keycode0_gpio[7:0]),         //Notice: only one keycode connected to ball by default
        .current_x_pos(current_x_position),
        .current_y_pos(current_y_position),
        .fallen_pieces(fallen_pieces),
        .cur_rot(rot),
//        .game_clk(game_clk),
        .BallX(ballxsig),
        .BallY(ballysig),
        .BallS(ballsizesig),
        .new_x_pos(new_x_position),
        .new_y_pos(new_y_position),
        .new_fallen_pieces(new_fallen_pieces),
        .collision_detected(collision_detected),
        .intersection_bottom(intersection_bottom),
        .test_blk_1(test_blk_1),
        .test_blk_2(test_blk_2),
        .test_blk_3(test_blk_3),
        .test_blk_4(test_blk_4),
        .test_width(test_width),
        .test_height(test_height),
        .new_rot(new_rot),
        .remove_row_en(remove_row_en),
        .remove_row_y(remove_row_y),
        .game_over_en(game_over_en),
        .cur_piece(cur_piece)
//        .game_clk_reset(game_clk_reset),
//        .timer(timer) // call this timer2 or test_timer for the second call or will fuck with system 
    );
    assign current_x_position = new_x_position;
    assign current_y_position = new_y_position;
    assign fallen_pieces = new_fallen_pieces;
    assign rot = new_rot;
    
    
    
    
    // calculates current block's 4 pieces
//    calculate_cur_block_pos calculate_cur_block_pos(
//        .piece(3'b000),
//        .pos_x(current_x_position),
//        .pos_y(current_y_position),
//        .rot(rot),
//        .blk_1(test_blk_1),
//        .blk_2(test_blk_2),
//        .blk_3(test_blk_3),
//        .blk_4(test_blk_4),
//        .width(test_width),
//        .height(test_height)
//    );
    always_ff @(posedge vsync) begin
        if (keycode0_gpio[7:0] == 8'h2C) begin
            fallen_pieces <= 220'b0;
        end
//        if (collision_detected || intersection_bottom) begin
        if (intersection_bottom) begin
            fallen_pieces[test_blk_1] <= 1;
            fallen_pieces[test_blk_2] <= 1;
            fallen_pieces[test_blk_3] <= 1;
            fallen_pieces[test_blk_4] <= 1;
        end
        if(remove_row_en) begin
            if (score_1 == 9) begin
                if (score_2 == 9) begin
                    if (score_3 == 9) begin
                        if (score_4 != 9) begin
                            score_4 <= score_4 + 1;
                            score_3 <= 0;
                            score_2 <= 0;
                            score_1 <= 0;
                        end
                    end else begin
                        score_3 <= score_3 + 1;
                        score_2 <= 0;
                        score_1 <= 0;
                    end
                end else begin
                    score_2 <= score_2 + 1;
                    score_1 <= 0;
                end
            end else begin
                score_1 <= score_1 + 1;
            end
            fallen_pieces[(remove_row_y*10)+0] <= 0;
            fallen_pieces[(remove_row_y*10)+1] <= 0;
            fallen_pieces[(remove_row_y*10)+2] <= 0;
            fallen_pieces[(remove_row_y*10)+3] <= 0;
            fallen_pieces[(remove_row_y*10)+4] <= 0;
            fallen_pieces[(remove_row_y*10)+5] <= 0;
            fallen_pieces[(remove_row_y*10)+6] <= 0;
            fallen_pieces[(remove_row_y*10)+7] <= 0;
            fallen_pieces[(remove_row_y*10)+8] <= 0;
            fallen_pieces[(remove_row_y*10)+9] <= 0;
            shifting_row <= remove_row_y;
//            fallen_pieces[(shifting_row*10)+6] <= 1; // dont forget to comment this out
            shift_now<=1;
                       
            
            
//            fallen_pieces[205 +: 10] <= 0;
//            if (remove_row_y <= 21) begin
//                if (remove_row_y > 0) begin
//                    new_fallen_pieces[10 +: 10] <= fallen_pieces[0 +: 10];
//                end
//                if (remove_row_y > 1) begin
//                    new_fallen_pieces[20 +: 10] <= fallen_pieces[10 +: 10];
//                end
//                if (remove_row_y > 2) begin
//                    new_fallen_pieces[30 +: 10] <= fallen_pieces[20 +: 10];
//                end
//                if (remove_row_y > 3) begin
//                    new_fallen_pieces[40 +: 10] <= fallen_pieces[30 +: 10];
//                end
//                if (remove_row_y > 4) begin
//                    new_fallen_pieces[50 +: 10] <= fallen_pieces[40 +: 10];
//                end
//                if (remove_row_y > 5) begin
//                    new_fallen_pieces[60 +: 10] <= fallen_pieces[50 +: 10];
//                end
//                if (remove_row_y > 6) begin
//                    new_fallen_pieces[70 +: 10] <= fallen_pieces[60 +: 10];
//                end
//                if (remove_row_y > 7) begin
//                    new_fallen_pieces[80 +: 10] <= fallen_pieces[70 +: 10];
//                end
//                if (remove_row_y > 8) begin
//                    new_fallen_pieces[90 +: 10] <= fallen_pieces[80 +: 10];
//                end
//                if (remove_row_y > 9) begin
//                    new_fallen_pieces[100 +: 10] <= fallen_pieces[90 +: 10];
//                end
//                if (remove_row_y > 10) begin
//                    new_fallen_pieces[110 +: 10] <= fallen_pieces[100 +: 10];
//                end
//                if (remove_row_y > 11) begin
//                    new_fallen_pieces[120 +: 10] <= fallen_pieces[110 +: 10];
//                end
//                if (remove_row_y > 12) begin
//                    new_fallen_pieces[130 +: 10] <= fallen_pieces[120 +: 10];
//                end
//                if (remove_row_y > 13) begin
//                    new_fallen_pieces[140 +: 10] <= fallen_pieces[130 +: 10];
//                end
//                if (remove_row_y > 14) begin
//                    new_fallen_pieces[150 +: 10] <= fallen_pieces[140 +: 10];
//                end
//                if (remove_row_y > 15) begin
//                    new_fallen_pieces[160 +: 10] <= fallen_pieces[150 +: 10];
//                end
//                if (remove_row_y > 16) begin
//                    new_fallen_pieces[170 +: 10] <= fallen_pieces[160 +: 10];
//                end
//                if (remove_row_y > 17) begin
//                    new_fallen_pieces[180 +: 10] <= fallen_pieces[170 +: 10];
//                end
//                if (remove_row_y > 18) begin
//                    new_fallen_pieces[190 +: 10] <= fallen_pieces[180 +: 10];
//                end
//                if (remove_row_y > 19) begin
//                    new_fallen_pieces[200 +: 10] <= fallen_pieces[190 +: 10];
//                end
//                if (remove_row_y > 20) begin
//                    new_fallen_pieces[210 +: 10] <= fallen_pieces[200 +: 10];
//                end
//                // Clear the top-most row
//                new_fallen_pieces[0 +: 10] <= 0;
//            end

        end
        
        if(shift_now) begin
        
//        fallen_pieces[(shifting_row*4)+0] <= 1;
//        fallen_pieces[(shifting_row*4)+1] <= 1;
//        fallen_pieces[(shifting_row*4)+2] <= 1;
//        fallen_pieces[(shifting_row*4)+3] <= 1;
        if (shifting_row >= 21) begin
            fallen_pieces[21*10 + 0] <= fallen_pieces[20*10 + 0];
            fallen_pieces[21*10 + 1] <= fallen_pieces[20*10 + 1];
            fallen_pieces[21*10 + 2] <= fallen_pieces[20*10 + 2];
            fallen_pieces[21*10 + 3] <= fallen_pieces[20*10 + 3];
            fallen_pieces[21*10 + 4] <= fallen_pieces[20*10 + 4];
            fallen_pieces[21*10 + 5] <= fallen_pieces[20*10 + 5];
            fallen_pieces[21*10 + 6] <= fallen_pieces[20*10 + 6];
            fallen_pieces[21*10 + 7] <= fallen_pieces[20*10 + 7];
            fallen_pieces[21*10 + 8] <= fallen_pieces[20*10 + 8];
            fallen_pieces[21*10 + 9] <= fallen_pieces[20*10 + 9];
        end
        if (shifting_row >= 20) begin
            fallen_pieces[20*10 + 0] <= fallen_pieces[19*10 + 0];
            fallen_pieces[20*10 + 1] <= fallen_pieces[19*10 + 1];
            fallen_pieces[20*10 + 2] <= fallen_pieces[19*10 + 2];
            fallen_pieces[20*10 + 3] <= fallen_pieces[19*10 + 3];
            fallen_pieces[20*10 + 4] <= fallen_pieces[19*10 + 4];
            fallen_pieces[20*10 + 5] <= fallen_pieces[19*10 + 5];
            fallen_pieces[20*10 + 6] <= fallen_pieces[19*10 + 6];
            fallen_pieces[20*10 + 7] <= fallen_pieces[19*10 + 7];
            fallen_pieces[20*10 + 8] <= fallen_pieces[19*10 + 8];
            fallen_pieces[20*10 + 9] <= fallen_pieces[19*10 + 9];
        end
        if (shifting_row >= 19) begin
            fallen_pieces[19*10 + 0] <= fallen_pieces[18*10 + 0];
            fallen_pieces[19*10 + 1] <= fallen_pieces[18*10 + 1];
            fallen_pieces[19*10 + 2] <= fallen_pieces[18*10 + 2];
            fallen_pieces[19*10 + 3] <= fallen_pieces[18*10 + 3];
            fallen_pieces[19*10 + 4] <= fallen_pieces[18*10 + 4];
            fallen_pieces[19*10 + 5] <= fallen_pieces[18*10 + 5];
            fallen_pieces[19*10 + 6] <= fallen_pieces[18*10 + 6];
            fallen_pieces[19*10 + 7] <= fallen_pieces[18*10 + 7];
            fallen_pieces[19*10 + 8] <= fallen_pieces[18*10 + 8];
            fallen_pieces[19*10 + 9] <= fallen_pieces[18*10 + 9];
        end
        if (shifting_row >= 18) begin
            fallen_pieces[18*10 + 0] <= fallen_pieces[17*10 + 0];
            fallen_pieces[18*10 + 1] <= fallen_pieces[17*10 + 1];
            fallen_pieces[18*10 + 2] <= fallen_pieces[17*10 + 2];
            fallen_pieces[18*10 + 3] <= fallen_pieces[17*10 + 3];
            fallen_pieces[18*10 + 4] <= fallen_pieces[17*10 + 4];
            fallen_pieces[18*10 + 5] <= fallen_pieces[17*10 + 5];
            fallen_pieces[18*10 + 6] <= fallen_pieces[17*10 + 6];
            fallen_pieces[18*10 + 7] <= fallen_pieces[17*10 + 7];
            fallen_pieces[18*10 + 8] <= fallen_pieces[17*10 + 8];
            fallen_pieces[18*10 + 9] <= fallen_pieces[17*10 + 9];
        end
        if (shifting_row >= 17) begin
            fallen_pieces[17*10 + 0] <= fallen_pieces[16*10 + 0];
            fallen_pieces[17*10 + 1] <= fallen_pieces[16*10 + 1];
            fallen_pieces[17*10 + 2] <= fallen_pieces[16*10 + 2];
            fallen_pieces[17*10 + 3] <= fallen_pieces[16*10 + 3];
            fallen_pieces[17*10 + 4] <= fallen_pieces[16*10 + 4];
            fallen_pieces[17*10 + 5] <= fallen_pieces[16*10 + 5];
            fallen_pieces[17*10 + 6] <= fallen_pieces[16*10 + 6];
            fallen_pieces[17*10 + 7] <= fallen_pieces[16*10 + 7];
            fallen_pieces[17*10 + 8] <= fallen_pieces[16*10 + 8];
            fallen_pieces[17*10 + 9] <= fallen_pieces[16*10 + 9];
        end
        if (shifting_row >= 16) begin
            fallen_pieces[16*10 + 0] <= fallen_pieces[15*10 + 0];
            fallen_pieces[16*10 + 1] <= fallen_pieces[15*10 + 1];
            fallen_pieces[16*10 + 2] <= fallen_pieces[15*10 + 2];
            fallen_pieces[16*10 + 3] <= fallen_pieces[15*10 + 3];
            fallen_pieces[16*10 + 4] <= fallen_pieces[15*10 + 4];
            fallen_pieces[16*10 + 5] <= fallen_pieces[15*10 + 5];
            fallen_pieces[16*10 + 6] <= fallen_pieces[15*10 + 6];
            fallen_pieces[16*10 + 7] <= fallen_pieces[15*10 + 7];
            fallen_pieces[16*10 + 8] <= fallen_pieces[15*10 + 8];
            fallen_pieces[16*10 + 9] <= fallen_pieces[15*10 + 9];
        end
        if (shifting_row >= 15) begin
            fallen_pieces[15*10 + 0] <= fallen_pieces[14*10 + 0];
            fallen_pieces[15*10 + 1] <= fallen_pieces[14*10 + 1];
            fallen_pieces[15*10 + 2] <= fallen_pieces[14*10 + 2];
            fallen_pieces[15*10 + 3] <= fallen_pieces[14*10 + 3];
            fallen_pieces[15*10 + 4] <= fallen_pieces[14*10 + 4];
            fallen_pieces[15*10 + 5] <= fallen_pieces[14*10 + 5];
            fallen_pieces[15*10 + 6] <= fallen_pieces[14*10 + 6];
            fallen_pieces[15*10 + 7] <= fallen_pieces[14*10 + 7];
            fallen_pieces[15*10 + 8] <= fallen_pieces[14*10 + 8];
            fallen_pieces[15*10 + 9] <= fallen_pieces[14*10 + 9];
        end
        if (shifting_row >= 14) begin
            fallen_pieces[14*10 + 0] <= fallen_pieces[13*10 + 0];
            fallen_pieces[14*10 + 1] <= fallen_pieces[13*10 + 1];
            fallen_pieces[14*10 + 2] <= fallen_pieces[13*10 + 2];
            fallen_pieces[14*10 + 3] <= fallen_pieces[13*10 + 3];
            fallen_pieces[14*10 + 4] <= fallen_pieces[13*10 + 4];
            fallen_pieces[14*10 + 5] <= fallen_pieces[13*10 + 5];
            fallen_pieces[14*10 + 6] <= fallen_pieces[13*10 + 6];
            fallen_pieces[14*10 + 7] <= fallen_pieces[13*10 + 7];
            fallen_pieces[14*10 + 8] <= fallen_pieces[13*10 + 8];
            fallen_pieces[14*10 + 9] <= fallen_pieces[13*10 + 9];
        end
        if (shifting_row >= 13) begin
            fallen_pieces[13*10 + 0] <= fallen_pieces[12*10 + 0];
            fallen_pieces[13*10 + 1] <= fallen_pieces[12*10 + 1];
            fallen_pieces[13*10 + 2] <= fallen_pieces[12*10 + 2];
            fallen_pieces[13*10 + 3] <= fallen_pieces[12*10 + 3];
            fallen_pieces[13*10 + 4] <= fallen_pieces[12*10 + 4];
            fallen_pieces[13*10 + 5] <= fallen_pieces[12*10 + 5];
            fallen_pieces[13*10 + 6] <= fallen_pieces[12*10 + 6];
            fallen_pieces[13*10 + 7] <= fallen_pieces[12*10 + 7];
            fallen_pieces[13*10 + 8] <= fallen_pieces[12*10 + 8];
            fallen_pieces[13*10 + 9] <= fallen_pieces[12*10 + 9];
        end
        if (shifting_row >= 12) begin
            fallen_pieces[12*10 + 0] <= fallen_pieces[11*10 + 0];
            fallen_pieces[12*10 + 1] <= fallen_pieces[11*10 + 1];
            fallen_pieces[12*10 + 2] <= fallen_pieces[11*10 + 2];
            fallen_pieces[12*10 + 3] <= fallen_pieces[11*10 + 3];
            fallen_pieces[12*10 + 4] <= fallen_pieces[11*10 + 4];
            fallen_pieces[12*10 + 5] <= fallen_pieces[11*10 + 5];
            fallen_pieces[12*10 + 6] <= fallen_pieces[11*10 + 6];
            fallen_pieces[12*10 + 7] <= fallen_pieces[11*10 + 7];
            fallen_pieces[12*10 + 8] <= fallen_pieces[11*10 + 8];
            fallen_pieces[12*10 + 9] <= fallen_pieces[11*10 + 9];
        end
        if (shifting_row >= 11) begin
            fallen_pieces[11*10 + 0] <= fallen_pieces[10*10 + 0];
            fallen_pieces[11*10 + 1] <= fallen_pieces[10*10 + 1];
            fallen_pieces[11*10 + 2] <= fallen_pieces[10*10 + 2];
            fallen_pieces[11*10 + 3] <= fallen_pieces[10*10 + 3];
            fallen_pieces[11*10 + 4] <= fallen_pieces[10*10 + 4];
            fallen_pieces[11*10 + 5] <= fallen_pieces[10*10 + 5];
            fallen_pieces[11*10 + 6] <= fallen_pieces[10*10 + 6];
            fallen_pieces[11*10 + 7] <= fallen_pieces[10*10 + 7];
            fallen_pieces[11*10 + 8] <= fallen_pieces[10*10 + 8];
            fallen_pieces[11*10 + 9] <= fallen_pieces[10*10 + 9];
        end
        if (shifting_row >= 10) begin
            fallen_pieces[10*10 + 0] <= fallen_pieces[9*10 + 0];
            fallen_pieces[10*10 + 1] <= fallen_pieces[9*10 + 1];
            fallen_pieces[10*10 + 2] <= fallen_pieces[9*10 + 2];
            fallen_pieces[10*10 + 3] <= fallen_pieces[9*10 + 3];
            fallen_pieces[10*10 + 4] <= fallen_pieces[9*10 + 4];
            fallen_pieces[10*10 + 5] <= fallen_pieces[9*10 + 5];
            fallen_pieces[10*10 + 6] <= fallen_pieces[9*10 + 6];
            fallen_pieces[10*10 + 7] <= fallen_pieces[9*10 + 7];
            fallen_pieces[10*10 + 8] <= fallen_pieces[9*10 + 8];
            fallen_pieces[10*10 + 9] <= fallen_pieces[9*10 + 9];
        end
        if (shifting_row >= 9) begin
            fallen_pieces[9*10 + 0] <= fallen_pieces[8*10 + 0];
            fallen_pieces[9*10 + 1] <= fallen_pieces[8*10 + 1];
            fallen_pieces[9*10 + 2] <= fallen_pieces[8*10 + 2];
            fallen_pieces[9*10 + 3] <= fallen_pieces[8*10 + 3];
            fallen_pieces[9*10 + 4] <= fallen_pieces[8*10 + 4];
            fallen_pieces[9*10 + 5] <= fallen_pieces[8*10 + 5];
            fallen_pieces[9*10 + 6] <= fallen_pieces[8*10 + 6];
            fallen_pieces[9*10 + 7] <= fallen_pieces[8*10 + 7];
            fallen_pieces[9*10 + 8] <= fallen_pieces[8*10 + 8];
            fallen_pieces[9*10 + 9] <= fallen_pieces[8*10 + 9];
        end
        if (shifting_row >= 8) begin
            fallen_pieces[8*10 + 0] <= fallen_pieces[7*10 + 0];
            fallen_pieces[8*10 + 1] <= fallen_pieces[7*10 + 1];
            fallen_pieces[8*10 + 2] <= fallen_pieces[7*10 + 2];
            fallen_pieces[8*10 + 3] <= fallen_pieces[7*10 + 3];
            fallen_pieces[8*10 + 4] <= fallen_pieces[7*10 + 4];
            fallen_pieces[8*10 + 5] <= fallen_pieces[7*10 + 5];
            fallen_pieces[8*10 + 6] <= fallen_pieces[7*10 + 6];
            fallen_pieces[8*10 + 7] <= fallen_pieces[7*10 + 7];
            fallen_pieces[8*10 + 8] <= fallen_pieces[7*10 + 8];
            fallen_pieces[8*10 + 9] <= fallen_pieces[7*10 + 9];
        end
        if (shifting_row >= 7) begin
            fallen_pieces[7*10 + 0] <= fallen_pieces[6*10 + 0];
            fallen_pieces[7*10 + 1] <= fallen_pieces[6*10 + 1];
            fallen_pieces[7*10 + 2] <= fallen_pieces[6*10 + 2];
            fallen_pieces[7*10 + 3] <= fallen_pieces[6*10 + 3];
            fallen_pieces[7*10 + 4] <= fallen_pieces[6*10 + 4];
            fallen_pieces[7*10 + 5] <= fallen_pieces[6*10 + 5];
            fallen_pieces[7*10 + 6] <= fallen_pieces[6*10 + 6];
            fallen_pieces[7*10 + 7] <= fallen_pieces[6*10 + 7];
            fallen_pieces[7*10 + 8] <= fallen_pieces[6*10 + 8];
            fallen_pieces[7*10 + 9] <= fallen_pieces[6*10 + 9];
        end
        if (shifting_row >= 6) begin
            fallen_pieces[6*10 + 0] <= fallen_pieces[5*10 + 0];
            fallen_pieces[6*10 + 1] <= fallen_pieces[5*10 + 1];
            fallen_pieces[6*10 + 2] <= fallen_pieces[5*10 + 2];
            fallen_pieces[6*10 + 3] <= fallen_pieces[5*10 + 3];
            fallen_pieces[6*10 + 4] <= fallen_pieces[5*10 + 4];
            fallen_pieces[6*10 + 5] <= fallen_pieces[5*10 + 5];
            fallen_pieces[6*10 + 6] <= fallen_pieces[5*10 + 6];
            fallen_pieces[6*10 + 7] <= fallen_pieces[5*10 + 7];
            fallen_pieces[6*10 + 8] <= fallen_pieces[5*10 + 8];
            fallen_pieces[6*10 + 9] <= fallen_pieces[5*10 + 9];
        end
        if (shifting_row >= 5) begin
            fallen_pieces[5*10 + 0] <= fallen_pieces[4*10 + 0];
            fallen_pieces[5*10 + 1] <= fallen_pieces[4*10 + 1];
            fallen_pieces[5*10 + 2] <= fallen_pieces[4*10 + 2];
            fallen_pieces[5*10 + 3] <= fallen_pieces[4*10 + 3];
            fallen_pieces[5*10 + 4] <= fallen_pieces[4*10 + 4];
            fallen_pieces[5*10 + 5] <= fallen_pieces[4*10 + 5];
            fallen_pieces[5*10 + 6] <= fallen_pieces[4*10 + 6];
            fallen_pieces[5*10 + 7] <= fallen_pieces[4*10 + 7];
            fallen_pieces[5*10 + 8] <= fallen_pieces[4*10 + 8];
            fallen_pieces[5*10 + 9] <= fallen_pieces[4*10 + 9];
        end
        if (shifting_row >= 4) begin
            fallen_pieces[4*10 + 0] <= fallen_pieces[3*10 + 0];
            fallen_pieces[4*10 + 1] <= fallen_pieces[3*10 + 1];
            fallen_pieces[4*10 + 2] <= fallen_pieces[3*10 + 2];
            fallen_pieces[4*10 + 3] <= fallen_pieces[3*10 + 3];
            fallen_pieces[4*10 + 4] <= fallen_pieces[3*10 + 4];
            fallen_pieces[4*10 + 5] <= fallen_pieces[3*10 + 5];
            fallen_pieces[4*10 + 6] <= fallen_pieces[3*10 + 6];
            fallen_pieces[4*10 + 7] <= fallen_pieces[3*10 + 7];
            fallen_pieces[4*10 + 8] <= fallen_pieces[3*10 + 8];
            fallen_pieces[4*10 + 9] <= fallen_pieces[3*10 + 9];
        end
        if (shifting_row >= 3) begin
            fallen_pieces[3*10 + 0] <= fallen_pieces[2*10 + 0];
            fallen_pieces[3*10 + 1] <= fallen_pieces[2*10 + 1];
            fallen_pieces[3*10 + 2] <= fallen_pieces[2*10 + 2];
            fallen_pieces[3*10 + 3] <= fallen_pieces[2*10 + 3];
            fallen_pieces[3*10 + 4] <= fallen_pieces[2*10 + 4];
            fallen_pieces[3*10 + 5] <= fallen_pieces[2*10 + 5];
            fallen_pieces[3*10 + 6] <= fallen_pieces[2*10 + 6];
            fallen_pieces[3*10 + 7] <= fallen_pieces[2*10 + 7];
            fallen_pieces[3*10 + 8] <= fallen_pieces[2*10 + 8];
            fallen_pieces[3*10 + 9] <= fallen_pieces[2*10 + 9];
        end
        if (shifting_row >= 2) begin
            fallen_pieces[2*10 + 0] <= fallen_pieces[1*10 + 0];
            fallen_pieces[2*10 + 1] <= fallen_pieces[1*10 + 1];
            fallen_pieces[2*10 + 2] <= fallen_pieces[1*10 + 2];
            fallen_pieces[2*10 + 3] <= fallen_pieces[1*10 + 3];
            fallen_pieces[2*10 + 4] <= fallen_pieces[1*10 + 4];
            fallen_pieces[2*10 + 5] <= fallen_pieces[1*10 + 5];
            fallen_pieces[2*10 + 6] <= fallen_pieces[1*10 + 6];
            fallen_pieces[2*10 + 7] <= fallen_pieces[1*10 + 7];
            fallen_pieces[2*10 + 8] <= fallen_pieces[1*10 + 8];
            fallen_pieces[2*10 + 9] <= fallen_pieces[1*10 + 9];
        end
        if (shifting_row >= 1) begin
            fallen_pieces[1*10 + 0] <= fallen_pieces[0*10 + 0];
            fallen_pieces[1*10 + 1] <= fallen_pieces[0*10 + 1];
            fallen_pieces[1*10 + 2] <= fallen_pieces[0*10 + 2];
            fallen_pieces[1*10 + 3] <= fallen_pieces[0*10 + 3];
            fallen_pieces[1*10 + 4] <= fallen_pieces[0*10 + 4];
            fallen_pieces[1*10 + 5] <= fallen_pieces[0*10 + 5];
            fallen_pieces[1*10 + 6] <= fallen_pieces[0*10 + 6];
            fallen_pieces[1*10 + 7] <= fallen_pieces[0*10 + 7];
            fallen_pieces[1*10 + 8] <= fallen_pieces[0*10 + 8];
            fallen_pieces[1*10 + 9] <= fallen_pieces[0*10 + 9];
        end
        fallen_pieces[0*10 + 0] <= 0;
        fallen_pieces[0*10 + 1] <= 0;
        fallen_pieces[0*10 + 2] <= 0;
        fallen_pieces[0*10 + 3] <= 0;
        fallen_pieces[0*10 + 4] <= 0;
        fallen_pieces[0*10 + 5] <= 0;
        fallen_pieces[0*10 + 6] <= 0;
        fallen_pieces[0*10 + 7] <= 0;
        fallen_pieces[0*10 + 8] <= 0;
        fallen_pieces[0*10 + 9] <= 0;
//            if (shifting_row == 0) begin
//                fallen_pieces[0 +: 10] <= 0;
////                mode <= `MODE_PLAY;
//            end else begin
//                fallen_pieces[shifting_row*10 +: 10] <= fallen_pieces[(shifting_row - 1)*10 +: 10];
//                shifting_row <= shifting_row - 1;
//            end
        shift_now <= 0;
        end
    end

//    calc_test_pos_rot calc_test_pos_rot_ (
//        .timer(timer),
//        .cur_pos_x(cur_pos_x),
//        .cur_pos_y(cur_pos_y),
//        .test_pos_x(test_pos_x),
//        .test_pos_y(test_pos_y)
//    );
//    logic [7:0] test_blk_1;
//    logic [7:0] test_blk_2;
//    logic [7:0] test_blk_3;
//    logic [7:0] test_blk_4;
//    logic [2:0] test_width;
//    logic [2:0] test_height;
    
//    calculate_cur_block_pos calculate_cur_block_pos2(
//        .piece(3'b000),
//        .pos_x(test_pos_x),
//        .pos_y(test_pos_y),
//        .rot(rot),
//        .blk_1(test_blk_1),
//        .blk_2(test_blk_2),
//        .blk_3(test_blk_3),
//        .blk_4(test_blk_4),
//        .width(test_width),
//        .height(test_height)
//    );
    
    
    
    
//    function intersects_fallen_pieces;
//        input logic [7:0] blk1;
//        input logic [7:0] blk2;
//        input logic [7:0] blk3;
//        input logic [7:0] blk4;
//        begin
//            intersects_fallen_pieces = fallen_pieces[blk1] ||
//                                       fallen_pieces[blk2] ||
//                                       fallen_pieces[blk3] ||
//                                       fallen_pieces[blk4];
//        end
//    endfunction
    
    //Color Mapper Module   // display tetris
    color_mapper color_instance(
        .BallX(ballxsig),
        .BallY(ballysig),
        .DrawX(drawX),
        .DrawY(drawY),
        .Ball_size(ballsizesig),
        .fallen_pieces(fallen_pieces),
        .clk(Clk),
        .cur_blk_1(test_blk_1),
        .cur_blk_2(test_blk_2),
        .cur_blk_3(test_blk_3),
        .cur_blk_4(test_blk_4),
        .cur_piece(cur_piece),
        .Red(red),
        .Green(green),
        .Blue(blue),
        .outputState(outputState)
    );
    
    logic [2:0] outputState;
    fsm begin_and_end_screen (
        .keycode(keycode0_gpio[7:0]),
        .gameOver(game_over_en),
        .Clk(Clk),
        .Reset(reset_ah),
        .outputState(outputState)
    );
    
        // Instance of next_piece_generator
//    logic [2:0] next_piece_type;
//    next_piece_generator piece_gen (
//        .clk(Clk),
//        .reset(reset_ah),
//        .next_piece(next_piece_type)
//    );
    
    
    // main game logic
//     always @ (posedge clk) begin
//         if(current_y_position +2 == 22) begin
//            current_y_position = current_y_position;
//         end
//         else begin 
//         current_x_position <= current_x_position;
//         current_y_position <= current_y_position+1;
//         end
//    end
    
endmodule
