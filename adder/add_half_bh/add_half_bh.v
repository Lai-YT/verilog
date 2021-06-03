//this is a behavioral modeling

module add_half_bh(sum, c_out, a, b);
	
	input a, b;
	output sum, c_out;
	reg sum, c_out;
	
	always @(a or b)
	begin
		{c_out, sum} = a + b;
	end
	
endmodule
		