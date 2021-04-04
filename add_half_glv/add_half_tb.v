
module half_adder_tb;
	reg a, b;
	wire sum, c_out;
	//	get a gate-level half adder
	add_half_glv ah1(sum, c_out, a, b);

	initial
	begin
		a = 1'b0;
		b = 1'b0;
	end

	always
	begin
		#1	 // sum = 0, c = 0
		a = 1'b0;
		b = 1'b0;

		#1  // sum = 1, c = 0
		a = 1'b1;
		b = 1'b0;

		#1  // sum = 1, c = 0
		a = 1'b0;
		b = 1'b1;

		#1  // sum = 0, c = 1
		a = 1'b1;
		b = 1'b1;
	end

endmodule
