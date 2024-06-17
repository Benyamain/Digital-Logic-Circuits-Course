`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy
// Engineer: Eyiara Oladipo, Benyamain Yacoob, Andre Price
// 
// Create Date: 03/28/2024 01:37:12 PM
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


module tb_stopwatch;
  logic clk_100MHz, reset, start, stop;
  logic [3:0] digit0, digit1, digit2, digit3; // 4-digit display

  stopwatch dut (.clk_100MHz(clk_100MHz), .reset(reset), .start(start), .stop(stop), .digit0(digit0), .digit1(digit1), .digit2(digit2), .digit3(digit3));
  
  logic [15:0] digit_disp = {digit0, digit1, digit2, digit3};

  initial begin
    clk_100MHz = 0;
    forever #5 clk_100MHz = ~clk_100MHz; // 100 MHz clock
  end

  initial begin
    reset = 1;
    start = 0;
    stop = 0;
    #20 reset = 0;

    // Test reset condition
    assert (digit_disp[3] == 0 && digit_disp[2] == 0 && digit_disp[1] == 0 && digit_disp[0] == 0) else $error("Reset condition failed");
    $display("Time: %0t, Displayed Value: %d%d.%d%d", $time, digit_disp[3], digit_disp[2], digit_disp[1], digit_disp[0]);

    // Test start and stop
    start = 1;
    #20 start = 0;
    repeat (100) @(posedge clk_100MHz);
    assert (digit_disp[3] == 0 && digit_disp[2] == 0 && digit_disp[1] == 0 && digit_disp[0] > 0) else $error("Start failed");
    $display("Time: %0t, Displayed Value: %d%d.%d%d", $time, digit_disp[3], digit_disp[2], digit_disp[1], digit_disp[0]);

    stop = 1;
    #20 stop = 0;
    repeat (100) @(posedge clk_100MHz);
    assert (digit_disp[3] == 0 && digit_disp[2] == 0 && digit_disp[1] == 0 && digit_disp[0] > 0) else $error("Stop failed");
    $display("Time: %0t, Displayed Value: %d%d.%d%d", $time, digit_disp[3], digit_disp[2], digit_disp[1], digit_disp[0]);

    start = 1;
    #20 start = 0;
    repeat (1000) @(posedge clk_100MHz);
    assert (digit_disp[3] == 0 && digit_disp[2] > 0 && digit_disp[1] > 0 && digit_disp[0] > 0) else $error("Counting failed");
    $display("Time: %0t, Displayed Value: %d%d.%d%d", $time, digit_disp[3], digit_disp[2], digit_disp[1], digit_disp[0]);

    // Test reset
    assert (digit_disp[3] == 0 && digit_disp[2] == 0 && digit_disp[1] == 0 && digit_disp[0] == 0) else $error("Reset failed");
    $display("Time: %0t, Displayed Value: %d%d.%d%d", $time, digit_disp[3], digit_disp[2], digit_disp[1], digit_disp[0]);

    $finish;
  end
endmodule