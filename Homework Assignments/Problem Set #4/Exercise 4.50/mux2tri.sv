`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy
// Engineer: Benyamain Yacoob
// 
// Create Date: 03/14/2024 01:25:04 AM
// Design Name: mux2tri
// Module Name: mux2tri
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

// The error is that t0 and t1 attempt to drive the same output y. This creates an issue
// where both tri-state buffers might be trying to control the output at the same time, which sounds dangerous (potential undefined behavior).

module mux2tri(
    input logic [3:0] d0, d1,
    input logic s,
    output logic [3:0] y
    );
    
    assign y = s ? d1 : d0;
    
endmodule