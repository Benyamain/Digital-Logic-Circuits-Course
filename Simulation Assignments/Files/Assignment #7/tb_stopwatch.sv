`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy
// Engineer: Benyamain Yacoob, Ara Oladipo, Andre Price
// 
// Create Date: 03/29/2024 06:13:20 PM
// Design Name: 
// Module Name: tb_stopwatch
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

module tb_stopwatch();

    // Declare testbench signals
    logic clk;
    logic reset, start;
    logic [3:0] anode_bits;
    logic [6:0] seven_segments;
    logic [3:0] ones_digit, tens_digit, hundreds_digit, thousands_digit;
    logic [3:0] LED_binary_coded_decimal;
    logic [15:0] HEX_display_digits;

    // Instantiate the stopwatch module
    stopwatch dut(
        .clk(clk),
        .reset(reset),
        .start(start),
        .anode_bits(anode_bits),
        .seven_segments_LED_output(seven_segments),
        .LED_binary_coded_decimal(LED_binary_coded_decimal),
        .HEX_display_digits(HEX_display_digits));
    
    assign ones_digit = HEX_display_digits[3:0];
    assign tens_digit = HEX_display_digits[7:4];
    assign hundreds_digit = HEX_display_digits[11:8];
    assign thousands_digit = HEX_display_digits[15:12];

    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    // Reset sequence
    initial begin
        reset = 0;
        start = 1;
        #10;
        reset = 1;
        start = 0;
        #10;
        reset = 0;
        start = 1;
        #500;
        reset = 1;
        start = 0;
        #100;
        reset = 0;
        start = 1;
        #10;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0t, Start: %b, Reset: %b, Ones Digit: %d, Tens Digit: %d, Hundreds Digit: %d, Thousands Digit: %d, Anode Bits: %b, Segment: %b", $time, start, reset, ones_digit, tens_digit, hundreds_digit, thousands_digit, anode_bits, seven_segments);
    end

endmodule