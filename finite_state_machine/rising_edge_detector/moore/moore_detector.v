
module moore_detector(clk, reset, level, tick);
	input wire clk, reset, level;
	output reg tick;
	
	localparam[1:0] 
		zero = 2'b00,
		edge_ = 2'b01,
		one  = 2'b10;
		
	reg[1:0] state, next_state;
	
	
	always @(posedge clk, posedge reset)
	begin
		if (reset)
			state <= zero;
		else
			state <= next_state;
	end
	
	
	always @(state, level)
	begin
		state = next_state;
		tick = 1'b0;  // tick is one-cycle only
		
		case (state)
			zero:
				if (level)
					next_state = edge_;
				
			edge_:
				begin
					tick= 1'b1;
					if (level)
						next_state = one;
					else
						next_state = zero;
				end
				
			one:
				if (~level)
					next_state = zero;
		endcase
	end

endmodule
