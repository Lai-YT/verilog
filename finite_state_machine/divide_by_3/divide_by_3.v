
// duty ratio 33%
module divide_by_3(input clk, reset, output q);

  reg [1:0] state,
            next_state;
  parameter [1:0] s0 = 2'b00,
                  s1 = 2'b01,
                  s2 = 2'b10;

  // state register
  always @(posedge clk, posedge reset)
    if (reset)
      state <= s0;
    else
      state <= next_state;

  // next state logic
  always @(state)
    case (state)
      s0:
        next_state = s1;
      s1:
        next_state = s2;
      s2:
        next_state = s0;
      default:
        next_state = s0;
    endcase

  // output logic
  assign q = (state == s0);

endmodule
