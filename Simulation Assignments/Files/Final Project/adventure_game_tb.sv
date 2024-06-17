`timescale 1ns / 1ps

module adventure_game_tb();
   //Define variables
   logic clk, reset, n, s, e, w, d, win;
   logic [8:0] s1_to_s9;
      
   //Initialize the adventure game
   adventure_game DUT(
  .clk(clk), .reset(reset), .n(n), .s(s), .e(e), .w(w),
  .room_state(s1_to_s9),
  .win(win), .dead(dead)
  );

  always begin  //Set up the clock 
    clk = 0; #50;
    clk = 1; #50;
  end

   initial begin
    reset = 1; n = 0; s = 0; e = 0; w = 0;
     #100; reset = 0; #100;
    e = 1; //Move into twisty tunnel
    #100; 
    
    e = 0; n = 1; //Go up into the wizard's tunnel, which asserts H (now that you Have the special knowledge )
    #100;
    
    n = 0; s = 1; //Go back down into twisty tunnel
    #100;
    
    s = 1; //Go down into rapid river
    #100;
    
    s = 0; w = 1; //Move into the secret sword stash, which asserts V (now that you have the Vorpal sword)
    #100;
    
    w = 0; e = 1; //Go back to the rapid river
    #100;
    
    w=0; e = 1; //Enter the dragon's den, ready to face the dragon
    #250;
    $finish;
   end
endmodule
