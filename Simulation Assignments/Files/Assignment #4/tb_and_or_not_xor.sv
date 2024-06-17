`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy
// Engineer: Andre Price, Benyamain Yacoob, Ara Oladipo
// 
// Create Date: 02/20/2024 05:23:14 PM
// Design Name: tb_and_or_not_xor.sv
// Module Name: tb_and_or_not_xor
// Project Name: Simulation Assignment 4
// Target Devices: N/A
// Tool Versions: N/A
// Description: Create AND, OR, NOT, and XOR gates
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_and_or_not_xor(

);
    // Simulator inputs and outputs that respectively correspond to our schematic
    logic aa, bb, cc;
    logic out1, out2, out3, out4;

    // Instantiate the module that holds the code logic for our schematic
    and_or_not_xor U1(aa, bb, cc, out1, out2, out3, out4);

    initial begin
        aa = 0;
        bb = 0;
        cc = 0;
        #100; // Wait 100 ns for the global reset to finish

        aa = 1;
        #100;
        aa = 0;
        #100; // Added this at delegated point of simulation assg
        bb = 1;
        #100;
        aa = 1;
        #100;
        cc = 1;
        #100;
        cc = 0;
        #1000;
    end

endmodule