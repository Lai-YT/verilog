
'timescale 1ns/100ps
module div_three_clk_tb;
	reg clk_in, reset;
	wire clk_out;
	
	div_three_clk INST(
		.clk_in(clk_in),
		.reset(reset),
		.clk_out(clk_out)
	);
	
	initial
		clk_in = 1'b0;
	
	always
		#5
		clk_in = ~clk_in;
	
	initial
		begin
			#5
			reset = 1'b1;
			#10
			reset = 1'b0;
			#500
			$finish;
		end
	
	initial
		$monitor("clk_in = %b, reset = %b, clk_out = %b", clk_in, reset, clk_out);
	
	initial
		begin
			$dumpfile("div_three_clk_tb.vcd");
			$dumpvars(0, div_three_clk_tb);
		end
	
	endmodule
	