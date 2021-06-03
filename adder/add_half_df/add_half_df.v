//this a dataflow modeling

module add_half_df(sum, c_out, a, b);

	input a, b;
	output sum, c_out;

	assign {c_out, sum} = a + b;

//	assign sum = a ^ b;
//	assign c_out = a & b;

endmodule
