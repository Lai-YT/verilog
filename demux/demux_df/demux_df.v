
// dataflow model
module demux_df(input a, b, en, output[3:0] z);
	
	assign z[0] = |{~en, a, b};
	assign z[1] = ~(en &  a & ~b);
	assign z[2] = ~(en & ~a &  b);
	assign z[3] = en ? ~(a & b) : 1'b1;
	
endmodule
