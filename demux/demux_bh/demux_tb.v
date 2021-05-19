
module demux_tb;
	
	reg a, b, en;
	wire [3:0] z_b;
	
	demux_bh dmb(a, b, en, z_b);
	
	initial 
		begin
		// comment in order of b, a, en
			// 0, 0, 0
			en = 0;
			a = 0;
			b = 0;
			// 0, 0, 1
			# 10
			en = 1;
			// 0, 1, 0
			#10
			en = 0;
			a = 1;
			// 0, 1, 1
			#10
			en = 1;
			// 1, 0, 0
			#10
			en = 0;
			a = 0;
			b = 1;
			// 1, 0, 1
			#10
			en = 1;
			// 1, 1, 0
			#10
			en = 0;
			a = 1;
			// 1, 1, 1
			#10
			en = 1;
			#10
			$finish;
		end
		
endmodule

		