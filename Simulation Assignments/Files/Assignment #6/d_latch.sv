`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2024 07:31:43 PM
// Design Name: 
// Module Name: d_latch
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

//Gated D latch based on a NOT(SR) NAND latch
module d_latch(
    input logic D, E, Clk,
    output logic Q, Qbar, S, R
    );
    
    logic internalD, internalE;
    
    //5.6.1
    always_ff @(D) begin
         internalD <= ~(E & D);
         internalE <= ~(E & internalD);
        
         Q <= ~(internalD & Qbar);
         Qbar <= ~(internalE & Q);
    end
    
    logic I1, I2, I3, I4;
    //Positive edge triggered flipflop
    always_ff @(posedge Clk) begin
        I2 <= ~(Clk & I1); 
        I3 <= ~(I3 )
    end
endmodule
