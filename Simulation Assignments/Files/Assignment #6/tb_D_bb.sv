`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy
// Engineer: Benyamain Yacoob, Eyiara Oladipo, Andre Price
// 
// Create Date: 03/15/2024 06:43:38 PM
// Design Name: 
// Module Name: tb_D_bb
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


module tb_D_bb();

    // Should always be on for purposes of tb (as shown in the figure)
    logic D = 1;
    logic Clk = 1;
    
    reg Q_lat, Q_pos, Q_neg;
    
    D_ff_behavior dffb(
        .D(D),
        .Clk(Clk),
        .Q_lat(Q_lat),
        .Q_pos(Q_pos),
        .Q_neg(Q_neg)
        );
        
        
    // Reverse the clock to be on or off
    always #30 Clk = ~Clk;
        
    initial begin
        #10;
        D = 0;
        #20;
        D = 1;
        #10;
        D = 0;
        #15;
        D = 1;
        #30;
        D = 0;
        
        $monitor("D = %d, Clk = %d, Q_latch = %d, Q_posedge = %d, Q_negedge = %d", D, Clk, Q_lat, Q_pos, Q_neg);
        #100 $finish;
     end

endmodule
