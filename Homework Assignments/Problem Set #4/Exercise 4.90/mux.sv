`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy
// Engineer: Benyamain Yacoob
// 
// Create Date: 03/13/2024 07:24:32 PM
// Design Name: mux8
// Module Name: mux8
// Project Name: hw_pset_4
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

// Dataflow
module mux8(
    input logic [2:0] s,
    input logic d0, d1, d2, d3, d4, d5, d6, d7,
    output logic y
    );

    // Temporary wires to hold intermediate values from the smaller mux where each wire represents the output of a 2:1 mux.
    logic tmp1, tmp2, tmp3;

    // First stage multiplexers chosen based on least significant select line vector s[1].
    assign tmp1 = (s[1] == 1'b0) ? d0 : d4; // Single bit binary constant value of binary zero; constant value of zero with width of 1-bit.
    assign tmp2 = (s[1] == 1'b0) ? d1 : d5;
    assign tmp3 = (s[1] == 1'b0) ? d2 : d6;

    // Second stage multiplexer takes output from the top.
    assign y = (s[2] == 1'b0) ? tmp1 : tmp2;

    // Third stage multiplexer (implicit).
    // Final selection is done by assigning y to tmp3 when s[2] is high.
    
endmodule