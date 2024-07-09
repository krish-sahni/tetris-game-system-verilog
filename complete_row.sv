`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2024 11:12:48 PM
// Design Name: 
// Module Name: complete_row
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


module complete_row(
    input logic                                   clk,
//    input logic                                   pause,
    input logic [219:0] fallen_pieces,
    output logic [4:0]                 row,
    output logic                                  enabled
    );

    initial begin
        row = 0;
    end

     // Enabled is high when the current row is complete (all 1s)
     assign enabled = &fallen_pieces[row*10 +: 10];

     // Increment the row under test when the clock goes high
     always @ (posedge clk) begin
//         if (!pause) begin
             if (row == 21) begin
                 row <= 0;
             end else begin
                 row <= row + 1;
             end
//         end
     end

endmodule