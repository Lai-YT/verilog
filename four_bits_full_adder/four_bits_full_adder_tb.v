
module four_bits_full_adder_tb;

	reg[3:0] a, b;
	reg c_in;
	wire[3:0] sum;
	wire c_out;
	integer i, j;  // for-loop vars
	
	four_bits_full_adder INST1(sum, c_out, a, b, c_in);
	
	initial
		begin
			a = 4'b0000;
			b = 4'b0000;
			c_in = 1'b0;
		end
		
	always
	begin
		
		for (i = 0; i < 15; i = i + 1)
		begin
			
			#10
			a = a + 1;
			
			// ---- first no c_in ----
			c_in = 1'b0;
			
			for (j = 0; j < 15; j = j + 1)
			begin
				#10
				b = b + 1;
			end
			
			// ---- second with c_in ----
			#10
			c_in = 1'b1;

			for (j = 0; j < 15; j = j + 1)
			begin
				#10
				b = b + 1;
			end
			
		end  // outer for loop
	end  // always
	
	initial
		$monitor("a = %b, b = %b, c_in = %b, sum = %b, c_out = %b", 
					 a, b, c_in, sum, c_out);
	
	
endmodule
	
	