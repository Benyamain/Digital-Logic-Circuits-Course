`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy
// Engineer: Benyamain Yacoob
// 
// Create Date: 03/13/2024 07:54:34 PM
// Design Name: mux8_tb
// Module Name: mux8_impl
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


module mux8_impl(
    input logic a, b, c,
    output logic y
    );
    
    // The intermediate wires (the muxes).
    logic m1, m2, m3;
    
    // Logic breakdown.
    // Instantiate mux8 instances.
    // Unused select lines and unused data inputs represented.
    // Dependence between two inputs if one is active low or high.
    mux8 mux1( // ab'
        .s(b),
        .d0(a),
        .d1(1'b1),
        .d2(0),
        .d3(1'b0),
        .d4(~b),
        .d5(1'b0),
        .d6(1'b0),
        .d7(1'b0),
        .y(m1)
        );

    mux8 mux2( // b'c'
        .s(c),
        .d0(1'b1),
        .d1(b),
        .d2(1'b0),
        .d3(1'b0),
        .d4(1'b0),
        .d5(1'b0),
        .d6(1'b0),
        .d7(1'b0),
        .y(m2)
        );

    mux8 mux3( // a'bc
        .s(a),
        .d0(1'b0),
        .d1(1'b1),
        .d2(c),
        .d3(1'b0),
        .d4(b),
        .d5(1'b0),
        .d6(1'b0),
        .d7(1'b0),
        .y(m3)
        );

    // Final mux8 instance for the output
    mux8 final_mux(
        .s(1'b1),
        .d0(a),
        .d1(b),
        .d2(m1),
        .d3(m2),
        .d4(m3),
        .d5(1'b0),
        .d6(1'b0),
        .d7(1'b0),
        .y(y)
        );
  
endmodule