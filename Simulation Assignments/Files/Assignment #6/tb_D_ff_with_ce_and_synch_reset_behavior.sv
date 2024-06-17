`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy
// Engineer: Benyamain Yacoob, Eyiara Oladipo, Andre Price
// 
// Create Date: 03/15/2024 08:24:51 PM
// Design Name: tb_D_ff_with_ce_and_synch_reset_behavior
// Module Name: tb_D_ff_with_ce_and_synch_reset_behavior
// Project Name: Simulation Assignment #6
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


module tb_D_ff_with_ce_and_synch_reset_behavior();

    logic D = 0, Clk = 0, reset = 0, ce = 0;
    logic Q = 0;
    
    D_ff_with_ce_and_synch_reset_behavior dffcesrb(
        .D(D),
        .Clk(Clk),
        .reset(reset),
        .ce(ce),
        .Q(Q)
        );
        
    // Reverse the clock to be on or off
    always #10 Clk = ~Clk;
        
    initial begin
        #20;
        D = 1;
        
        #40
        ce = 1;
        #20
        ce = 0;
        #60
        D = 0;       
        #20
        ce = 1;
        #10;
        D = 0;
        ce = 0;
        #15;
        ce = 1;
        #15;
        reset = 1;
        ce = 0;
        #30;
        D = 1;
        reset = 0;
        ce = 0;
        #10
        ce = 1;
        #80
        ce = 0;
        
        $monitor("D = %d, Clk = %d, reset = %d, ce = %d, Q = %d", D, Clk, reset, ce, Q);
        #100 $finish;
    end

endmodule