
module div_two_clk_tb;
	reg clk_in, enable, reset;
	wire clk_out;
	
	div_two_clk INST1(
		.clk_in(clk_in),
		.enable(enable),
		.reset(reset),
		.clk_out(clk_out)
	);
	
	initial
		clk_in = 1'b0;
		
	always
		#1
		clk_in = ~clk_in;
	
	initial
	begin
		reset = 1'b1;
		enable = 1'b1;
		#2
		reset = 1'b0;
		#180
		reset = 1'b1;
		#2
		reset = 1'b0;
	end
endmodule
