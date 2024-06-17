module sword_fsm_tb;
  logic clk, reset, sw, wz;
  logic v, h;

  sword_fsm DUT (
    .clk(clk), .reset(reset), .sw(sw), .wz(wz),
    .v(v), .h(h)
  );

  always begin
    clk = 0; #5;
    clk = 1; #5;
  end

  initial begin
    reset = 1; sw = 0; wz = 0; #10;
    reset = 0; #10;
    sw = 1; #10;  // Acquire sword
    wz = 1; #10;  // Interact with wizard
    #10;
    $finish;
  end

endmodule
