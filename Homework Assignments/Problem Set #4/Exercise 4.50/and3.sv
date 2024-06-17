`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy
// Engineer: Benyamain Yacoob
// 
// Create Date: 03/14/2024 01:37:21 AM
// Design Name: and3
// Module Name: and3
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

// The error is that the assignment operator used in the always block is incorrect. Within an always block, the continuous assignment operator (=)
// should be used instead of the nonblocking assignment operator(<=).

module and3(
    input logic a, b, c,
    output logic y
    );
    
    always @(a, b, c)
        begin
            y = a & b & c;  // Combine all inputs.
        end
    
endmodule