`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2024 06:43:36 PM
// Design Name: 
// Module Name: test4sub
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


module test4sub();
    logic [3:0] a;  logic [3:0] b;   logic Subtract;
    
    //Outputs
    logic [3:0] result;  logic carry;
    
    logic clk, reset; integer i;
    
    addSub4 DUT(
    .av(a),
    .bv(b),
    .M(Subtract),
    .resultv(result),
    .cout(carry)
    );
    
    initial begin
        a = 0;
        b = 0;
        Subtract = 0;
        #5
        
        for(i=0; i<4; i=i+1) begin
            #1 a = a + 11; b = b + 15;
        end
        
        #5 Subtract = 1; a = 50; b = 10;
        for(i=0; i<4; i=i+1) begin
            #1 a = a - 10; b = b + 10;
        end
        #5 $finish;
    end
    initial begin
        $timeformat(-9, 2, " ns", 10);
        $monitor("At time %t: a=%d, b=%d, Subtract=%b, ToBorNotToB=%b, carry = %b Result=%d (%b)",
        $time , a, b, Subtract, DUT.ToBorNotToB, carry, result, result);
    end       
endmodule
