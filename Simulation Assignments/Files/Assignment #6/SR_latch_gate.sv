`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2024 05:44:47 PM
// Design Name: 
// Module Name: SR_latch_gate
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

    
module SR_latch_gate(
    input R,
    input S,
    output Q,
    output Qbar
    );
    
    nor(Q, R, Qbar);
    nor(Qbar, S, Q);

endmodule
