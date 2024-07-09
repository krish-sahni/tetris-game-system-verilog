//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 04/25/2024 01:07:43 AM
//// Design Name: 
//// Module Name: calculate_cur_block_pos
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


//module calculate_cur_block_pos(
//    input logic [2:0] piece,
//    input logic [3:0] pos_x,
//    input logic [4:0] pos_y,
//    input logic [1:0] rot,
//    output logic [7:0] blk_1,
//    output logic [7:0] blk_2,
//    output logic [7:0] blk_3,
//    output logic [7:0] blk_4,
//    output logic [2:0] width,
//    output logic [2:0] height

//    );
    
//    always @ (*) begin //square piece
//        case(piece)
//            0: begin 
//                blk_1 = (pos_y * 10) + pos_x;
//                blk_2 = (pos_y * 10) + pos_x + 1;
//                blk_3 = ((pos_y + 1) * 10) + pos_x;
//                blk_4 = ((pos_y + 1) * 10) + pos_x + 1;
//                width = 2;
//                height = 2;
//            end
//          // I piece, horizontal
//            1: begin 
//                case(rot)
//                    0, 2: begin
//                        blk_1 = (pos_y * 10) + pos_x - 1;  // If pos_x is 1, this will be the first column index
//                        blk_2 = (pos_y * 10) + pos_x;
//                        blk_3 = (pos_y * 10) + pos_x + 1;
//                        blk_4 = (pos_y * 10) + pos_x + 2;
//                        width = 4;
//                        height = 1;
//                    end
//                    1, 3: begin
//                        blk_1 = (pos_y - 1) * 10 + pos_x;
//                        blk_2 = pos_y * 10 + pos_x;
//                        blk_3 = (pos_y + 1) * 10 + pos_x;
//                        blk_4 = (pos_y + 2) * 10 + pos_x;
//                        width = 1;
//                        height = 4;
//                    end
//                 endcase
//            end
//            2: begin  //L piece 
//              case(rot)
//                0:begin
//                    blk_1 = (pos_y * 10) + pos_x - 1;
//                    blk_2 = (pos_y * 10) + pos_x;
//                    blk_3 = (pos_y * 10) + pos_x + 1;
//                    blk_4 = ((pos_y + 1) * 10) + pos_x + 1;
//                    width = 3;
//                    height = 2;
//                end
                
//                1: begin
//                    blk_1 = (pos_y - 1) * 10 + pos_x;
//                    blk_2 = pos_y * 10 + pos_x;
//                    blk_3 = (pos_y + 1) * 10 + pos_x;
//                    blk_4 = (pos_y + 1) * 10 + pos_x - 1;
//                    width = 2;
//                    height = 3;
//                end
                
//                2: begin  // 180 degrees
//                    blk_1 = ((pos_y + 1) * 10) + pos_x - 1;
//                    blk_2 = (pos_y * 10) + pos_x;
//                    blk_3 = (pos_y * 10) + pos_x + 1;
//                    blk_4 = ((pos_y - 1) * 10) + pos_x + 1;
//                    width = 3;
//                    height = 2;
//                end
                
//                 3: begin  // 270 degrees
//                    blk_1 = (pos_y + 1) * 10 + pos_x;
//                    blk_2 = pos_y * 10 + pos_x;
//                    blk_3 = (pos_y - 1) * 10 + pos_x;
//                    blk_4 = (pos_y - 1) * 10 + pos_x + 1;
//                    width = 2;
//                    height = 3;
//                end
//              endcase
//            end
//            3: begin // t piece
//                case(rot)
//                0: begin // Default
//                    blk_1 = (pos_y * 10) + pos_x - 1;
//                    blk_2 = (pos_y * 10) + pos_x;
//                    blk_3 = (pos_y * 10) + pos_x + 1;
//                    blk_4 = ((pos_y + 1) * 10) + pos_x;
//                    width = 3;
//                    height = 2;
//                end
//                1: begin // 90 degrees
//                    blk_1 = (pos_y - 1) * 10 + pos_x;
//                    blk_2 = pos_y * 10 + pos_x;
//                    blk_3 = (pos_y + 1) * 10 + pos_x;
//                    blk_4 = pos_y * 10 + pos_x + 1;
//                    width = 2;
//                    height = 3;
//                end
//                2: begin // 180 degrees
//                    blk_1 = (pos_y * 10) + pos_x + 1;
//                    blk_2 = (pos_y * 10) + pos_x;
//                    blk_3 = (pos_y * 10) + pos_x - 1;
//                    blk_4 = ((pos_y - 1) * 10) + pos_x;
//                    width = 3;
//                    height = 2;
//                end
//                3: begin // 270 degrees
//                    blk_1 = (pos_y + 1) * 10 + pos_x;
//                    blk_2 = pos_y * 10 + pos_x;
//                    blk_3 = (pos_y - 1) * 10 + pos_x;
//                    blk_4 = pos_y * 10 + pos_x - 1;
//                    width = 2;
//                    height = 3;
//                end
//            endcase
//            end
//            4: begin // Z piece rotation
//                case(rot)
//                    0, 2: begin // Horizontal
//                        blk_1 = (pos_y * 10) + pos_x;
//                        blk_2 = (pos_y * 10) + pos_x + 1;
//                        blk_3 = ((pos_y + 1) * 10) + pos_x + 1;
//                        blk_4 = ((pos_y + 1) * 10) + pos_x + 2;
//                        width = 3;
//                        height = 2;
//                    end
//                    1, 3: begin // Vertical
//                        blk_1 = (pos_y - 1) * 10 + pos_x + 1;
//                        blk_2 = pos_y * 10 + pos_x + 1;
//                        blk_3 = pos_y * 10 + pos_x;
//                        blk_4 = (pos_y + 1) * 10 + pos_x;
//                        width = 2;
//                        height = 3;
//                    end
//                endcase 
//            end
//            5: begin // S piece rotation
//            case(rot)
//                0, 2: begin // Horizontal
//                    blk_1 = (pos_y * 10) + pos_x + 1;      // Bottom-right
//                    blk_2 = (pos_y * 10) + pos_x;  // Bottom-left
//                    blk_3 = ((pos_y + 1) * 10) + pos_x;  // Top-left
//                    blk_4 = ((pos_y + 1) * 10) + pos_x - 1; // Top-left moved left
//                    width = 3;
//                    height = 2;
//                end
//                1, 3: begin // Vertical
//                    blk_1 = (pos_y - 1) * 10 + pos_x;
//                    blk_2 = pos_y * 10 + pos_x;
//                    blk_3 = pos_y * 10 + pos_x + 1;
//                    blk_4 = (pos_y + 1) * 10 + pos_x + 1;
//                    width = 2;
//                    height = 3;
//                end
//            endcase
//        end
//        endcase
//    end
//endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2024 01:07:43 AM
// Design Name: 
// Module Name: calculate_cur_block_pos
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


module calculate_cur_block_pos(
    input logic [2:0] piece,
    input logic [3:0] pos_x,
    input logic [4:0] pos_y,
    input logic [1:0] rot,
    output logic [7:0] blk_1,
    output logic [7:0] blk_2,
    output logic [7:0] blk_3,
    output logic [7:0] blk_4,
    output logic [2:0] width,
    output logic [2:0] height

    );
    
    always @ (*) begin //square piece
        case(piece)
            0: begin 
                blk_1 = (pos_y * 10) + pos_x;
                blk_2 = (pos_y * 10) + pos_x + 1;
                blk_3 = ((pos_y + 1) * 10) + pos_x;
                blk_4 = ((pos_y + 1) * 10) + pos_x + 1;
                width = 2;
                height = 2;
            end
          // I piece, horizontal
            1: begin 
                case(rot)
                    0, 2: begin
                        blk_1 = (pos_y * 10) + pos_x;
                         blk_2 = ((pos_y + 1) * 10) + pos_x;
                         blk_3 = ((pos_y + 2) * 10) + pos_x;
                         blk_4 = ((pos_y + 3) * 10) + pos_x;
                         width = 1;
                         height = 4;
                    end
                    1, 3: begin
                        blk_1 = (pos_y * 10) + pos_x;
                         blk_2 = (pos_y * 10) + pos_x + 1;
                         blk_3 = (pos_y * 10) + pos_x + 2;
                         blk_4 = (pos_y * 10) + pos_x + 3;
                         width = 4;
                         height = 1;
                    end
                 endcase
            end
            2: begin  //L piece 
              case(rot)
                0:begin
                    blk_1 = (pos_y * 10) + pos_x;
                    blk_2 = ((pos_y + 1) * 10) + pos_x;
                    blk_3 = ((pos_y + 2) * 10) + pos_x;
                    blk_4 = ((pos_y + 2) * 10) + pos_x + 1;
                    width = 2;
                    height = 3;
                end
                
                1: begin
                    blk_1 = ((pos_y + 1) * 10) + pos_x;
                    blk_2 = (pos_y * 10) + pos_x;
                    blk_3 = (pos_y * 10) + pos_x + 1;
                    blk_4 = (pos_y * 10) + pos_x + 2;
                    width = 3;
                    height = 2;
                end
                
                2: begin  // 180 degrees
                    blk_1 = (pos_y * 10) + pos_x + 1;
                    blk_2 = ((pos_y + 1) * 10) + pos_x + 1;
                    blk_3 = ((pos_y + 2) * 10) + pos_x + 1;
                    blk_4 = (pos_y * 10) + pos_x;
                    width = 2;
                    height = 3;
                end
                
                 3: begin  // 270 degrees
                     blk_1 = ((pos_y + 1) * 10) + pos_x;
                    blk_2 = ((pos_y + 1) * 10) + pos_x + 1;
                    blk_3 = ((pos_y + 1) * 10) + pos_x + 2;
                    blk_4 = (pos_y * 10) + pos_x + 2;
                    width = 3;
                    height = 2;
                end
              endcase
            end
            3: begin // t piece
                case(rot)
                0: begin // Default
                    blk_1 = (pos_y * 10) + pos_x + 1;
                    blk_2 = ((pos_y + 1) * 10) + pos_x;
                    blk_3 = ((pos_y + 1) * 10) + pos_x + 1;
                    blk_4 = ((pos_y + 1) * 10) + pos_x + 2;
                    width = 3;
                    height = 2;
                end
                1: begin // 90 degrees
                    blk_1 = (pos_y * 10) + pos_x;
                    blk_2 = ((pos_y + 1) * 10) + pos_x;
                    blk_3 = ((pos_y + 2) * 10) + pos_x;
                    blk_4 = ((pos_y + 1) * 10) + pos_x + 1;
                    width = 2;
                    height = 3;
                end
                2: begin // 180 degrees
                    blk_1 = (pos_y * 10) + pos_x;
                    blk_2 = (pos_y * 10) + pos_x + 1;
                    blk_3 = (pos_y * 10) + pos_x + 2;
                    blk_4 = ((pos_y + 1) * 10) + pos_x + 1;
                    width = 3;
                    height = 2;
                end
                3: begin // 270 degrees
                    blk_1 = (pos_y * 10) + pos_x + 1;
                    blk_2 = ((pos_y + 1) * 10) + pos_x + 1;
                    blk_3 = ((pos_y + 2) * 10) + pos_x + 1;
                    blk_4 = ((pos_y + 1) * 10) + pos_x;
                    width = 2;
                    height = 3;
                end
            endcase
            end
            4: begin // Z piece rotation
                case(rot)
                    0, 2: begin // Horizontal
                        blk_1 = (pos_y * 10) + pos_x;
                        blk_2 = (pos_y * 10) + pos_x + 1;
                        blk_3 = ((pos_y + 1) * 10) + pos_x + 1;
                        blk_4 = ((pos_y + 1) * 10) + pos_x + 2;
                        width = 3;
                        height = 2;
                    end
                    1, 3: begin // Vertical
                        blk_1 = (pos_y * 10) + pos_x + 1;
                        blk_2 = ((pos_y + 1) * 10) + pos_x;
                        blk_3 = ((pos_y + 2) * 10) + pos_x;
                        blk_4 = ((pos_y + 1) * 10) + pos_x + 1;
                        width = 2;
                        height = 3;
                    end
                endcase 
            end
            5: begin // S piece rotation
            case(rot)
                0, 2: begin // Horizontal
                    blk_1 = (pos_y * 10) + pos_x + 1;
                    blk_2 = (pos_y * 10) + pos_x + 2;
                    blk_3 = ((pos_y + 1) * 10) + pos_x;
                    blk_4 = ((pos_y + 1) * 10) + pos_x + 1;
                    width = 3;
                    height = 2;
                end
                1, 3: begin // Vertical
                    blk_1 = (pos_y * 10) + pos_x;
                    blk_2 = ((pos_y + 1) * 10) + pos_x;
                    blk_3 = ((pos_y + 1) * 10) + pos_x + 1;
                    blk_4 = ((pos_y + 2) * 10) + pos_x + 1;
                    width = 2;
                    height = 3;
                end
            endcase
        end
        endcase
    end
endmodule

