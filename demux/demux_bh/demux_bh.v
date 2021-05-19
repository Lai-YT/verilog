
/* There are bugs inside unfixed*/

// behavioral model
module demux_bh(a, b, en, z);
	input a, b, en;
	output[3:0] z;
	reg z;
	
	always @(a or b or en)
	begin
		z = 4'b1111;
		case({en, a, b})
			3'b100: z = 4'b1110;
			3'b110: z = 4'b1101;
			3'b101: z = 4'b1011;
			3'b111: z = 4'b0111;
		endcase
	end
endmodule
