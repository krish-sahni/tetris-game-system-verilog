`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2024 11:49:15 PM
// Design Name: 
// Module Name: game_clock_
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


module game_clock_(
    input logic clk,
    input logic rst,
    output logic game_clk

    );
    
    reg [31:0] counter;
    always @ (posedge clk) begin
        if (rst) begin
            counter <= 0;
            game_clk <= 0;
        end else begin
            if (counter == 500000) begin // 1 Hz
                counter <= 0;
                game_clk <= 1;
            end else begin
                counter <= counter + 1;
                game_clk <= 0;
            end
        end
      
    end
endmodule
