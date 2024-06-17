`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy
// Engineer: Benyamain Yacoob, Ara Oladipo, Andre Price
// 
// Create Date: 03/26/2024 02:13:10 PM
// Design Name: 
// Module Name: seven_segment_LED_display_controller
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

module seven_segment_LED_display_controller(
    input logic clk_100_Mhz, 
    input logic reset, 
    output logic [3:0] anode_bits,
    output logic [6:0] seven_segments_LED_output,
    output logic [3:0] LED_binary_coded_decimal,
    output logic [15:0] HEX_display_digits
);

    // Declare variables
    logic [19:0] refresh_the_counter;
    logic [1:0] activate_the_LED_counter;
    logic one_second_is_enabled, one_second_counter;
    
    always @(posedge clk_100_Mhz, posedge reset)
    begin
        if(reset == 1)
            one_second_counter <= 0;
        else begin
            if(one_second_counter >= 1) 
                 one_second_counter <= 0;
            else
                one_second_counter <= one_second_counter + 1;
        end
    end 
    
    assign one_second_is_enabled = (one_second_counter == 1) ? 1 : 0;
    // Counter logic
    always @(posedge clk_100_Mhz, posedge reset) begin
        if (reset == 1)
            HEX_display_digits <= 0;
        else if (one_second_is_enabled == 1)
            HEX_display_digits <= HEX_display_digits + 1;
    end

    // Counter refresh logic
    always @(posedge clk_100_Mhz, posedge reset) begin 
        if (reset == 1)
            refresh_the_counter <= 0;
        else
            refresh_the_counter <= refresh_the_counter + 1;
    end

    assign activate_the_LED_counter = refresh_the_counter[2:1];
    assign four_bit_output_register_thousands_digit = HEX_display_digits / 1000;
    assign four_bit_output_register_hundreds_digit = (HEX_display_digits % 1000) / 100;
    assign four_bit_output_register_tens_digit = ((HEX_display_digits % 1000) % 100) / 10;
    assign four_bit_output_register_ones_digit = ((HEX_display_digits % 1000) % 100) % 10;
    
    // Assign outputs based on counter value
    always_comb
    begin
        case(activate_the_LED_counter)
        2'b00: begin
            anode_bits = 4'b0111; 
            LED_binary_coded_decimal = four_bit_output_register_thousands_digit;
            end
        2'b01: begin
            anode_bits = 4'b1011; 
            LED_binary_coded_decimal = four_bit_output_register_hundreds_digit;
            end
        2'b10: begin
            anode_bits = 4'b1101; 
            LED_binary_coded_decimal = four_bit_output_register_tens_digit;
            end
        2'b11: begin
            anode_bits = 4'b1110; 
            LED_binary_coded_decimal = four_bit_output_register_ones_digit;
            end
        endcase
    end

    // Cathode patterns of the 7-segment LED display 
    always @(*) begin
        case (LED_binary_coded_decimal)
            4'b0000: seven_segments_LED_output = 7'b0000001; // "0"     
            4'b0001: seven_segments_LED_output = 7'b1001111; // "1" 
            4'b0010: seven_segments_LED_output = 7'b0010010; // "2" 
            4'b0011: seven_segments_LED_output = 7'b0000110; // "3" 
            4'b0100: seven_segments_LED_output = 7'b1001100; // "4" 
            4'b0101: seven_segments_LED_output = 7'b0100100; // "5" 
            4'b0110: seven_segments_LED_output = 7'b0100000; // "6" 
            4'b0111: seven_segments_LED_output = 7'b0001111; // "7" 
            4'b1000: seven_segments_LED_output = 7'b0000000; // "8"     
            4'b1001: seven_segments_LED_output = 7'b0000100; // "9" 
            default: seven_segments_LED_output = 7'b0000001; // "0"
        endcase
    end

endmodule