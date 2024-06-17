`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy
// Engineer: Eyiara Oladipo, Benyamain Yacoob, Andre Price
// 
// Create Date: 03/28/2024 01:17:16 PM
// Design Name: 
// Module Name: tb_debounce
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


module tb_debounce;
  logic btn, clk, btn_sync;

  sync_debounce dut (.btn(btn), .clk(clk), .btn_sync(btn_sync));

  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100 MHz clock
  end

  initial begin
    btn = 0;
    $monitor("Time: %0t, btn: %b, btn_sync: %b", $time, btn, btn_sync);

    #20 btn = 1; // Single press
    #40 btn = 0;
    @(posedge btn_sync) assert(btn_sync) else $error("Single press failed");
    @(negedge btn_sync) assert(~btn_sync) else $error("Single press failed");

    #100 btn = 1; // Multiple bounces
    #5 btn = 0;
    #10 btn = 1;
    #20 btn = 0;
    #30 btn = 1;
    #40 btn = 0;
    @(posedge btn_sync) assert(btn_sync) else $error("Multiple bounces failed");
    @(negedge btn_sync) assert(~btn_sync) else $error("Multiple bounces failed");

    $finish;
  end
endmodule