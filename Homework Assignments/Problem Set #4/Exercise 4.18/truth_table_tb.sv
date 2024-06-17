`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy
// Engineer: Benyamain Yacoob
// 
// Create Date: 03/13/2024 11:35:40 PM
// Design Name: truth_table_tb
// Module Name: truth_table_tb
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


module truth_table_tb();

    // Input signals.
    logic A, B, C, D;

    // Output signal.
    logic Y;

    truth_table dut(
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .Y(Y)
        );
        
    initial begin
        // Exhaustive testing through all possible input combinations (each input can be two states, do this for all four vars).
        for (A = 0; A <= 1; A = A + 1)
            begin
                for (B = 0; B <= 1; B = B + 1)
                    begin
                        for (C = 0; C <= 1; C = C + 1)
                            begin
                                for (D = 0; D <= 1; D = D + 1)
                                    begin
                                        #10; // Wait 10 ns for signal propagation.

                                        // Check if actual output matches expected output based on minimal form.
                                        if (Y !== (A & C | A & B | ~A & ~D))
                                            begin
                                                $display("Error: A=%b, B=%b, C=%b, D=%b, Expected Y=%b, Actual Y=%b", A, B, C, D, A & C | A & B | ~A & ~D, Y);
                                            end
                                        else
                                            begin
                                                $display("Test Passed: A=%b, B=%b, C=%b, D=%b, Y=%b", A, B, C, D, Y);
                                            end
                                    end
                            end
                    end
            end
            $finish;
    end

endmodule