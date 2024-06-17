`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy  
// Engineer: Benyamain Yacoob, Andre Price, Eyiara Oladipo
// 
// Create Date: 03/09/2024 03:25:24 PM
// Design Name: 
// Module Name: tb_adder_sub_decoder
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


module tb_adder_sub_decoder();
    logic [3:0] a;  logic [3:0] b;   logic Subtract;
    
    // Outputs
    logic [3:0] result;  logic carry;
    
    logic clk, reset; integer i;
    
    addSub4 DUT(
    .av(a),
    .bv(b),
    .M(Subtract),
    .resultsv(result),
    .cout(carry)
    );
    
    adder_sub_decoder asd(
    .A(a),
    .B(b)
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
            $monitor("At time %t: a=%d, b=%d, Subtract=%b, carry=%b, Result=%h, Segments=%h", $time, a, b, Subtract, carry, result, DUT.ToBorNotToB);
        end
endmodule
