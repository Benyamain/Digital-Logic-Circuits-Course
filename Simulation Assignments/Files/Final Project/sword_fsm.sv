module sword_fsm (
  input logic clk, reset, sw, wz,
  output logic v, h 
);

 //We have four states and we are using one-hot encoding
 enum logic [3:0] {
    NO_SWORD_AND_NO_SPECIAL_KNOWLEDGE = 4'b0001, 
    HAS_SWORD_BUT_NO_SPECIAL_KNOWLEDGE = 4'b0010,
    HAS_SPECIAL_KNOWLEDGE_BUT_NO_SWORD = 4'b0100, 
    HAS_EVERYTHING = 4'b1000
  } current_state, next_state;

  // State transition logic
  always_ff @(posedge clk, posedge reset) begin
    if (reset) current_state <= NO_SWORD_AND_NO_SPECIAL_KNOWLEDGE;
    else current_state <= next_state;
  end

  //Output block
  always_comb begin
    next_state = current_state;
    case (current_state)
      NO_SWORD_AND_NO_SPECIAL_KNOWLEDGE: 
        begin if (sw) begin next_state = HAS_SWORD_BUT_NO_SPECIAL_KNOWLEDGE; $display("You have gained the vorpal sword"); end
          if (wz) begin next_state = HAS_SPECIAL_KNOWLEDGE_BUT_NO_SWORD; $display("You now know the secrets of the dragon"); end
        end
      HAS_SWORD_BUT_NO_SPECIAL_KNOWLEDGE: begin
        if (wz) begin next_state = HAS_EVERYTHING; $display("You now know the secrets of the dragon.");
          $display("With this and the vorpal sword, you feel invincible and ready to defeat your ex-wife");end 
      end
      HAS_SPECIAL_KNOWLEDGE_BUT_NO_SWORD: if(sw) begin $display("You have gained the vorpal sword"); next_state = HAS_EVERYTHING;end
      HAS_EVERYTHING: next_state = HAS_EVERYTHING ;
      default: next_state = NO_SWORD_AND_NO_SPECIAL_KNOWLEDGE;
    endcase
  end

  always_comb begin
       v = v | (current_state == HAS_SWORD_BUT_NO_SPECIAL_KNOWLEDGE) | (current_state == HAS_EVERYTHING);
       h = h | (current_state == HAS_SPECIAL_KNOWLEDGE_BUT_NO_SWORD) |  (current_state == HAS_EVERYTHING);
  end
endmodule
