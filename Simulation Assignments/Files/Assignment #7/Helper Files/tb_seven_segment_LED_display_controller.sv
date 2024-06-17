`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy
// Engineer: Benyamain Yacoob, Ara Oladipo, Andre Price
// 
// Create Date: 03/26/2024 02:28:44 PM
// Design Name: 
// Module Name: tb_seven_segment_led_display_controller
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

module tb_seven_segment_led_display_controller();
logic clk, reset;
logic [3:0] anode_bits;
logic [6:0] seven_segments;
logic [3:0] ones_digit, tens_digit, hundreds_digit, thousands_digit;

seven_segment_LED_display_controller dut(.clk_100_Mhz(clk), .reset(reset), .anode_bits(anode_bits), .seven_segments_LED_output(seven_segments), .four_bit_output_register_ones_digit(ones_digit), .four_bit_output_register_tens_digit(tens_digit), .four_bit_output_register_hundreds_digit(hundreds_digit), .four_bit_output_register_thousands_digit(thousands_digit));

initial begin
    clk = 0;
forever
    #10 clk = ~clk;
end

initial begin
reset = 0;
#10;
reset = 1;
#10;
reset = 0;
#500;
reset = 1;
#100;
reset = 0;
#10;
end

    // Monitor outputs
    initial begin
    $monitor("Time: %0t, Ones Digit: %d, Tens Digit: %d, Hundreds Digit: %d, Thousands Digit: %d, Anode Bits: %b, Segment: %b", $time, ones_digit, tens_digit, hundreds_digit, thousands_digit, anode_bits, seven_segments);
end
endmodule