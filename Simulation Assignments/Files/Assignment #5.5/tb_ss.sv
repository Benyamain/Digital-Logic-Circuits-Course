`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Detroit Mercy   
// Engineer: Benyamain Yacoob, Andre Price, Eyiara Oladipo
// 
// Create Date: 03/09/2024 4:30:00 PM
// Design Name:
// Module Name: tb_example
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


module tb_example( );
    logic        clk, reset;
    logic [3:0]  data;
    logic [3:0]  Anode_Activate;
    logic [6:0]  s_expected;
    logic [6:0]  s;
    logic [31:0] vectornum, errors;
    logic [10:0] testvectors[100:0];
    // instantiate device under test
    sevenseg dut(data, s, Anode_Activate);
    // generate clock to coordinate applying data and checking results
    always
        begin
            clk = 1; #20; clk = 0; #20;
        end
    // at start of test, load vectors
    // and pulse reset
    initial
        begin
            $readmemb("C:/Users/benj/Downloads/ss_tv.tv", testvectors);
            vectornum = 0; errors = 0;
            reset = 1; #27; reset = 0;
        end
    // apply test vectors on rising edge of clk
    always @(posedge clk)
        begin
            #1; {data, s_expected} = testvectors[vectornum];
        end
    // check results on falling edge of clk
    always @(negedge clk)
        if (~reset) begin // skip during reset
            if (s !== s_expected) begin 
                $display("Error: inputs = %h", data);
                $display("  outputs = %b (%b expected)",s, s_expected);
                errors = errors + 1;
            end
            vectornum = vectornum + 1;
            if (testvectors[vectornum] === 11'bx) begin
                $display("%d tests completed with %d errors",
                vectornum, errors);
                $finish;
            end
        end
endmodule