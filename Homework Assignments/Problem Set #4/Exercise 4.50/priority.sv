`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy
// Engineer: Benyamain Yacoob
// 
// Create Date: 03/14/2024 01:10:04 AM
// Design Name: not_priority
// Module Name: not_priority
// Project Name: hw_pset_4
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

// The keyword aspect is a potential issue. While the code itself might function in simulation, using "priority" as the module name can
// cause conflicts with built-in keywords in Vivado. To fix this, just name the module any non-keyword.

module not_priority(
    input logic [3:0] a,
    output logic [3:0] y
    );
    
    always_comb
        if (a[3]) y = 4'b1000;
        else if (a[2]) y = 4'b0100;
        else if (a[1]) y = 4'b0010;
        else if (a[0]) y = 4'b0001;
    
endmodule