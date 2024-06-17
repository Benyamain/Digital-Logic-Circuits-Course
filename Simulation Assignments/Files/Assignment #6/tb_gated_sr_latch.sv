`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2024 08:07:13 PM
// Design Name: 
// Module Name: tb_gated_sr_latch
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


module tb_gated_sr_latch();
    logic R, E, S, Q, Qbar;
    Gated_SR_latch DUT(.R(R), .E(E), .S(S), .Q(Q), .Qbar(Qbar));
    
    initial begin
        R =0; E = 0; S = 0; Q = 0; Qbar = 0;
  
        //Setting Enable to 1 and S to 1 so that Q is 1, and we can see how 
        E = 1; S = 1;
        #20;
        $display("Enable = %b, S = %b, R = %b, Q = %b, Qbar = %b", E, S, R, Q, Qbar);
        
        //Setting the enable line to 0 so that the outputs latch 
        E = 0;
        #20;
        $display("Enable = %b, S = %b, R = %b, Q = %b, Qbar = %b", E, S, R, Q, Qbar);
        
        //Testing different values with R to show that since the enable line is 0, the 
        //output doesnt change
        S = 0; R = 1;
        #20;
        $display("Enable = %b, S = %b, R = %b, Q = %b, Qbar = %b", E, S, R, Q, Qbar);
    
        S = 1; R = 0;
        #20;
        $display("Enable = %b, S = %b, R = %b, Q = %b, Qbar = %b", E, S, R, Q, Qbar);
        
        //Setting enable to 1 so I can set R to 1 and S to 0, this way, Qbar will be 1 and Q will be 0
        E = 1; S = 0; R = 1;
        #20;
        $display("Enable = %b, S = %b, R = %b, Q = %b, Qbar = %b", E, S, R, Q, Qbar);
        
        //Setting the enable line to 0 so that the outputs latch 
        E = 0;
        #20;
        $display("Enable = %b, S = %b, R = %b, Q = %b, Qbar = %b", E, S, R, Q, Qbar);
        
        //Testing mopre different values with R and S to show that since the enable line is 0, the 
        //output that is now Qbar=1 and Q=0 doesnt change
        S = 1; R = 1;
        #20;
        $display("Enable = %b, S = %b, R = %b, Q = %b, Qbar = %b", E, S, R, Q, Qbar);
    
        S = 1; R = 0;
        #20;
        $display("Enable = %b, S = %b, R = %b, Q = %b, Qbar = %b", E, S, R, Q, Qbar);
    end
endmodule
