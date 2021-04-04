
module half_adder_bh_testbench;
	reg a, b;
	wire sum, c_out;

	add_half_bh ahbh(sum, c_out, a, b);

	initial
	begin
		a = 1'b0;
		b = 1'b0;
	end

	always
	begin
		#1
		a = 1'b0;
		b = 1'b0;
		#1
		a = 1'b0;
		b = 1'b1;
		#1
		a = 1'b1;
		b = 1'b0;
		#1
		a = 1'b1;
		b = 1'b1;
	end
endmodule