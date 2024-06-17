module room_fsm (
  input logic clk, reset, n, s, e, w, v, h,
  output logic [8:0] s1_to_s9,
  output logic d, win, wz, sw
);
  enum logic [8:0] {
    CAVE_OF_CACOPHONY  = 9'b000000001,
    TWISTY_TUNNEL      = 9'b000000010,
    RAPID_RIVER        = 9'b000000100,
    SECRET_SWORD_STASH = 9'b000001000,
    DRAGONS_DEN        = 9'b000010000,
    VICTORY_VAULT      = 9'b000100000,
    GRIEVOUS_GRAVEYARD = 9'b001000000,
    DRAGONS_DEPARTURE  = 9'b010000000,
    WIZARD_CHAMBER     = 9'b100000000
  } current_state, next_state;

  // State transition logic with synchronous reset
  always_ff @(posedge clk) begin
    if (reset) current_state <= CAVE_OF_CACOPHONY;
    else current_state <= next_state;
  end
  
  // Next state logic
  always_comb begin
    next_state = current_state;
    
    case (current_state)
      CAVE_OF_CACOPHONY:
        if (e) begin
            next_state = TWISTY_TUNNEL; 
            $display("You walk right into twisty tunnel");
            $display("----------------------");      
            end
        else begin
            next_state = current_state;
            end
      TWISTY_TUNNEL: begin
        if (w) begin
            $display("You walk left into the cave of cacophony");
            $display("----------------------");      
            next_state = CAVE_OF_CACOPHONY;
            end
        else if (n) begin
            $display("You walk up and find the wizard's chamber");
            $display("You find a wizard; He has been expecting you, The wizard looks up to you and tells you a secret about the dragon");
            $display("You find out the dragon is your long lost wife, cursed because of her cheating ways....");
            $display("----------------------");      
            next_state = WIZARD_CHAMBER; 
            end
        else if (s) begin
            $display("You walk down to find a rapid river");
            $display("----------------------"); 
            next_state = RAPID_RIVER;
            end
        else
            next_state = current_state;
      end
      RAPID_RIVER:
        if (n) begin
            $display("You walk up to the twisty tunnel");
            $display("----------------------");
            next_state = TWISTY_TUNNEL;
            end
        else if (w) begin
            $display("You walk left and find a secret sword stash! You are now prepared to face the evil dragon...or so you hear!");
            $display("----------------------");
            next_state = SECRET_SWORD_STASH; 
            end
        else if (e) begin
            next_state = DRAGONS_DEN;
            end
        else
            next_state = current_state;
      SECRET_SWORD_STASH: 
        if (e)
        begin
            next_state = RAPID_RIVER;
            $display("You return to the rapid rivers.");
            $display("----------------------");
        end
        else
            next_state = current_state;
      WIZARD_CHAMBER: 
        if (s) begin
            $display("You return to move down to the twisty tunnel.");
            $display("----------------------");
            next_state = TWISTY_TUNNEL;
            end
        else
            next_state = current_state;
      DRAGONS_DEN: begin
        $display("You confront the dragon! It is time for the final face-off");
        if  (h) 
            next_state = DRAGONS_DEPARTURE;
        else if (v) begin
            next_state = VICTORY_VAULT;
            end
        else if (~v) begin
            next_state = GRIEVOUS_GRAVEYARD;
        end
        else next_state = current_state;
      end
      DRAGONS_DEPARTURE: begin
            $display("You face your cheating wife (now dragon) and show her how much of a chad you are now.");
            $display("She flees in sadness, jealousy, and beta-ness");
            $display("----------------------");
            end
      VICTORY_VAULT: begin
            $display("You slay the dragon!!! You take one of it's horns as it is a well-known aphrodesiac, and head over to the victory vault");
            end
      GRIEVOUS_GRAVEYARD: begin
            $display("You come unprepared to the battle, so you ended up getting killed...by snu snu");
            $display("You may start again");
            $display("----------------------");
      end 
      default: next_state = CAVE_OF_CACOPHONY;
    endcase
  end

  //Output logic block
  always_comb
  begin
    sw = sw | (current_state == SECRET_SWORD_STASH);
    wz = wz | (current_state == WIZARD_CHAMBER);
    win = win | (current_state == VICTORY_VAULT) | (current_state == DRAGONS_DEPARTURE);
    d = d | (current_state == GRIEVOUS_GRAVEYARD);
    s1_to_s9 = current_state; 
  end
endmodule