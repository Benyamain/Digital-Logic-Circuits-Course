`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy
// Engineer: Benyamain Yacoob
// 
// Create Date: 03/13/2024 11:29:28 PM
// Design Name: truth_table
// Module Name: truth_table
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


module truth_table(
  input logic A,
  input logic B,
  input logic C,
  input logic D,
  output logic Y
  );

    // Combine terms from the minimized equation that was given by Exercise 2.28.
    logic term1 = A & C;
    logic term2 = A & B;
    logic term3 = ~A & ~D;

    // Output based on combined terms.
    assign Y = term1 | term2 | term3;

endmodule