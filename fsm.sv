`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2024 09:02:45 PM
// Design Name: 
// Module Name: fsm
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


module fsm(
        input logic [7:0] keycode,
        input logic gameOver,
        input logic Clk,
        input logic Reset,
        output logic [1:0] outputState
    );
    
    enum logic [1:0] {startGame, playGame, endGame} currentState, nextState;
    
    // State Transition Logic
    always_ff @(posedge Clk) begin
        if (Reset)
            currentState <= startGame;
        else
            currentState <= nextState;
    end 
    
    //next state logic
    always_comb begin
        nextState = currentState;
        
        unique case (currentState)
            startGame:
                if(keycode == 8'h2C) begin
                    nextState = playGame;
                end
            playGame:
                if(gameOver) begin
                    nextState = endGame;
                end
            endGame:
                nextState = endGame;
        endcase
        
        case(currentState)
            startGame: outputState = 2'b01; // Display start screen
            playGame: outputState = 2'b10; // Currently in gameplay
            endGame: outputState = 2'b00; // Display end screen
            default: outputState = 2'b10;
        endcase
             
    end
endmodule
