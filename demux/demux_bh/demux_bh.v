
// behavioral model
module demux_bh(a, b, en, z);
	input a, b, en;
	output[3:0] z;
	reg[3:0] z;
	
	always @(a or b or en)

		case({en, a, b})
			3'b100 : z = 4'b1110;
			3'b110 : z = 4'b1101;
			3'b101 : z = 4'b1011;
			3'b111 : z = 4'b0111;
			default: z = 4'b1111;
		endcase

endmodule
