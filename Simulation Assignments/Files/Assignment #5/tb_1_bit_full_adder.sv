`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2024 05:43:02 PM
// Design Name: 
// Module Name: tb_1_bit_full_adder
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


module tb_1_bit_full_adder();
    logic A, B, Cin, Sum, Cout;
    
    fulladder myfulladder(
    .a(A),
    .b(B),
    .cin(Cin),
    .s(Sum),
    .cout(Cout)
   );
   
   initial begin
    A = 0;
    B = 0;
    Cin = 0;
    
    //Waiting 20s based on the rubric
    #20 
    
    //Inputs changnig every 20ns going from 000 to 
    #20 {A, B, Cin} = 3'b001;
    #20 {A, B, Cin} = 3'b010;
    #20 {A, B, Cin} = 3'b011;
    #20 {A, B, Cin} = 3'b100;
    #20 {A, B, Cin} = 3'b101;
    #20 {A, B, Cin} = 3'b110;
    #20 {A, B, Cin} = 3'b111;
    #20 $finish;
    end
 endmodule
