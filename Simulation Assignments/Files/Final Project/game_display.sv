`timescale 1ns / 1ps

module game_display(
//    input logic clock, reset, // 100 Mhz clock source on Basys 3 FPGA
    input logic[8:0] digit_data,
    output logic [3:0] Anode_Activate, // anode signals of the 7-segment LED display
    output logic [6:0] LED_out// cathode patterns of the 7-segment LED display
    );
    
    enum logic [8:0] {
        CAVE_OF_CACOPHONY  = 9'b000000001,
        TWISTY_TUNNEL      = 9'b000000010,
        RAPID_RIVER        = 9'b000000100,
        SECRET_SWORD_STASH = 9'b000001000,
        DRAGONS_DEN        = 9'b000010000,
        VICTORY_VAULT      = 9'b000100000,
        GRIEVOUS_GRAVEYARD = 9'b001000000,
        DRAGONS_DEPARTURE  = 9'b010000000,
        WIZARD_CHAMBER     = 9'b100000000
  } current_state, next_state;
  
    //Activate only the last LED
    assign Anode_Activate = 4'b1110;

    // Cathode patterns of the 7-segment LED display 
    always_comb
    begin
        case(digit_data)
        CAVE_OF_CACOPHONY: LED_out = 7'b0110011; // "C"     
        TWISTY_TUNNEL: LED_out = 7'b0111001; // "t" 
        RAPID_RIVER: LED_out = 7'b0001000; // "R" 
        SECRET_SWORD_STASH: LED_out = 7'b0100100; // "S" 
        DRAGONS_DEN: LED_out = 7'b1000010; // "D" 
        VICTORY_VAULT: LED_out = 7'b1000001; // "V" 
        GRIEVOUS_GRAVEYARD: LED_out = 7'b0100000; // "G" 
        DRAGONS_DEPARTURE: LED_out = 7'b1000001; // "V" 
        WIZARD_CHAMBER: LED_out = 7'b1100011; // "W"     
        default: LED_out = 7'b0000001; // "0"
        endcase
    end
 endmodule