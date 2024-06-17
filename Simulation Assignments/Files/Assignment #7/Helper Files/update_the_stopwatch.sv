`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy
// Engineer: Benyamain Yacoob, Ara Oladipo, Andre Price
// 
// Create Date: 03/29/2024 04:50:59 PM
// Design Name: 
// Module Name: update_the_stopwatch
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


module update_the_stopwatch(input logic clk_100_Mhz, input logic reset, input logic start, output logic [3:0] anode_bits, output logic [6:0] seven_segments_LED_output, output logic decimal_point, output logic [3:0] zero_hex_digit, first_hex_digit, second_hex_digit, third_hex_digit, LED_binary_coded_decimal);

logic [26:0] tenth_of_a_second_counter;
logic tenth_of_a_second_is_enabled;
logic [19:0] refresh_the_counter;
logic [1:0] activate_the_LED_counter;

always_ff @(posedge clk_100_Mhz)
begin
    if (reset == 1)
        tenth_of_a_second_counter <= 0;
    else begin
        if (tenth_of_a_second_counter >= 9999999)
            tenth_of_a_second_counter <= 0;
    else if (start)
        tenth_of_a_second_counter <= tenth_of_a_second_counter + 1;
    end
end

assign tenth_of_a_second_is_enabled = (tenth_of_a_second_counter == 9999999) ? 1 : 0;

always_ff @(posedge clk_100_Mhz) begin
    if (reset) begin
        third_hex_digit <= 0;
        second_hex_digit <= 0;
        first_hex_digit <= 0;
        zero_hex_digit <= 0;
    end
    else if (tenth_of_a_second_is_enabled) begin
        if (zero_hex_digit == 9)
            begin
                zero_hex_digit <= 0;
                if (first_hex_digit == 9)
                    begin
                        first_hex_digit <= 0;
                if (second_hex_digit == 5)
                    begin
                        second_hex_digit <= 0;
                if (third_hex_digit == 9)
                    third_hex_digit <= 0;
                else
                    third_hex_digit <= third_hex_digit + 1;
                end
                else
                    second_hex_digit <= second_hex_digit + 1;
                end
         else
            first_hex_digit <= first_hex_digit + 1;
         end
         else
            zero_hex_digit <= zero_hex_digit + 1;
         end
    end
    
always_ff @ (posedge clk_100_Mhz) begin
    if (reset == 1)
        refresh_the_counter <= 0;
    else
        refresh_the_counter <= refresh_the_counter + 1;
end

assign activate_the_LED_counter = refresh_the_counter[19:10];

always_comb begin
    case (activate_the_LED_counter)
    2'b00: begin
        anode_bits = 4'b0111;
        LED_binary_coded_decimal = third_hex_digit;
        decimal_point = 1'b1;
        end
    2'b01: begin
        anode_bits = 4'b1011;
        LED_binary_coded_decimal = second_hex_digit;
        decimal_point = 1'b0;
        end
    2'b10: begin
        anode_bits = 4'b1101;
        LED_binary_coded_decimal = first_hex_digit;
        decimal_point = 1'b1;
        end
    2'b11: begin
        anode_bits = 4'b1110;
        LED_binary_coded_decimal = zero_hex_digit;
        decimal_point = 1'b0;
        end
     endcase
end

always_comb begin
    case(LED_binary_coded_decimal)
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