`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2024 06:42:23 PM
// Design Name: 
// Module Name: tb_sr_latch_dataflow
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


module tb_sr_latch_dataflow();
   logic R, S, Q, Qbar;
   
   SR_latch_dataflow DUT(.R(R), .S(S), .Q(Q), .Qbar(Qbar));
   
   initial begin
     //set = 1, reset = 0
     R = 0; S = 1; Q = 0; Qbar = 0;
     #20;
     $display("S = %b, R = %b, Q = %b, Qbar = %b", S, R, Q, Qbar);
     
     //set = 0, reset = 0, the outputs should latch with Q being 1 and Q bar being 0
     S = 0;
     #20;
     $display("S = %b, R = %b, Q = %b, Qbar = %b", S, R, Q, Qbar);
   
     //set = 0, reset = 1, Qbar should be 1 while Q is 0
     R = 1;
     #20;
     $display("S = %b, R = %b, Q = %b, Qbar = %b", S, R, Q, Qbar);
     
     //set = 0, reset = 0, the outputs should latch with Q being 0 and Q bar being 1
     R=0;
     #20;
     $display("S = %b, R = %b, Q = %b, Qbar = %b", S, R, Q, Qbar);     
   end
endmodule
