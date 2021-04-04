
module div_two_counter(clk_in, enable, reset, clk_out);

	input clk_in, enable, reset;
	output clk_out;
	
	wire clk_in, enable;
	
	reg clk_out;
	
	always @(posedge clk_in)
	if (reset)
		clk_out <= 1'b0;
	else if (enable)
		clk_out <= !clk_out;
	//	use <= mean assign after this block
	//	= means immidiate assign 
	
endmodule
