`timescale 1ns / 1ps

module room_fsm_tb();
   logic clk, reset, n, s, e, w, h, sw, v;
   logic [8:0] s1_to_s9;
   logic d, win;

   room_fsm DUT (.clk(clk), .reset(reset), .n(n), .s(s), .e(e), .w(w),
   .h(h), .sw(sw), .v(v), .s1_to_s9(s1_to_s9), .d(d), .win(win)
   );

  always begin
    clk = 0; #5;
    clk = 1; #5;
  end

   initial begin
    reset = 1; n = 0; s = 0; e = 0; w = 0;
     #10;
    reset = 0; #10;
    e = 1; 
    #10; 
    e = 0; n = 1;
    #10;
    n = 0; s = 1; h = 1; 
    #10;
    s = 1;
    #15;
    s = 0; w = 1;
    #10;
    w = 0; e = 1;
    #10;
    e = 1; v = 1;
    #10;
    $finish;
   end
endmodule
