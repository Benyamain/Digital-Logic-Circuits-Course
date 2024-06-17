`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of  Detroit Mercy
// Engineer: Benyamain Yacoob, Eyiara Oladipo, Andre Price
// 
// Create Date: 03/15/2024 08:20:30 PM
// Design Name: D_ff_with_ce_and_synch_reset_behavior
// Module Name: D_ff_with_ce_and_synch_reset_behavior
// Project Name: Simulation Assignment #6
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


module D_ff_with_ce_and_synch_reset_behavior(
    input logic D, Clk, reset, ce,
    output logic Q
    );
    
    always_ff @(posedge Clk)
        if (reset) begin
            Q <= 1'b0;
        end else if (ce) begin
            Q <= D;
        end
    
endmodule