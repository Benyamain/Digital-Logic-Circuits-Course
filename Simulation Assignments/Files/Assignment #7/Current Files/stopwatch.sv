`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy
// Engineer: Benyamain Yacoob, Ara Oladipo, Andre Price
// 
// Create Date: 03/29/2024 04:33:33 PM
// Design Name: 
// Module Name: stopwatch
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

module stopwatch(
    input logic clk, 
    input logic reset, 
    input logic start, 
    output logic [3:0] anode_bits, 
    output logic [7:0] seven_segments_LED_output,
    output logic [3:0] LED_binary_coded_decimal,
    output logic [15:0] HEX_display_digits
);

    seven_segment_LED_display_controller seven_segment_display(
    .clk_100_Mhz(clk), 
    .reset(reset), 
    .anode_bits(anode_bits),
    .seven_segments_LED_output(seven_segments_LED_output),
    .LED_binary_coded_decimal(LED_binary_coded_decimal),
    .HEX_display_digits(HEX_display_digits));

    // Instantiate debounce modules for start and reset buttons
    debounce start_btn(
        .clk(clk),
        .negated_reset(1),
        .btn_input(start),
        .debounce_output(d_start));

    debounce reset_btn(
        .clk(clk),
        .negated_reset(1),
        .btn_input(reset),
        .debounce_output(d_reset));

endmodule