`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2024 01:48:23 PM
// Design Name: 
// Module Name: game_display_tb
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


module game_display_tb();
     logic[8:0] digit_data;
     logic [3:0] Anode_Activate;
     logic [6:0] LED_out;

    game_display DUT(
        .digit_data(digit_data),
        .Anode_Activate(Anode_Activate), 
        .LED_out(LED_out)
    );
    
    initial begin
        digit_data = 9'b000000001; //Start in the cave of cacophony
        #50;
        
        digit_data = 9'b000000010; //Move to twisty tunnel
        #50;
        
        digit_data = 9'b000000100; //Go down to rapid river
        #50;
        
        digit_data = 9'b000001000; //Enter the sword stash
        #50;
        
        digit_data = 9'b000000100; //Return to rapid river
        #50;
        
        digit_data = 9'b000010000; //Enter the dragon's den
        #50;        
        $finish;
    end

endmodule
