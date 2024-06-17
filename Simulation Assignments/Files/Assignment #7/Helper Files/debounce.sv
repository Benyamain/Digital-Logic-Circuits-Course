`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy
// Engineer: Benyamain Yacoob, Ara Oladipo, Andre Price
// 
// Create Date: 03/29/2024 05:27:22 PM
// Design Name: 
// Module Name: debounce
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


module debounce(input logic clk, input logic negated_reset, input logic btn_input, output logic debounce_output);

parameter number_of_parameters = 11;

logic [number_of_parameters - 1 : 0] register_state;
logic [number_of_parameters - 1 : 0] next_state;
logic first_d_flip_flop, second_d_flip_flop, add_state, reset_state;

assign reset_state = (first_d_flip_flop ^ second_d_flip_flop);
assign add_state = ~(register_state[number_of_parameters - 1]);

always @(reset_state, add_state, register_state) begin
    case({reset_state, add_state})
        2'b00:
            next_state <= register_state;
        2'b01:
            next_state <= register_state + 1;
        default:
            next_state <= {number_of_parameters{1'b0}};    
     endcase
end

always @(posedge clk) begin
    if (negated_reset == 1'b0)
        begin
            first_d_flip_flop <= 1'b0;
            second_d_flip_flop <= 1'b0;
            register_state <= next_state;
        end
    else
        begin
            first_d_flip_flop <= btn_input;
            second_d_flip_flop <= first_d_flip_flop;
            register_state <= next_state;
        end
end

always @(posedge clk) begin
    if (register_state[number_of_parameters - 1] == 1'b1)
        debounce_output <= second_d_flip_flop;
    else
        debounce_output <= debounce_output;
end

endmodule