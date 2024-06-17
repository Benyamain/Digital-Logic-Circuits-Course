`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy   
// Engineer: Benyamain Yacoob, Andre Price, Eyiara Oladipo
// 
// Create Date: 03/09/2024 4:30:00 PM
// Design Name: sevenseg
// Module Name: sevenseg
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


module sevenseg(
    input logic [3:0] data,
    output logic [6:0] segments,
    output logic [3:0] Anode_Activate
    );
    always_comb
        case (data)
        // common anode inverted encoding is necessary
        // for Basys3 displays.  Commented lines 
        // indicate normal coding pattern 
        //                      abc_defg    
            4'h0: segments = 7'b000_0001; //111_1110;
            4'h1: segments = 7'b100_1111; //011_0000;
            4'h2: segments = 7'b001_0010; //110_1101;
            4'h3: segments = 7'b000_0110; //111_1001;
            4'h4: segments = 7'b100_1100; //011_0011;
            4'h5: segments = 7'b010_0100; //101_1011;
            4'h6: segments = 7'b010_0000; //101_1111;
            4'h7: segments = 7'b000_1111; //111_0000;
            4'h8: segments = 7'b000_0000; //111_1111;
            4'h9: segments = 7'b000_1100; //111_0011;
            4'ha: segments = 7'b000_1000; //111_0111;
            4'hb: segments = 7'b110_0000; //001_1111;
            4'hc: segments = 7'b011_0001; //100_1110;
            4'hd: segments = 7'b100_0010; //011_1101;
            4'he: segments = 7'b011_0000; //100_1111;
            4'hf: segments = 7'b011_1000; //100_0111;
        endcase   
    always_comb
        // Basys3 displays are multiplexed with 4 control lines
        // used to turn on individual displays (see ref man)
        // Turn on only the rightmost 7-seg display
        Anode_Activate = 4'b1110;
endmodule
