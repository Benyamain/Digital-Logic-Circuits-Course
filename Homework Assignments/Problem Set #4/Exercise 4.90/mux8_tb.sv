`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy
// Engineer: Benyamain Yacoob
// 
// Create Date: 03/13/2024 08:32:19 PM
// Design Name: mux8_tb
// Module Name: mux8_tb
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


module mux8_tb();

    // Inputs.
    logic a, b, c;

    // Output.
    logic y;
    
    // Instantiate the module.
    mux8_impl dut(
        .a(a),
        .b(b),
        .c(c),
        .y(y)
        );

    // Expected output based on truth table.
    logic expected_y;

    // Counter.
    integer i;

    initial begin
        // Loop through all possible input combinations and map the bit(s) index i to a, b, c.
        // Assuming 8-bit integer to loop through.
        // SystemVerilog index starts from 1.
        for (i = 0; i < 8; i = i + 1)
            begin
                a = i[2]; // MSB.
                b = i[1]; // Second LSB.
                c = i[0]; // LSB.
    
                // Calculate expected output based on truth table.
                expected_y = (~b & a) | (~b & ~c) | (~a & b & c);
    
                #10; // Wait for 10 ns for signal propagation.
    
                // Check if actual output matches expected output.
                if (y !== expected_y)
                    begin
                        $display("Error: Test case %d failed. a=%b, b=%b, c=%b, expected_y=%b, y=%b", i, a, b, c, expected_y, y);
                    end
                else
                    begin
                        $display("Test case %d passed. a=%b, b=%b, c=%b, expected_y=%b, y=%b", i, a, b, c, expected_y, y);
                    end
            end

            #10;
            $finish;
    end

endmodule