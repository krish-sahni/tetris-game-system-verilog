`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2024 12:52:48 AM
// Design Name: 
// Module Name: next_piece_generator
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

module next_piece_generator(
    input logic clk,         // Clock input
    input logic reset,       // Asynchronous reset input
    output logic [2:0] next_piece  // Output next piece type (3 bits for 6 pieces)
);

reg [6:0] lfsr = 7'b000_0001;  // 7-bit LFSR for randomness

always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
        lfsr <= 7'b000_0001;  // Reset the LFSR to an initial non-zero value
        next_piece <= 3'd0;   // Reset to the first piece type
    end else begin
        // Perform an LFSR update
        lfsr <= {lfsr[5:0], lfsr[6] ^ lfsr[5]};  // Example feedback taps

        // Map the 7-bit LFSR output to a piece index (0 to 5)
        next_piece <= lfsr[2:0] % 6; // Using modulo to ensure range is within 0 to 5
    end
end

endmodule
