`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy
// Engineer: Eyiara Oladipo, Benyamain Yacoob, Andre Price
// 
// Create Date: 03/28/2024 01:35:43 PM
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


module stopwatch (
    input logic clk_100MHz,
    input logic start, stop, reset,
    output logic [3:0] digit0, digit1, digit2, digit3
);

    // Synchronize and debounce inputs
    logic start_sync, stop_sync, reset_sync;
    sync_debounce sync_debounce_start (.clk(clk_100MHz), .btn(start), .btn_sync(start_sync));
    sync_debounce sync_debounce_stop (.clk(clk_100MHz), .btn(stop), .btn_sync(stop_sync));
    sync_debounce sync_debounce_reset (.clk(clk_100MHz), .btn(reset), .btn_sync(reset_sync));

    // Generate 10 Hz clock for 0.1 second increment
    logic clk_10Hz;
    logic [26:0] counter_10Hz;
    always_ff @(posedge clk_100MHz) begin
        if (counter_10Hz == 27'd5_000_000) begin
            counter_10Hz <= 0;
            clk_10Hz <= ~clk_10Hz;
        end else begin
            counter_10Hz <= counter_10Hz + 1;
        end
    end

    // Stopwatch counter
    logic [19:0] counter_stopwatch;
    logic running;
    always_ff @(posedge clk_10Hz or posedge reset_sync) begin
        if (reset_sync) begin
            counter_stopwatch <= 0;
            running <= 0;
        end else if (start_sync) begin
            running <= 1;
        end else if (stop_sync) begin
            running <= 0;
        end else if (running) begin
            if (counter_stopwatch == 20'd600_000) begin
                counter_stopwatch <= 0;
            end else begin
                counter_stopwatch <= counter_stopwatch + 1;
            end
        end
    end

    // Decode counter_stopwatch to display digits
    assign digit0 = counter_stopwatch % 10; // Tenths of a second
    assign digit1 = (counter_stopwatch / 10) % 60; // Seconds
    assign digit2 = (counter_stopwatch / 600) % 60; // Tens of seconds
    assign digit3 = counter_stopwatch / 36000; // Minutes

endmodule