`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Andre Price, Benyamain Yacoob, Eyiara Oladipo
// 
// Create Date: 03/15/2024 05:35:34 PM
// Design Name: 
// Module Name: SR_latch_dataflow
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


module SR_latch_dataflow(
    input logic R, S,
    output logic Q, Qbar
    );
    assign #2 Q = ~(R | Qbar);
    assign #2 Qbar = ~(S | Q);
endmodule
