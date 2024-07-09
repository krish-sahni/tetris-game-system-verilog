////-------------------------------------------------------------------------
////    Ball.sv                                                            --
////    Viral Mehta                                                        --
////    Spring 2005                                                        --
////                                                                       --
////    Modified by Stephen Kempf     03-01-2006                           --
////                                  03-12-2007                           --
////    Translated by Joe Meng        07-07-2013                           --
////    Modified by Zuofu Cheng       08-19-2023                           --
////    Modified by Satvik Yellanki   12-17-2023                           --
////    Fall 2024 Distribution                                             --
////                                                                       --
////    For use with ECE 385 USB + HDMI Lab                                --
////    UIUC ECE Department                                                --
////-------------------------------------------------------------------------


//module  ball 
//( 
//    input  logic        Reset, 
//    input  logic        frame_clk,
//    input  logic [7:0]  keycode,
//    input  logic [3:0] current_x_pos,
//    input  logic [4:0] current_y_pos,
//    input logic [219:0] fallen_pieces,
////    input logic game_clk,
////    input logic intersects,
//    output logic [9:0]  BallX, 
//    output logic [9:0]  BallY, 
//    output logic [9:0]  BallS,
//    output logic [3:0] new_x_pos,
//    output logic [4:0] new_y_pos,
//    output logic [219:0] new_fallen_pieces,
//    output logic collision_detected,
//    output logic intersection_bottom,
//    output logic [7:0] test_blk_1,
//    output logic [7:0] test_blk_2,
//    output logic [7:0] test_blk_3,
//    output logic [7:0] test_blk_4,
//    output logic [2:0] test_width,
//    output logic [2:0] test_height
////    output logic game_clk_reset,
////    output logic [2:0] timer
//);
    
    
    
    
    
    
    
    
    
    
    
    
    
    

//   logic [2:0] timer;  // Timer to control the frequency of movement
//logic [7:0] last_keycode;  // To store the last keycode state
//logic key_action_taken;  // Flag to track if a key action has been taken
//logic [3:0] test_pos_x;
//logic [4:0] test_pos_y;
//logic [2:0] cur_piece;
//logic [2:0] next_piece;
////logic collision_detected;

//calc_test_pos_rot calc_test_pos_rot_ (
////        .Reset(Reset),
//        .frame_clk(frame_clk),
//        .keycode(keycode),        
//        .timer(timer),
//        .cur_pos_x(current_x_pos),
//        .cur_pos_y(current_y_pos),
//        .fallen_pieces(fallen_pieces),
//        .last_keycode(last_keycode),
//        .key_action_taken(key_action_taken),
//        .cur_piece(3'b000),
//        .width(test_width),
//        .height(test_height),
////        .cur_rot(cur_rot),
//        .test_pos_x(test_pos_x),
//        .test_pos_y(test_pos_y),
//        .test_intersects(collision_detected)
////        .test_rot(test_rot)
//    );



//    calculate_cur_block_pos calculate_cur_block_pos(
//        .piece(3'b000),
//        .pos_x(current_x_pos),
//        .pos_y(current_y_pos),
//        .rot(2'b00),
//        .blk_1(test_blk_1),
//        .blk_2(test_blk_2),
//        .blk_3(test_blk_3),
//        .blk_4(test_blk_4),
//        .width(test_width),
//        .height(test_height)
//    );
//    next_piece_generator next_piece_generator(
//        .clk(frame_clk),
//        .reset(Reset),
//        .next_piece(next_piece)
//    );
////task add_to_fallen_pieces;
////        begin
////            new_fallen_pieces[test_blk_1] <= 1;
////            new_fallen_pieces[test_blk_2] <= 1;
////            new_fallen_pieces[test_blk_3] <= 1;
////            new_fallen_pieces[test_blk_4] <= 1;
////        end
////    endtask
////task move_left;
////    begin
////        if(!collision_detected && current_x_pos > 0)begin
////            new_x_pos <= current_x_pos - 1;
////            key_action_taken <= 1;
////        end
////    end
////endtask

//initial begin
//    timer = 0;
//    last_keycode = 0;
//    key_action_taken = 0;
//end
////logic wait_one_cycle;
//////always_ff @(posedge frame_clk or posedge Reset) begin
////always_ff @(posedge frame_clk or posedge Reset) begin
////    if (Reset) begin
////        // Resetting the position and timer
////        new_x_pos <= 5;           // Initial X position
////        new_y_pos <= 2;           // Initial Y position
////        timer <= 0;               // Reset timer
////        last_keycode <= 0;        // Reset the last keycode state
////        key_action_taken <= 0;    // Reset the key action taken flag
////        wait_one_cycle <= 0;      // Reset the wait cycle flag
////    end else begin
////        // Handle left and right key inputs
//////        if ((keycode != last_keycode || key_action_taken) && !collision_detected) begin  // Check for change in keycode or action taken
////        if ((keycode != last_keycode || key_action_taken)) begin  // Check for change in keycode or action taken
////            case (keycode)
////                8'h50:  // Left Arrow Key
////                    if (current_x_pos > 0) begin
////                        new_x_pos <= current_x_pos - 1;
////                        key_action_taken <= 1;
////                    end
////                8'h4F:  // Right Arrow Key
////                    if (current_x_pos < 8) begin
////                        new_x_pos <= current_x_pos + 1;
////                        key_action_taken <= 1;
////                    end
////                default:
////                    key_action_taken <= 0;  // No key action matches, reset flag
////            endcase
////        end
////        if (key_action_taken && (keycode == last_keycode)) begin
////            // Reset action taken flag if no key change and action was taken
////            key_action_taken <= 0;
////        end
////        last_keycode <= keycode;  // Update last keycode state

////        // Increment timer every clock cycle for vertical movement
////        if (timer < 5)
////            timer <= timer + 1;
////        else begin
////            // Move block down when timer reaches 3
////            timer <= 0;                   // Reset timer
//////            if (current_y_pos < 20 && !collision_detected) begin
////            if (wait_one_cycle) begin
////                // Add to fallen pieces logic
////                new_y_pos <= 0;          // Reset to top if it reaches bounds
////                intersection_bottom <= 1;
////                wait_one_cycle <= 0;     // Clear the wait flag after resetting
////            end else if (current_y_pos < 20) begin
////                new_y_pos <= current_y_pos + 1; // Move down
////                intersection_bottom <= 0;
////            end else begin
////                // Set wait flag to true to delay resetting by one cycle
////                wait_one_cycle <= 1;
////            end
////        end
////    end

//////    if (intersection_bottom) begin
//////        add_to_fallen_pieces();
//////        new_fallen_pieces[test_blk_1] <= 1;
//////        new_fallen_pieces[test_blk_2] <= 1;
//////        new_fallen_pieces[test_blk_3] <= 1;
//////        new_fallen_pieces[test_blk_4] <= 1;
//////    end

//////    if(collision_detected) begin
//////        fallen_pieces[cur_blk_1] <= 1;
//////        fallen_pieces[cur_blk_2] <= 1;
//////        fallen_pieces[cur_blk_3] <= 1;
//////        fallen_pieces[cur_blk_4] <= 1;
//////    end
////end

////always_ff @(posedge frame_clk or posedge Reset) begin
//logic move_it_left;
//logic move_it_right;
//logic move_it_down;
//always_ff @(posedge frame_clk or posedge Reset) begin
//    if (Reset) begin
//        // Resetting the position and timer
//        new_x_pos <= 5;           // Initial X position
//        new_y_pos <= 2;           // Initial Y position
//        timer <= 0;               // Reset timer
//        last_keycode <= 0;        // Reset the last keycode state
//        key_action_taken <= 0;    // Reset the key action taken flag
//        cur_piece <= 3'b000;
//    end else begin
//        // Handle left and right key inputs
////        if ((keycode != last_keycode || key_action_taken) && !collision_detected) begin  // Check for change in keycode or action taken
//        if ((keycode != last_keycode || key_action_taken) && !collision_detected) begin  // Check for change in keycode or action taken
//            case (keycode)
//                8'h50:  // Left Arrow Key
//                    if (current_x_pos > 0) begin
////                        new_x_pos <= current_x_pos - 1;
////                        key_action_taken <= 1;
////                          move_left();
//                        move_it_left <= 1;
//                    end
//                8'h4F:  // Right Arrow Key
//                    if ((current_x_pos + test_width)< 10) begin
////                        new_x_pos <= current_x_pos + 1;
////                        key_action_taken <= 1;
//                        move_it_right <= 1;
//                    end
                    
//                default:
//                    key_action_taken <= 0;  // No key action matches, reset flag
//            endcase
//        end
//        if (key_action_taken && (keycode == last_keycode)) begin
//            // Reset action taken flag if no key change and action was taken
//            key_action_taken <= 0;
//        end
//        last_keycode <= keycode;  // Update last keycode state

//        // Increment timer every clock cycle for vertical movement
//        if (timer < 7)
//            timer <= timer + 1;
//        else begin
//            // Move block down when timer reaches 3
//            timer <= 0;                   // Reset timer
////            if (current_y_pos < 20 && !collision_detected) begin
//            if ((current_y_pos + test_height) < 22) begin
//                move_it_down <= 1;
////                new_y_pos <= current_y_pos + 1; // Move down
////                intersection_bottom <= 0;
//            end else begin
////                new_y_pos <= 0;          // Reset to top if it reaches bounds
//                intersection_bottom <= 1;
////                add_to_fallen_pieces();
////                new_fallen_pieces[test_blk_1] <= 1;
////                new_fallen_pieces[test_blk_2] <= 1;
////                new_fallen_pieces[test_blk_3] <= 1;
////                new_fallen_pieces[test_blk_4] <= 1;
//            end
//        end
//        if (intersection_bottom) begin
//            new_fallen_pieces[test_blk_1] <= 1;
//            new_fallen_pieces[test_blk_2] <= 1;
//            new_fallen_pieces[test_blk_3] <= 1;
//            new_fallen_pieces[test_blk_4] <= 1;
//            new_y_pos <= 0;  // Reset the block position after updating
//            intersection_bottom <= 0;  // Reset the flag
//            cur_piece <= next_piece;
//        end
//        if(move_it_left && (keycode != last_keycode || key_action_taken)) begin
//            if(!collision_detected && current_x_pos > 0)begin
//            new_x_pos <= current_x_pos - 1;
//            key_action_taken <= 1;
//            end
//        move_it_left <= 0;
//        end
//        if(move_it_right && (keycode != last_keycode || key_action_taken)) begin
//            if(!collision_detected && (current_x_pos +test_width)< 10 )begin
//            new_x_pos <= current_x_pos + 1;
//            key_action_taken <= 1;
//            end
//        move_it_right <= 0;
//        end
//        if(move_it_down) begin
//            if(!collision_detected) begin
//                new_y_pos <= current_y_pos + 1;
//            end
//            else if(collision_detected && keycode != 8'h50 && keycode != 8'h4F)begin
//                intersection_bottom <= 1;
//                new_fallen_pieces[test_blk_1] <= 1;
//                new_fallen_pieces[test_blk_2] <= 1;
//                new_fallen_pieces[test_blk_3] <= 1;
//                new_fallen_pieces[test_blk_4] <= 1;
//            end
////            else begin
//////                new_y_pos <= 0;
////                intersection_bottom <= 1;
////                new_fallen_pieces[test_blk_1] <= 1;
////                new_fallen_pieces[test_blk_2] <= 1;
////                new_fallen_pieces[test_blk_3] <= 1;
////                new_fallen_pieces[test_blk_4] <= 1;
////            end
//        move_it_down <= 0;
//        end
//    end
    
////    if (intersection_bottom) begin
////        new_fallen_pieces[test_blk_1] <= 1;
////        new_fallen_pieces[test_blk_2] <= 1;
////        new_fallen_pieces[test_blk_3] <= 1;
////        new_fallen_pieces[test_blk_4] <= 1;
////    end

    
////    if(collision_detected) begin
////        fallen_pieces[cur_blk_1] <= 1;
////        fallen_pieces[cur_blk_2] <= 1;
////        fallen_pieces[cur_blk_3] <= 1;
////        fallen_pieces[cur_blk_4] <= 1;
////    end
//end


//endmodule

//-------------------------------------------------------------------------
//    Ball.sv                                                            --
//    Viral Mehta                                                        --
//    Spring 2005                                                        --
//                                                                       --
//    Modified by Stephen Kempf     03-01-2006                           --
//                                  03-12-2007                           --
//    Translated by Joe Meng        07-07-2013                           --
//    Modified by Zuofu Cheng       08-19-2023                           --
//    Modified by Satvik Yellanki   12-17-2023                           --
//    Fall 2024 Distribution                                             --
//                                                                       --
//    For use with ECE 385 USB + HDMI Lab                                --
//    UIUC ECE Department                                                --
//-------------------------------------------------------------------------


module  ball 
( 
    input  logic        Reset, 
    input  logic        frame_clk,
    input  logic [7:0]  keycode,
    input  logic [3:0] current_x_pos,
    input  logic [4:0] current_y_pos,
    input logic [219:0] fallen_pieces,
    input logic [1:0] cur_rot,
//    input logic game_clk,
//    input logic intersects,
    output logic [9:0]  BallX, 
    output logic [9:0]  BallY, 
    output logic [9:0]  BallS,
    output logic [3:0] new_x_pos,
    output logic [4:0] new_y_pos,
    output logic [219:0] new_fallen_pieces,
    output logic collision_detected,
    output logic intersection_bottom,
    output logic [7:0] test_blk_1,
    output logic [7:0] test_blk_2,
    output logic [7:0] test_blk_3,
    output logic [7:0] test_blk_4,
    output logic [2:0] test_width,
    output logic [2:0] test_height,
    output logic [1:0] new_rot,
    output logic remove_row_en,
    output logic [4:0] remove_row_y,
    output logic game_over_en,
    output logic [2:0] cur_piece
//    output logic
//    output logic game_clk_reset,
//    output logic [2:0] timer
);
    
    
    
    
    
    
    
    
    
    
    
    
    
    

   logic [4:0] timer;  // Timer to control the frequency of movement
logic [7:0] last_keycode;  // To store the last keycode state
logic key_action_taken;  // Flag to track if a key action has been taken
logic [3:0] test_pos_x;
logic [4:0] test_pos_y;
logic [1:0] test_rot;
//logic [2:0] cur_piece;
logic [2:0] next_piece;
logic [2:0] ctpt_width;
logic [2:0] ctpt_height;
//logic collision_detected;
logic drop_mode;
logic test_drop_mode;
calc_test_pos_rot calc_test_pos_rot_ (
//        .Reset(Reset),
        .frame_clk(frame_clk),
        .keycode(keycode),        
        .timer(timer),
        .cur_pos_x(current_x_pos),
        .cur_pos_y(current_y_pos),
        .fallen_pieces(fallen_pieces),
        .last_keycode(last_keycode),
        .key_action_taken(key_action_taken),
        .cur_piece(cur_piece),
        .cur_rot(cur_rot),
        .width_check(test_width),
        .height_check(test_height),
        .drop_mode(drop_mode),
//        .width_check(
//        .cur_rot(cur_rot),
        .test_pos_x(test_pos_x),
        .test_pos_y(test_pos_y),
        .test_rot(test_rot),
        .test_intersects(collision_detected),
        .test_width(ctpt_width),
        .test_height(ctpt_height),
        .test_drop_mode(test_drop_mode)
//        .test_rot(test_rot)
    );



    calculate_cur_block_pos calculate_cur_block_pos(
        .piece(cur_piece),
        .pos_x(current_x_pos),
        .pos_y(current_y_pos),
        .rot(cur_rot),
        .blk_1(test_blk_1),
        .blk_2(test_blk_2),
        .blk_3(test_blk_3),
        .blk_4(test_blk_4),
        .width(test_width),
        .height(test_height)
    );
    next_piece_generator next_piece_generator(
        .clk(frame_clk),
        .reset(Reset),
        .next_piece(next_piece)
    );
    
    
    
//    logic [4:0] remove_row_y;
//    logic remove_row_en;
//    logic [4:0] shifting_row;
    complete_row complete_row_ (
        .clk(frame_clk),
        .fallen_pieces(fallen_pieces),
        .row(remove_row_y),
        .enabled(remove_row_en)
    );
//task add_to_fallen_pieces;
//        begin
//            new_fallen_pieces[test_blk_1] <= 1;
//            new_fallen_pieces[test_blk_2] <= 1;
//            new_fallen_pieces[test_blk_3] <= 1;
//            new_fallen_pieces[test_blk_4] <= 1;
//        end
//    endtask
//task move_left;
//    begin
//        if(!collision_detected && current_x_pos > 0)begin
//            new_x_pos <= current_x_pos - 1;
//            key_action_taken <= 1;
//        end
//    end
//endtask

initial begin
    timer = 0;
    last_keycode = 0;
    key_action_taken = 0;
end
//logic wait_one_cycle;
////always_ff @(posedge frame_clk or posedge Reset) begin
//always_ff @(posedge frame_clk or posedge Reset) begin
//    if (Reset) begin
//        // Resetting the position and timer
//        new_x_pos <= 5;           // Initial X position
//        new_y_pos <= 2;           // Initial Y position
//        timer <= 0;               // Reset timer
//        last_keycode <= 0;        // Reset the last keycode state
//        key_action_taken <= 0;    // Reset the key action taken flag
//        wait_one_cycle <= 0;      // Reset the wait cycle flag
//    end else begin
//        // Handle left and right key inputs
////        if ((keycode != last_keycode || key_action_taken) && !collision_detected) begin  // Check for change in keycode or action taken
//        if ((keycode != last_keycode || key_action_taken)) begin  // Check for change in keycode or action taken
//            case (keycode)
//                8'h50:  // Left Arrow Key
//                    if (current_x_pos > 0) begin
//                        new_x_pos <= current_x_pos - 1;
//                        key_action_taken <= 1;
//                    end
//                8'h4F:  // Right Arrow Key
//                    if (current_x_pos < 8) begin
//                        new_x_pos <= current_x_pos + 1;
//                        key_action_taken <= 1;
//                    end
//                default:
//                    key_action_taken <= 0;  // No key action matches, reset flag
//            endcase
//        end
//        if (key_action_taken && (keycode == last_keycode)) begin
//            // Reset action taken flag if no key change and action was taken
//            key_action_taken <= 0;
//        end
//        last_keycode <= keycode;  // Update last keycode state

//        // Increment timer every clock cycle for vertical movement
//        if (timer < 5)
//            timer <= timer + 1;
//        else begin
//            // Move block down when timer reaches 3
//            timer <= 0;                   // Reset timer
////            if (current_y_pos < 20 && !collision_detected) begin
//            if (wait_one_cycle) begin
//                // Add to fallen pieces logic
//                new_y_pos <= 0;          // Reset to top if it reaches bounds
//                intersection_bottom <= 1;
//                wait_one_cycle <= 0;     // Clear the wait flag after resetting
//            end else if (current_y_pos < 20) begin
//                new_y_pos <= current_y_pos + 1; // Move down
//                intersection_bottom <= 0;
//            end else begin
//                // Set wait flag to true to delay resetting by one cycle
//                wait_one_cycle <= 1;
//            end
//        end
//    end

////    if (intersection_bottom) begin
////        add_to_fallen_pieces();
////        new_fallen_pieces[test_blk_1] <= 1;
////        new_fallen_pieces[test_blk_2] <= 1;
////        new_fallen_pieces[test_blk_3] <= 1;
////        new_fallen_pieces[test_blk_4] <= 1;
////    end

////    if(collision_detected) begin
////        fallen_pieces[cur_blk_1] <= 1;
////        fallen_pieces[cur_blk_2] <= 1;
////        fallen_pieces[cur_blk_3] <= 1;
////        fallen_pieces[cur_blk_4] <= 1;
////    end
//end

//always_ff @(posedge frame_clk or posedge Reset) begin
logic move_it_left;
logic move_it_right;
logic move_it_down;
logic rotate_that_shit;
logic remove_that_shit;


always_ff @(posedge frame_clk or posedge Reset) begin
    if (Reset) begin
        // Resetting the position and timer
        new_x_pos <= 5;           // Initial X position
        new_y_pos <= 2;           // Initial Y position
        timer <= 0;               // Reset timer
        last_keycode <= 0;        // Reset the last keycode state
        key_action_taken <= 0;    // Reset the key action taken flag
        cur_piece <= 3'b000;
        new_rot <= 2'b00;
        remove_that_shit <= 0;
        drop_mode<=0;
    end else begin
        // Handle left and right key inputs
//        if ((keycode != last_keycode || key_action_taken) && !collision_detected) begin  // Check for change in keycode or action taken
        if ((keycode != last_keycode || key_action_taken) && !collision_detected) begin  // Check for change in keycode or action taken
            case (keycode)
                8'h50:  // Left Arrow Key
                    if (current_x_pos > 0) begin
//                        new_x_pos <= current_x_pos - 1;
//                        key_action_taken <= 1;
//                          move_left();
                        move_it_left <= 1;
                    end
                8'h4F:  // Right Arrow Key
                    if (current_x_pos + test_width < 10) begin
//                        new_x_pos <= current_x_pos + 1;
//                        key_action_taken <= 1;
                        move_it_right <= 1;
                    end
                8'h52:  // up Arrow Key
//                    
                    rotate_that_shit <=1;
                    
                8'h51:
                    drop_mode <=1;
                    
                    
                default:
                    key_action_taken <= 0;  // No key action matches, reset flag
            endcase
        end
        if (key_action_taken && (keycode == last_keycode)) begin
            // Reset action taken flag if no key change and action was taken
            key_action_taken <= 0;
        end
        last_keycode <= keycode;  // Update last keycode state

        // Increment timer every clock cycle for vertical movement
        if(!drop_mode) begin
            if (timer < 7)
                timer <= timer + 1;
            else begin
                // Move block down when timer reaches 3
                timer <= 0;                   // Reset timer
    //            if (current_y_pos < 20 && !collision_detected) begin
                if (current_y_pos +test_height < 22) begin
                    move_it_down <= 1;
    //                new_y_pos <= current_y_pos + 1; // Move down
    //                intersection_bottom <= 0;
                end else begin
    //                new_y_pos <= 0;          // Reset to top if it reaches bounds
                    intersection_bottom <= 1;
    //                add_to_fallen_pieces();
    //                new_fallen_pieces[test_blk_1] <= 1;
    //                new_fallen_pieces[test_blk_2] <= 1;
    //                new_fallen_pieces[test_blk_3] <= 1;
    //                new_fallen_pieces[test_blk_4] <= 1;
                end
            end
        
        end
        if(drop_mode) begin
            if(current_y_pos + test_height == 22) begin
                intersection_bottom <= 1;
            end
        end
        
        
        if (intersection_bottom) begin
            if (current_y_pos == 0 && !drop_mode) begin
                game_over_en <= 1;
            end
            new_fallen_pieces[test_blk_1] <= 1;
            new_fallen_pieces[test_blk_2] <= 1;
            new_fallen_pieces[test_blk_3] <= 1;
            new_fallen_pieces[test_blk_4] <= 1;
            new_y_pos <= 0;  // Reset the block position after updating
//            new_x_pos <= 5;
            cur_piece<= next_piece;
            drop_mode<=0;
            intersection_bottom <= 0;  // Reset the flag
//            if(remove_row_en) begin
////                remove_that_shit <=1;
////                shifting_row <= remove_row_y;
//                new_fallen_pieces[remove_row_y*10 +: 10] <= 0;

//                // Shift down all rows above the cleared row
//                for (int i = remove_row_y; i > 0; i--) begin
//                    new_fallen_pieces[i*10 +: 10] <= fallen_pieces[(i-1)*10 +: 10];
//                end
//            end
           
        end
        
//        if(remove_row_en) begin
//                remove_that_shit <=1;
////                shifting_row <= remove_row_y;
//                new_fallen_pieces[remove_row_y*10 +: 10] <= 0;
//                new_fallen_pieces[20*10 +: 10] <= 0;
//                new_fallen_pieces[215] <= 0;
//                // Shift down all rows above the cleared row
//                if (remove_row_y > 0)  new_fallen_pieces[10 +: 10] <= fallen_pieces[0 +: 10];
//                if (remove_row_y > 1)  new_fallen_pieces[20 +: 10] <= fallen_pieces[10 +: 10];
//                if (remove_row_y > 2)  new_fallen_pieces[30 +: 10] <= fallen_pieces[20 +: 10];
//                if (remove_row_y > 3)  new_fallen_pieces[40 +: 10] <= fallen_pieces[30 +: 10];
//                if (remove_row_y > 4)  new_fallen_pieces[50 +: 10] <= fallen_pieces[40 +: 10];
//                if (remove_row_y > 5)  new_fallen_pieces[60 +: 10] <= fallen_pieces[50 +: 10];
//                if (remove_row_y > 6)  new_fallen_pieces[70 +: 10] <= fallen_pieces[60 +: 10];
//                if (remove_row_y > 7)  new_fallen_pieces[80 +: 10] <= fallen_pieces[70 +: 10];
//                if (remove_row_y > 8)  new_fallen_pieces[90 +: 10] <= fallen_pieces[80 +: 10];
//                if (remove_row_y > 9)  new_fallen_pieces[100 +: 10] <= fallen_pieces[90 +: 10];
        
//                // Ensure fallen_pieces for the top-most row is cleared if it is the top-most row
//                if (remove_row_y == 10) new_fallen_pieces[100 +: 10] <= 0;
//            end
    
        
        if(move_it_left && (keycode != last_keycode || key_action_taken)) begin
            if(!collision_detected && current_x_pos > 0)begin
            new_x_pos <= current_x_pos - 1;
            key_action_taken <= 1;
            end
        move_it_left <= 0;
        end
        
        if(rotate_that_shit && (keycode != last_keycode || key_action_taken)) begin
            if(!collision_detected && ((current_x_pos + ctpt_width) < 11)) begin
//            cur_rot
                new_rot <= (cur_rot+1);
            end
        rotate_that_shit <= 0;
        end
        
        if(move_it_right && (keycode != last_keycode || key_action_taken)) begin
            if(!collision_detected && (current_x_pos + test_width < 10) )begin
            new_x_pos <= current_x_pos + 1;
            key_action_taken <= 1;
            end
        move_it_right <= 0;
        end
        
//        if(remove_that_shit) begin
//            if (shifting_row == 0) begin
//                new_fallen_pieces[0 +: 10] <= 0;
//            end else begin
//                new_fallen_pieces[shifting_row*10 +: 10] <= fallen_pieces[(shifting_row - 1)*10 +: 10];
//                shifting_row <= shifting_row - 1;
//            end
//        end
        if(drop_mode) begin
            if(!collision_detected) begin
                move_it_down<=1;
            end
        end
        
        
        
        if(move_it_down) begin
            if(!collision_detected) begin
                new_y_pos <= current_y_pos + 1;
            end
            else if(collision_detected && keycode != 8'h50 && keycode != 8'h4F)begin
                intersection_bottom <= 1;
                new_fallen_pieces[test_blk_1] <= 1;
                new_fallen_pieces[test_blk_2] <= 1;
                new_fallen_pieces[test_blk_3] <= 1;
                new_fallen_pieces[test_blk_4] <= 1;
                drop_mode<=0;
            end
//            else begin
////                new_y_pos <= 0;
//                intersection_bottom <= 1;
//                new_fallen_pieces[test_blk_1] <= 1;
//                new_fallen_pieces[test_blk_2] <= 1;
//                new_fallen_pieces[test_blk_3] <= 1;
//                new_fallen_pieces[test_blk_4] <= 1;
//            end
        move_it_down <= 0;
        end
        

//        else if(remove_row_en) begin
//            shifting_row <= remove_row_y;
//        end
        
        
        
    end
    
//    if (intersection_bottom) begin
//        new_fallen_pieces[test_blk_1] <= 1;
//        new_fallen_pieces[test_blk_2] <= 1;
//        new_fallen_pieces[test_blk_3] <= 1;
//        new_fallen_pieces[test_blk_4] <= 1;
//    end

    
//    if(collision_detected) begin
//        fallen_pieces[cur_blk_1] <= 1;
//        fallen_pieces[cur_blk_2] <= 1;
//        fallen_pieces[cur_blk_3] <= 1;
//        fallen_pieces[cur_blk_4] <= 1;
//    end
end


endmodule

