
module four_bits_full_adder_tb;

	reg[3:0] a, b;
	wire[3:0] sum;
	wire c_out;
	integer i, j;  // for-loop vars
	
	four_bits_full_adder INST1(sum, c_out, a, b);
	
	initial
		begin
			a = 4'b0000;
			b = 4'b0000;
		end
		
	always
	begin
		for (i = 0; i < 15; i = i + 1)
		begin
		
			#2
			a = a + 1;
			
			for (j = 0; j < 15; j = j + 1)
			begin
				#2
				b = b + 1;
			end
			
		end
	end
	
endmodule
	
	