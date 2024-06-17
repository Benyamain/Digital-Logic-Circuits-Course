`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy  
// Engineer: Benyamain Yacoob, Andre Price, Eyiara Oladipo
// 
// Create Date: 03/09/2024 02:16:28 PM
// Design Name: adder_sub_decoder
// Module Name: adder_sub_decoder
// Project Name: Simulation_Assignment_5.5
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

module adder_sub_decoder(input logic [3:0] A, input logic [3:0] B);
    logic [6:0] D;
    logic [3:0] Anode_Activate;
    logic Subtract = 0;
    logic clk;
    logic reset;
    logic [4:0] S;    // Outputs
    
    addSub4 AddSub(
    .av(A),
    .bv(B),
    .M(Subtract),
    .resultsv(S[3:0]),
    .cout(S[4]));
    
    sevenseg Decoder(
    .data(S[3:0]),
    .segments(D[6:0]),
    .Anode_Activate(Anode_Activate));
endmodule