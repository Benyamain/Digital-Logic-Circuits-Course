`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2024 06:16:34 PM
// Design Name: 
// Module Name: addSub4
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


module addSub4(
    input logic [3:0] av, bv,
    input logic M,
    output logic [3:0] resultsv,
    output logic cout
    );
    logic [3:0] ToBorNotToB;
    assign ToBorNotToB[3:0] = {4{M}} ^ bv[3:0];
    
    // We are creading our adder with the following parameters 
    // av: Input 1 (given to us in the code)
    // bv: Input 2 (given to us in the code)
    // sumv: The output will go into the S vector
    // cout: We are piping cout into cout
    // cin: We used M as M will stand as our cin
    adder4bit myAdder(
        .av(av),
        .bv(ToBorNotToB),
        .sumv(resultsv),
        .cout(cout),
        .cin(M)
    );
endmodule
