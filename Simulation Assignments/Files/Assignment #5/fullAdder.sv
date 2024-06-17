`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2024 01:38:30 PM
// Design Name: 
// Module Name: fulladder
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


module fulladder(input logic a, b, cin, output logic s, cout);
    logic p, g;
    always_comb begin
        p = a ^ b; //blocking
        g = a & b; //blocking
        
        s = p ^ cin; //blockking
        cout = g | (p & cin); //blocking 
    end
endmodule
