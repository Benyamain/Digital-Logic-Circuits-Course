`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy
// Engineer: Eyiara Oladipo, Benyamain Yacoob, Andre Price
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

module seven_segment_controller_tb;

    // Inputs
    logic clk_100MHz;
    logic reset;

    // Outputs
    logic [3:0] anode;
    logic [6:0] segment;

    // Output for debugging
    logic [3:0] led_bcd;
    logic [15:0] led_counter;

    // Instantiate the Unit Under Test (UUT)
    seven_segment_controller uut (
        .clk_100MHz(clk_100MHz),
        .reset(reset),
        .anode(anode),
        .segment(segment)
    );

    // Clock generation
    always begin
        clk_100MHz = 1'b0;
        #5; // For 100 MHz clock, half period is 5 ns
        clk_100MHz = 1'b1;
        #5;
    end

    // Reset pulse
    initial begin
        reset = 1'b1;
        #10;
        reset = 1'b0;
    end

    // Assign outputs for debugging
    assign led_bcd = uut.digit;
    assign led_counter = uut.counter;

    // Monitor outputs
    initial begin
        $monitor("Time: %0t, Digit: %d, Counter: %d, Anode: %b, Segment: %b", $time, led_bcd, led_counter, anode, segment);
    end

    // Run simulation for a longer period
    initial begin
        #10_000_000; // 10 ms
        $finish;
    end

endmodule