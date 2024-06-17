`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy
// Engineer: Eyiara Oladipo, Benyamain Yacoob, Andre Price
// 
// Create Date: 03/27/2024 10:14:48 PM
// Design Name: 
// Module Name: sync_debounce
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


module sync_debounce (
    input logic clk, btn,
    output logic btn_sync
);

    // Synchronize input
    logic btn_sync1, btn_sync2;
    always_ff @(posedge clk) begin
        btn_sync1 <= btn;
        btn_sync2 <= btn_sync1;
    end

    // Debounce
    logic [19:0] counter;
    logic btn_debounced;
    always_ff @(posedge clk) begin
        if (!btn_sync2) begin
            counter <= 0;
            btn_debounced <= 0;
        end else if (counter == 20'd500_000) begin // 5 ms at 100 MHz
            btn_debounced <= 1;
        end else begin
            counter <= counter + 1;
        end
    end

    // Generate single pulse
    logic btn_pulse;
    always_ff @(posedge clk) begin
        btn_pulse <= btn_debounced && !btn_sync;
    end

    assign btn_sync = btn_pulse;

endmodule