//this is a gate-level modeling

module add_half_glv(sum, c_out, a, b);

	input a, b;
	output sum, c_out;
	wire c_out_bar;
	
	// xor (a, b) is the sum
	xor xl(sum, a, b);

	//	nand (a, b) goes to c_out_bar
	nand nl(c_out_bar, a, b);
	// not (c_out_bar) is the carry
	not (c_out, c_out_bar);
	
//	and al(c_out, a, b);
	
endmodule
