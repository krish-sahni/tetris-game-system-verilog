//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 04/17/2024 02:17:59 AM
//// Design Name: 
//// Module Name: calc_test_pos_rot
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////


//module calc_test_pos_rot(
////    input  logic        Reset, 
//    input  logic        frame_clk,
//    input logic [7:0]   keycode,
//    input logic [2:0]   timer,
//    input logic [3:0]   cur_pos_x,
//    input logic [4:0]   cur_pos_y,
//    input logic [219:0] fallen_pieces,
//    input logic [7:0]   last_keycode,
//    input logic         key_action_taken,
//    input logic [2:0] cur_piece,
//    input logic [2:0] width,
//    input logic [2:0] height,
//    output logic [3:0]  test_pos_x,
//    output logic [4:0]  test_pos_y,
//    output logic test_intersects
//    );
//    logic [7:0] test_blk_1;
//    logic [7:0] test_blk_2;
//    logic [7:0] test_blk_3;
//    logic [7:0] test_blk_4;
//    logic [2:0] test_width;
//    logic [2:0] test_height;
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
    
//always_ff @(posedge frame_clk) begin

//        // Handle left and right key inputs
//        if (keycode != last_keycode || key_action_taken) begin  // Check for change in keycode or action taken
//            test_pos_x <= cur_pos_x;
//            test_pos_y <= cur_pos_y;
//            case (keycode)
//                8'h50:  // Left Arrow Key
//                    if (cur_pos_x > 0) begin
//                        test_pos_x <= cur_pos_x - 1;
//                    end
//                8'h4F:  // Right Arrow Key
//                    if ((cur_pos_x +test_width)< 8) begin
//                        test_pos_x <= cur_pos_x + 1;
//                    end
//            endcase
////            key_action_taken <= 1;
//        end
        
//        if(timer !=7)
//            test_pos_y <= cur_pos_y;
//        else begin
//            // Move block down when timer reaches 3
//            if ((cur_pos_y +test_height)< 20) begin
//                test_pos_y <= cur_pos_y + 1; // Move down
//            end else begin
//                test_pos_y <= 0;          // Reset to top if it reaches bounds
//            end
//        end
        
//end


    
//calculate_cur_block_pos calculate_cur_block_pos(
//        .piece(3'b000),
//        .pos_x(test_pos_x),
//        .pos_y(test_pos_y),
//        .rot(2'b0),
//        .blk_1(test_blk_1),
//        .blk_2(test_blk_2),
//        .blk_3(test_blk_3),
//        .blk_4(test_blk_4),
//        .width(test_width),
//        .height(test_height)
//    );
    
//    assign test_intersects = intersects_fallen_pieces(test_blk_1, test_blk_2, test_blk_3, test_blk_4);

////    logic test_intersects = intersects_fallen_pieces(test_blk_1, test_blk_2, test_blk_3, test_blk_4);
    
//endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2024 02:17:59 AM
// Design Name: 
// Module Name: calc_test_pos_rot
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module calc_test_pos_rot(
//    input  logic        Reset, 
    input  logic        frame_clk,
    input logic [7:0]   keycode,
    input logic [2:0]   timer,
    input logic [3:0]   cur_pos_x,
    input logic [4:0]   cur_pos_y,
    input logic [219:0] fallen_pieces,
    input logic [7:0]   last_keycode,
    input logic         key_action_taken,
    input logic [2:0] cur_piece,
    input logic [1:0] cur_rot,
    input logic [2:0] width_check,
    input logic [2:0] height_check,
    input logic drop_mode,
    output logic [3:0]  test_pos_x,
    output logic [4:0]  test_pos_y,
    output logic [1:0] test_rot,
    output logic test_intersects,
    output logic [2:0] test_width,
    output logic [2:0] test_height,
    output logic test_drop_mode
    );
    
    function intersects_fallen_pieces;
        input logic [7:0] blk1;
        input logic [7:0] blk2;
        input logic [7:0] blk3;
        input logic [7:0] blk4;
        begin
            intersects_fallen_pieces = fallen_pieces[blk1] ||
                                       fallen_pieces[blk2] ||
                                       fallen_pieces[blk3] ||
                                       fallen_pieces[blk4];
        end
    endfunction
    
always_ff @(posedge frame_clk) begin
        if(keycode == 8'h51) begin // maybe need to put this with the other, please check before demo
            test_drop_mode <= 1;
        end
        else begin
            test_drop_mode <= drop_mode;
        end
        // Handle left and right key inputs
        if (keycode != last_keycode || key_action_taken) begin  // Check for change in keycode or action taken
            test_pos_x <= cur_pos_x;
            test_pos_y <= cur_pos_y;
            test_rot <= cur_rot;
//            test_drop_mode <= drop_mode;
            case (keycode)
                8'h50:  // Left Arrow Key
                    if (cur_pos_x > 0) begin
                        test_pos_x <= cur_pos_x - 1;
                    end
                8'h4F:  // Right Arrow Key
                    if (cur_pos_x + width_check < 10) begin
                        test_pos_x <= cur_pos_x + 1;
                    end
                8'h52:
                    test_rot <= cur_rot + 1;
//                8'h51:
//                    test_drop_mode<=1;
            endcase
//            key_action_taken <= 1;
        end
        
        if(timer != 7 && !test_drop_mode)
            test_pos_y <= cur_pos_y;
        else begin
            // Move block down when timer reaches 3
            if (cur_pos_y + height_check < 22) begin
                test_pos_y <= cur_pos_y + 1; // Move down
            end else begin
                test_pos_y <= 0;          // Reset to top if it reaches bounds
            end
        end
        
end


    logic [7:0] test_blk_1;
    logic [7:0] test_blk_2;
    logic [7:0] test_blk_3;
    logic [7:0] test_blk_4;
//    logic [2:0] test_width;
//    logic [2:0] test_height;
calculate_cur_block_pos calculate_cur_block_pos(
        .piece(cur_piece),
        .pos_x(test_pos_x),
        .pos_y(test_pos_y),
        .rot(test_rot),
        .blk_1(test_blk_1),
        .blk_2(test_blk_2),
        .blk_3(test_blk_3),
        .blk_4(test_blk_4),
        .width(test_width),
        .height(test_height)
    );
    
    assign test_intersects = intersects_fallen_pieces(test_blk_1, test_blk_2, test_blk_3, test_blk_4);

//    logic test_intersects = intersects_fallen_pieces(test_blk_1, test_blk_2, test_blk_3, test_blk_4);
    
endmodule

