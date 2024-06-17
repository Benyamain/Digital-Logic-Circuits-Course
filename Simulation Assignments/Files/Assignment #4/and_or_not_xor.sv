`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy
// Engineer: Andre Price, Benyamain Yacoob, Ara Oladipo
// 
// Create Date: 02/16/2024 07:41:57 PM
// Design Name: and_or_not_xor_schematic
// Module Name: and_or_not_xor
// Project Name: Simulation Assignment 4
// Target Devices: N/A
// Tool Versions: N/A
// Description: Create AND, OR, NOT, and XOR gates
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module and_or_not_xor(
    input logic A, B, C,
    output logic outAND, outOR, outXOR, notC
);
    assign outAND = A & B;
    assign outOR = A | B;
    assign outXOR = A ^ B;
    assign notC = ~C;

endmodule
