`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2024 03:48:13 PM
// Design Name: 
// Module Name: tb_adder4bit
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


module tb_adder4bit();
    // Inputs
    logic [3:0] a;  logic [3:0] b;
    
    // Outputs
    logic [3:0] sum;  logic cin, carry;  logic clk, reset;
     //vars
    integer i;
    
    adder4bit DUT(
        .av(a),
        .bv(b),
        .sumv(sum),
        .cout(carry),
        .cin(cin)
    );
    
    always begin
        clk = 1; #20; clk = 0; #20;
    end
    
    initial begin
        a = 0;
        b = 0;
        cin = 0;
    end
    
    initial begin
        $monitor("a(%b) + b(%b)  = carry sum(%b %b)", a, b, carry, sum );
    end
    
    always begin
        for( i=0; i< 16 * 16; i = i + 1) begin
            {a, b} = i;
            #20 if(a + b != {carry ,sum})
                $display(" *ERROR* ");
       end
       $display("%d test completed", i);
       #20 $stop;
    end
endmodule
