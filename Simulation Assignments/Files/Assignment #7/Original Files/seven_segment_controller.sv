`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy
// Engineer: Eyiara Oladipo, Benyamain Yacoob, Andre Price
// 
// Create Date: 03/26/2024 02:13:10 PM
// Design Name: 
// Module Name: Seven_segment_LED_Display_Controller
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

module seven_segment_controller (
    input logic clk_100MHz,
    input logic reset,
    output logic [3:0] anode,
    output logic [6:0] segment
);

    // Counter to cycle through the anodes
    logic [15:0] counter;
    always_ff @(posedge clk_100MHz or posedge reset) begin
        if (reset) begin
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end
    end

    // Decode counter to activate the corresponding anode
    always_comb begin
        case (counter[15:14])
            2'b00: anode = 4'b1110;
            2'b01: anode = 4'b1101;
            2'b10: anode = 4'b1011;
            2'b11: anode = 4'b0111;
        endcase
    end

    // Decode the counter value to display the corresponding digit
    logic [3:0] digit;
    always_comb begin
        case (counter[13:12])
            2'b00: digit = counter[3:0];
            2'b01: digit = counter[7:4];
            2'b10: digit = counter[11:8];
            2'b11: digit = 4'b0000; // Placeholder for leading 0's
        endcase
    end

    // Seven-segment decoder
    always_comb begin
        case (digit)
            4'h0: segment = 7'b1000000;
            4'h1: segment = 7'b1111001;
            4'h2: segment = 7'b0100100;
            4'h3: segment = 7'b0110000;
            4'h4: segment = 7'b0011001;
            4'h5: segment = 7'b0010010;
            4'h6: segment = 7'b0000010;
            4'h7: segment = 7'b1111000;
            4'h8: segment = 7'b0000000;
            4'h9: segment = 7'b0010000;
            default: segment = 7'b0111111;
        endcase
    end

endmodule