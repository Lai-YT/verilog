module divide_by_3_tb;
	reg clk, reset;
	wire q;
	
	divide_by_3 divider1(
		.clk(clk), 
		.reset(reset), 
		.q(q)
	);
	
	initial
	begin
		clk = 1'b0;
		reset = 1'b0;
	end
	
	always
	begin
		#1
		reset = 1'b0;
		#50
		reset = 1'b1;
	end
	
	always
		#1
		clk = ~clk;
	

endmodule
