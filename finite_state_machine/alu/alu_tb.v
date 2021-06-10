
module alu_tb;
	// input
	reg[3:0] opcode;
	reg[7:0] opd_1, opd_2;
	// output
	wire[15:0] res;
	wire c_flag, z_flag;
	// temp
	reg[3:0] count = 4'b0000;
	
	alu a(
		.opcode(opcode),
		.opd_1(opd_1),
		.opd_2(opd_2),
		.res(res),
		.c_flag(c_flag),
		.z_flag(z_flag)
	);
	
	initial
	begin
		opcode = 4'b0000;
		opd_1  = 8'h00;
		opd_2  = 8'h00;
		
		#100
		opd_1 = 8'hAA;  // 170
		opd_2 = 8'h55;  // 85
		for (count = 0; count < 16; count = count + 1'b1)
		begin
			opcode = count;
			#20;
		end
	end

endmodule
