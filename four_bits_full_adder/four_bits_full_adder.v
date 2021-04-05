
module four_bits_full_adder(sum, c_out, a, b);
	
	input[3:0] a, b;
	output[3:0] sum, c_out;
	
	half_adder hf_1(sum[0], c_out[0], a[0], b[0]);
	full_adder ff_2(sum[1], c_out[1], c_out[0], a[1], b[1]);
	full_adder ff_3(sum[2], c_out[2], c_out[1], a[2], b[2]);
	full_adder ff_4(sum[3], c_out[3], c_out[2], a[3], b[3]);
	
endmodule


module half_adder(sum, c_out, a, b);

	input a, b;
	output sum, c_out;
	
	assign {c_out, sum} = a + b;
	
endmodule

module full_adder(sum, c_out, a, b, c_in);

	input a, b, c_in;
	output sum, c_out;
	
	assign {c_out, sum} = a + b + c_in;
	
endmodule
