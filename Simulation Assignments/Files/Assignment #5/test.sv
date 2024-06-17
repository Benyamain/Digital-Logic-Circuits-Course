`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Univerity of Detroit Mercy
// Engineer: Andre Price, Eyiara Oladipo, Benyamain Yacoob
// 
// Create Date: 02/22/2024 05:20:17 PM
// Design Name: 1 full-bit adder implementation 3
// Module Name: 
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


module test(input logic a, b, cin, output logic s, cout );
    always_comb begin
        {cout, s} = a + b + cin;
    end
endmodule
