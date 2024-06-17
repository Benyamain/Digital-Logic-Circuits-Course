`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy
// Engineer: Benyamain Yacoob
// 
// Create Date: 03/14/2024 12:58:39 AM
// Design Name: mux2
// Module Name: mux2
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

// The error is that the code uses logic [3:0] y for the output. While this specifies a 4-bit logic vector,
// it's not compatible with the assignment statements within the always block.
// To fix the error, see below.

module mux2(
    input logic [3:0] d0, d1,
    input logic s,
    output logic y
    );

    always @(posedge s)
        begin
            if (s)
                begin
                    y = d1;
                end
            else
                begin
                    y = d0;
                end
        end

endmodule