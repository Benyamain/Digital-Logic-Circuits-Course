module adventure_game (
  input logic clk, reset, n, s, e, w,
  output logic [8:0] room_state,
  output logic win, dead
);

  // Initializing variables
  logic sw = 0, wz = 0;
  logic h = 0, v = 0;
  logic [3:0] Anode_Activate;
  logic [6:0] LED_out;

  //Initializing the room fsm module
  room_fsm room (
    .clk(clk), .reset(reset),
    .n(n), .s(s), .e(e), .w(w), .sw(sw), .wz(wz), .h(h),
    .s1_to_s9(room_state), .d(dead), .win(win)
  );

  //Initializing the sword fsm module
  sword_fsm sword (
    .clk(clk), .reset(reset),
    .sw(sw), .wz(wz),
    .v(v), .h(h)
  );
  
  //Initializing the display module
  game_display display(
     .digit_data(room_state),
      .Anode_Activate(Anode_Activate), 
      .LED_out(LED_out)
  );
    
endmodule
