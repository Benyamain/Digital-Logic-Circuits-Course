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


module debounce(
    input logic clk, 
    input logic negated_reset, 
    input logic btn_input, 
    output logic debounce_output
);

    // Declare register state and next state
    logic [10:0] register_state;
    logic [10:0] next_state;
    logic first_d_flip_flop, second_d_flip_flop;
    logic add_state, reset_state;

    // Calculate reset and add states
    assign reset_state = (first_d_flip_flop ^ second_d_flip_flop);
    assign add_state = ~(register_state[10]);

    // State transition logic
    always @(reset_state, add_state, register_state) begin
        case({reset_state, add_state})
            2'b00:
                next_state <= register_state;
            2'b01:
                next_state <= register_state + 1;
            default:
                next_state <= 11'b0;    
        endcase
    end

    // Flip-flop and state update logic
    always @(posedge clk) begin
        if (~negated_reset) begin
            first_d_flip_flop <= 0;
            second_d_flip_flop <= 0;
            register_state <= next_state;
        end else begin
            first_d_flip_flop <= btn_input;
            second_d_flip_flop <= first_d_flip_flop;
            register_state <= next_state;
        end
    end

    // Output debounce value when register state is high
    always @(posedge clk) begin
        if (register_state[10] == 1'b1)
            debounce_output <= second_d_flip_flop;
    end

endmodule