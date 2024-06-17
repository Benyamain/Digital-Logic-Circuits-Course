`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy
// Engineer: Benyamain Yacoob, Eyiara Oladipo, Andre Price
// 
// Create Date: 03/15/2024 06:23:33 PM
// Design Name: D_ff_behavior
// Module Name: D_ff_behavior
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


module D_ff_behavior(
    input logic D, Clk,
    output reg Q_lat, Q_pos, Q_neg
    );
    
    always_ff @(Clk, D) begin
        if (Clk == 1)
            Q_lat <= D;
    end
    
    always_ff @(posedge Clk) begin
        Q_pos <= D;
    end
    
    always_ff @(negedge Clk) begin
        Q_neg <= D;
    end
    
endmodule