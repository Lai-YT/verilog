
module ripple_counter_tb;
	reg clk, reset;  // input
	wire [3:0] q;  // output
	
	ripple_carry_counter rcc(
		.q(q),
		.clk(clk),
		.reset(reset)
	);
	
	initial
		clk = 1'b0;
		
	always
		#5
		clk = ~clk;
	
	initial
	begin
		reset = 1'b1;
		#20
		reset = 1'b0;
		#180
		reset = 1'b1;
		#20
		reset = 1'b0;
	end
endmodule
