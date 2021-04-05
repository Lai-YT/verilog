
module div_three_clk(clk_in, reset, clk_out);

	input clk_in, reset;
	output clk_out;
	
	reg[1:0] pos_count, neg_count;
	
	assign clk_out = ((pos_count == 2) || (neg_count == 2));
	always @(posedge clk_in)
		if (reset || pos_count == 2)
			pos_count <= 0;
		else
			pos_count <= pos_count + 1;
	
	always @(negedge clk_in)
		if (reset || neg_count == 2)
			neg_count <= 0;
		else
			neg_count <= neg_count + 1;
			
endmodule
