`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy
// Engineer: Benyamain Yacoob
// 
// Create Date: 03/14/2024 12:42:28 AM
// Design Name: gates
// Module Name: gates
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

// The error is that the module has two inputs a and b that are each 4-bit vectors, but the always block treats them as single bits.
// To fix the error, see below.

module gates(input logic [3:0] a, b,
    output logic [3:0] y1, y2, y3, y4, y5
    );

    always @(a or b)  // Sensitive to changes in any bit of a or b.
    begin
        y1 = a & b;
        y2 = a | b;
        y3 = a ^ b;
        y4 = ~({1'b0, a} & {1'b0, b});  // Concatenation for negation.
        y5 = ~({1'b0, a} | {1'b0, b});
    end
  
endmodule