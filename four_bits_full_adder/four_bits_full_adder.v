
module four_bits_full_adder(sum, c_out, a, b, c_in);
	input c_in;
	input[3:0] a, b;
	output[3:0] sum, c_out;
	
	full_adder ff_1(sum[0], c_out[0], a[0], b[0], c_in);
	full_adder ff_2(sum[1], c_out[1], a[1], b[1], c_out[0]);
	full_adder ff_3(sum[2], c_out[2], a[2], b[2], c_out[0]);
	full_adder ff_4(sum[3], c_out[3], a[3], b[3], c_out[0]);
	
endmodule


module full_adder(sum, c_out, a, b, c_in);

	input a, b, c_in;
	output sum, c_out;
	reg sum, c_out;
	
	//	behavioral modeling
	always @(a or b)
	begin
		{c_out, sum} = a + b + c_in;
	end
	
endmodule
