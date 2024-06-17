`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2024 07:55:02 PM
// Design Name: 
// Module Name: Gated_SR_latch
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


module Gated_SR_latch(
    input logic R, E, S,
    output logic Q, Qbar
    );
    
    logic internalS, internalR;
    
    assign internalS = E & S;
    assign internalR = E & R;
    
    assign #2 Q = ~(internalR | Qbar);
    assign #2 Qbar = ~(internalS | Q);
endmodule
