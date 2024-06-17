`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2024 06:35:43 PM
// Design Name: 
// Module Name: adder4bit
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


module adder4bit(
    input logic [3:0] av, bv,
    input logic cin,
    output logic [3:0] sumv,
    output logic cout
    );
    logic cout1, cout2, cout3;
    
    fulladder a0(
    .a(av[0]),
    .b(bv[0]),
    .cin(cin),
    .s(sumv[0]),
    .cout(cout1)
    );
    
    fulladder a1(
    .a(av[1]),
    .b(bv[1]),
    .cin(cout1), //We piped the output of the previous adder into this adder, along with the subsequent adders
    .s(sumv[1]),
    .cout(cout2)
    );
    
    fulladder a2(
    .a(av[2]),
    .b(bv[2]),
    .cin(cout2),
    .s(sumv[2]),
    .cout(cout3)
    );
    
    fulladder a3(
    .a(av[3]),
    .b(bv[3]),
    .cin(cout3),
    .s(sumv[3]),
    .cout(cout) //The final output goes to cout
    );
endmodule
