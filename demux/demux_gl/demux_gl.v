
// gate level model
module demux_gl(input a, b, en, output[3:0] z);

	wire a_bar, b_bar;
	
	not v0(a_bar, a);
	not v1(b_bar, b);
	
	nand n0(z[0], en, a_bar, b_bar);
	nand n1(z[1], en, a,     b_bar);
	nand n2(z[2], en, a_bar, b);
	nand n3(z[3], en, a,     b);
	
endmodule
