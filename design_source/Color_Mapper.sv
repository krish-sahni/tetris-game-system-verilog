//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Modified by Zuofu Cheng   08-19-2023                               --
//                                                                       --
//    Fall 2023 Distribution                                             --
//                                                                       --
//    For use with ECE 385 USB + HDMI                                    --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper ( input logic remove_row_en,
                       input  logic [9:0] BallX, BallY, DrawX, DrawY, Ball_size,
                       input logic [219:0] fallen_pieces,
                       input logic clk,
                       input logic [7:0] cur_blk_1,
                       input logic [7:0] cur_blk_2,
                       input logic [7:0] cur_blk_3,
                       input logic [7:0] cur_blk_4,
                       input logic [1:0] outputState,
                       input logic [2:0] cur_piece,
                       output logic [3:0]  Red, Green, Blue );
    
//    logic ball_on;
	 
 /* Old Ball: Generated square box by checking if the current pixel is within a square of length
    2*BallS, centered at (BallX, BallY).  Note that this requires unsigned comparisons.
	 
    if ((DrawX >= BallX - Ball_size) &&
       (DrawX <= BallX + Ball_size) &&
       (DrawY >= BallY - Ball_size) &&
       (DrawY <= BallY + Ball_size))
       )

     New Ball: Generates (pixelated) circle by using the standard circle formula.  Note that while 
     this single line is quite powerful descriptively, it causes the synthesis tool to use up three
     of the 120 available multipliers on the chip!  Since the multiplicants are required to be signed,
	  we have to first cast them from logic to int (signed by default) before they are multiplied). */
	  
//    int DistX, DistY, Size;
//    assign DistX = DrawX - BallX;
//    assign DistY = DrawY - BallY;
//    assign Size = Ball_size;
  
//    always_comb
//    begin:Ball_on_proc
//        if ( (DistX*DistX + DistY*DistY) <= (Size * Size) )
//            ball_on = 1'b1;
//        else 
//            ball_on = 1'b0;
//     end 
       
//    always_comb
//    begin:RGB_Display
//        if ((ball_on == 1'b1)) begin 
//            Red = 4'h0;
//            Green = 4'h0;
//            Blue = 4'h0;
//        end       
//        else begin 
//            Red = 4'hf - DrawY[9:6]; 
//            Green = 4'hf - DrawY[9:6];
//            Blue = 4'hf - DrawY[9:6];
//        end      
//    end 

//    reg [9:0] counter_x = 0;
//    reg [9:0] counter_y = 0;
//    assign hsync = ~(counter_x >= (640 + 16) &&
//                     counter_x < (640 + 16 + 96));
//    assign vsync = ~(counter_y >= (480 + 11) &&
//                     counter_y < (480 + 11 + 2));
    
    // calculates current block index by startiting board pixel (219 for x) from current pixel and dividing by size for x and width for y
    logic [9:0] cur_blk_index = ((DrawX-219)/20) + (((DrawY-19)/20)*10);
    
    logic [5:0] draw_blkx;
    logic [5:0] draw_blky;
    assign draw_blkx = DrawX[9:4];
    assign draw_blky = DrawY[9:4]; 
    
    always @ (*) begin
    
        if(outputState == 2'b01) begin 
            if((draw_blkx ==6'd3 && draw_blky == 6'd10 )||(draw_blkx == 6'd4 && draw_blky ==6'd10 )||(draw_blkx ==6'd5 && draw_blky ==6'd10 )||
            (draw_blkx == 6'd6 && draw_blky ==6'd10 )||(draw_blkx ==6'd7 && draw_blky ==6'd10 )||(draw_blkx == 6'd5 && draw_blky ==6'd11 )||
            (draw_blkx == 6'd5 && draw_blky == 6'd12)||(draw_blkx == 6'd5 && draw_blky == 6'd13)||(draw_blkx ==6'd5 && draw_blky == 6'd14)||
            (draw_blkx ==6'd5 && draw_blky ==6'd15 )||(draw_blkx ==6'd5 && draw_blky == 6'd16)
            )begin//red T
            Red = 4'hF;
            Green = 4'h0;
            Blue = 4'h0;
            end
            else if ((draw_blkx ==6'd9 && draw_blky == 6'd10 )||(draw_blkx == 6'd10 && draw_blky ==6'd10 )||(draw_blkx ==6'd11 && draw_blky ==6'd10 )||
            (draw_blkx == 6'd12 && draw_blky ==6'd10 )||(draw_blkx ==6'd13 && draw_blky ==6'd10 )||(draw_blkx == 6'd9 && draw_blky ==6'd11 )||
            (draw_blkx == 6'd9 && draw_blky == 6'd12)||(draw_blkx == 6'd9 && draw_blky == 6'd13)||(draw_blkx ==6'd9 && draw_blky == 6'd14)||
            (draw_blkx ==6'd9 && draw_blky ==6'd15 )||(draw_blkx ==6'd9 && draw_blky == 6'd16) ||
            (draw_blkx == 6'd10 && draw_blky == 6'd13)||(draw_blkx == 6'd11 && draw_blky == 6'd13)||(draw_blkx == 6'd12 && draw_blky == 6'd13)||
            (draw_blkx ==6'd13 && draw_blky ==6'd13 )||(draw_blkx ==6'd10 && draw_blky == 6'd16) || (draw_blkx == 6'd11 && draw_blky == 6'd16) ||
            (draw_blkx ==6'd12 && draw_blky == 6'd16) || (draw_blkx ==6'd13 && draw_blky == 6'd16)
            )begin//orange E
            Red = 4'hF;
            Green = 4'h5;
            Blue = 4'h0;
            end
            else if ((draw_blkx ==6'd15 && draw_blky == 6'd10 )||(draw_blkx == 6'd16 && draw_blky ==6'd10 )||(draw_blkx ==6'd17 && draw_blky ==6'd10 )||
            (draw_blkx == 6'd18 && draw_blky ==6'd10 )||(draw_blkx ==6'd19 && draw_blky ==6'd10 )||(draw_blkx == 6'd17 && draw_blky ==6'd11 )||
            (draw_blkx == 6'd17 && draw_blky == 6'd12)||(draw_blkx == 6'd17 && draw_blky == 6'd13)||(draw_blkx ==6'd17 && draw_blky == 6'd14)||
            (draw_blkx ==6'd17 && draw_blky ==6'd15 )||(draw_blkx ==6'd17 && draw_blky == 6'd16)

            )begin //Yellow T
            Red = 4'hF;
            Green = 4'hF;
            Blue = 4'h5;
            end
            else if ((draw_blkx ==6'd21 && draw_blky == 6'd10 )||(draw_blkx == 6'd21 && draw_blky ==6'd11 )||(draw_blkx ==6'd21 && draw_blky ==6'd12 )||
            (draw_blkx == 6'd21 && draw_blky ==6'd13 )||(draw_blkx ==6'd21 && draw_blky ==6'd14 )||(draw_blkx == 6'd21 && draw_blky ==6'd15 )||
            (draw_blkx == 6'd21 && draw_blky == 6'd16)||(draw_blkx == 6'd22 && draw_blky == 6'd10)||(draw_blkx ==6'd22 && draw_blky == 6'd13)||
            (draw_blkx ==6'd23 && draw_blky ==6'd10 )||(draw_blkx ==6'd23 && draw_blky == 6'd13)||
            (draw_blkx == 6'd24 && draw_blky == 6'd10)||(draw_blkx == 6'd24 && draw_blky == 6'd13)||(draw_blkx ==6'd24 && draw_blky == 6'd14)||
            (draw_blkx ==6'd25 && draw_blky ==6'd10 )||(draw_blkx ==6'd25 && draw_blky == 6'd11) || (draw_blkx ==6'd25 && draw_blky == 6'd12) ||
            (draw_blkx ==6'd25 && draw_blky == 6'd15) || (draw_blkx ==6'd25 && draw_blky == 6'd16) 

            )begin//Green R
                Red = 4'h0;
                Green = 4'hA;
                Blue = 4'h0;
            end
            else if ((draw_blkx ==6'd27 && draw_blky == 6'd10 )||(draw_blkx == 6'd28 && draw_blky ==6'd10 )||(draw_blkx ==6'd29 && draw_blky ==6'd10 )||
            (draw_blkx == 6'd30 && draw_blky ==6'd10 )||(draw_blkx ==6'd31 && draw_blky ==6'd10 )||(draw_blkx == 6'd29 && draw_blky ==6'd11 )||
            (draw_blkx == 6'd29 && draw_blky == 6'd12)||(draw_blkx == 6'd29 && draw_blky == 6'd13)||(draw_blkx ==6'd29 && draw_blky == 6'd14)||
            (draw_blkx ==6'd29 && draw_blky ==6'd15 )||(draw_blkx ==6'd27 && draw_blky == 6'd16)||(draw_blkx ==6'd28 && draw_blky == 6'd16)||
            (draw_blkx ==6'd29 && draw_blky == 6'd16)||(draw_blkx ==6'd30 && draw_blky == 6'd16)||(draw_blkx ==6'd31 && draw_blky == 6'd16)
            )begin // Cyan I
                Red = 4'h0;
                Green = 4'hA;
                Blue = 4'hA;
            
            end
            else if (
            (draw_blkx ==6'd34 && draw_blky == 6'd10 )||(draw_blkx == 6'd35 && draw_blky ==6'd10 )||(draw_blkx ==6'd36 && draw_blky ==6'd10 )||
            (draw_blkx == 6'd37 && draw_blky ==6'd10 )||(draw_blkx ==6'd33 && draw_blky ==6'd11 )||(draw_blkx == 6'd33 && draw_blky ==6'd12 )||
            (draw_blkx == 6'd34 && draw_blky == 6'd13)||(draw_blkx == 6'd35 && draw_blky == 6'd13)||(draw_blkx ==6'd36 && draw_blky == 6'd13)||
            (draw_blkx ==6'd37 && draw_blky ==6'd14 )||(draw_blkx ==6'd37 && draw_blky == 6'd15)||(draw_blkx ==6'd33 && draw_blky == 6'd16)||
            (draw_blkx ==6'd34 && draw_blky == 6'd16)||(draw_blkx ==6'd35 && draw_blky == 6'd16)||(draw_blkx ==6'd36 && draw_blky == 6'd16)
            )begin // Purple
                Red = 4'hA;
                Green = 4'h0;
                Blue = 4'hA;
            
            end
            else begin
                Red = 4'h0;
                Green = 4'h0;
                Blue = 4'h0;
            end
        end
        else if (outputState == 2'b10) begin
        // Check if we're within the drawing space
            if (DrawX >= 219 && DrawY >= 19 &&
                DrawX <= 219 + 200 && DrawY <= 19 + 440) begin
                if (DrawX == 219 || DrawX == 219 + 200 ||
                    DrawY == 19 || DrawY == 19 + 440) begin
                    // We're at the edge of the board, paint it white
                    Red = 4'hf; 
                    Green = 4'hf;
                    Blue = 4'hf;
                end 
                else if ((DrawX - 219) % 20 < 1 || (DrawY - 19) % 20 < 1) begin
                // Draw black lines between blocks
                    Red = 4'h0;
                    Green = 4'h0;
                    Blue = 4'h0;
                end 
                else if (cur_blk_index == cur_blk_1 ||
                        cur_blk_index == cur_blk_2 ||
                        cur_blk_index == cur_blk_3 ||
                        cur_blk_index == cur_blk_4) begin
                        case(cur_piece)
                            3'b000: begin
                                Red = 4'hf; 
                                Green = 4'hf;
                                Blue = 4'h0;
                            end
                            3'b001: begin
                                Red = 4'hf;   // Full intensity red
                                Green = 4'h0; // No green
                                Blue = 4'h0;  // No blue
                            end
                            
                            3'b010: begin
                                Red = 4'h0;   // Full intensity red
                                Green = 4'hf; // No green
                                Blue = 4'h0;  // No blue
                            end
                            3'b011: begin
                                Red = 4'h0;   // Full intensity red
                                Green = 4'h0; // No green
                                Blue = 4'hf;  // No blue
                            end
                            3'b100: begin
                                Red = 4'hf;   // Full intensity red
                                Green = 4'h0; // No green
                                Blue = 4'hf;  // No blue
                            end
                            
                            3'b101: begin
                                Red = 4'h0;   // Full intensity red
                                Green = 4'hf; // No green
                                Blue = 4'hf;  // No blue
                            end
                                
                        endcase
                        
                    
                        
                end
                else begin
    //                
                    Red = fallen_pieces[cur_blk_index] ? 4'hf : 4'h8;
                    Green = fallen_pieces[cur_blk_index] ? 4'hf : 4'h8;
                    Blue = fallen_pieces[cur_blk_index] ? 4'hf : 4'h8;
                end
            end
            
            else if(remove_row_en) begin
                if (DrawX >= 10 && DrawY >= 10 &&
                    DrawX <= 50 && DrawY <= 50) begin
                    Red = 4'hf; 
                    Green = 4'hf;
                    Blue = 4'hf;
                end
            end
            
            else begin
                Red = 4'h2; 
                Green = 4'h0;
                Blue = 4'h0;
            end 
        end 
        else if(outputState == 2'b00) begin
            if(((draw_blkx == 6'd11) && (draw_blky >= 6'd2) && (draw_blky <= 6'd27))||
               ((draw_blky == 6'd27) && (draw_blkx >= 6'd11) && (draw_blkx <= 6'd24)))begin 
                 Red = 4'hF;
                 Green = 4'h0;
                 Blue = 4'h0;
                end
            else begin
                Red = 4'h0;
                Green = 4'h0;
                Blue = 4'h0;
           end
        end
        else begin
            // Outside the board
            Red = 4'h2; 
            Green = 4'h0;
            Blue = 4'h0;
        end
    end
    
//    always @ (posedge clk) begin
//       if (DrawX >= 640) begin
//           DrawX <= 0;
//           if (counter_y >= 480 + 11 + 2 + 31) begin
//               counter_y <= 0;
//           end 
//           else begin
//               counter_y <= counter_y + 1;
//           end
//       end 
//       else begin
//           counter_x <= counter_x + 1;
//       end
//   end
    
    
    
    
    
    
    

    
endmodule
