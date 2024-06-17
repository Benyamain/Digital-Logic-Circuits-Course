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

logic clk;
logic reset;
logic start;
logic [3:0] anode_bits;
logic [6:0] seven_segments_LED_output;
logic decimal_point;
logic [3:0] third_hex_digit, second_hex_digit, first_hex_digit, zero_hex_digit, LED_binary_coded_decimal;

update_the_stopwatch dut(.clk_100_Mhz(clk), .reset(reset), .start(start),
.anode_bits(anode_bits), .seven_segments_LED_output(seven_segments_LED_output), .third_hex_digit(third_hex_digit), .second_hex_digit(second_hex_digit), .first_hex_digit(first_hex_digit), .zero_hex_digit(zero_hex_digit), .LED_binary_coded_decimal(LED_binary_coded_decimal), .decimal_point(decimal_point));

initial begin
    clk = 0;
    reset = 1;
    
    #20;
    reset = 0;
    #50;
    start = 1;
end

always #5 clk = ~clk;

initial begin
$timeformat(-9, 2, "ns", 10);
$monitor("time: , third_hex_digit: %d, second_hex_digit: %d, first_hex_digit: %d, zero_hex_digit: %d", $time, third_hex_digit, second_hex_digit, first_hex_digit, zero_hex_digit);
end

initial begin
#5_000_000 $stop;
end

endmodule