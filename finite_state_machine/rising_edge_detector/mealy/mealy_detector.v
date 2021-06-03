
module mealy_detector(clk, reset, level, tick);
	input wire clk, reset, level;
	output reg tick;
	
	localparam zero = 1'b0, one = 1'b1; 
	reg state, next_state;

	
	always @(posedge clk, posedge reset)
	begin
		if (reset)
			state <= zero;
		else
			state <= next_state;
	end
	
	
	always @(state, level)
	begin
		next_state = state;
		tick = 1'b0;  // tick is one-cycle only
		
		case (state)
			zero:
				if (level)
				begin
					next_state = one;
					tick = 1'b1;
				end
				
			one:
				if (~level)
					next_state = zero;
							
		endcase
	end
	
	
endmodule
