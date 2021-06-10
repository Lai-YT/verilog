
module alu(opcode, opd_1, opd_2, res, c_flag, z_flag);
	input[2:0] opcode;
	input[7:0] opd_1, opd_2;
	output reg[15:0] res = 16'h0000;
	// carry flag indicates borrow in SBC (subtraction with borrow)
	output reg c_flag = 1'b0, z_flag = 1'b0;

	// 8 kinds of operations
	parameter[3:0]
		ADD  = 4'b0000,
		ADDC = 4'b0001,
		SUB  = 4'b0010,
		SUBB = 4'b0011,
		DEC  = 4'b0100,
		INC  = 4'b0101,
		TRAN = 4'b0110,
		AND  = 4'b0111,
		OR   = 4'b1000,
		XOR  = 4'b1001,
		NOT  = 4'b1010,
		SHL  = 4'b1011,
		SHR  = 4'b1100;
		
	always @(opcode or opd_1 or opd_2)
	begin
		// normal ADD doesn't care carry 
		if (opcode == ADD)
		begin
			res = opd_1 + opd_2;
			c_flag = 1'b0;
			z_flag = (res == 16'h0000);
		end
		else if (opcode == ADDC)
		begin
			res = opd_1 + opd_2;
			c_flag = res[8];
			z_flag = (res == 16'h0000);
		end
		// normal SUB doesn't care borrow
		else if (opcode == SUB)
		begin
			res = opd_1 - opd_2;
			c_flag = 1'b0;
			z_flag = (res == 16'h0000);
		end
		else if (opcode == SUBB)
		begin
			res = opd_1 - opd_2;
			c_flag = res[8];
			z_flag = (res == 16'h0000);
		end
		else if (opcode == DEC)
		begin
			res = opd_1 - 1'b1;
			c_flag = res[8];
			z_flag = (res == 16'h0000);
		end
		else if (opcode == INC)
		begin
			res = opd_1 + 1'b1;
			c_flag = res[8];
			z_flag = (res == 16'h0000);
		end
		else if (opcode == AND)
		begin
			res = opd_1 & opd_2;
			z_flag = (res == 16'h0000);
		end
		else if (opcode == OR)
		begin
			res = opd_1 | opd_2;
			z_flag = (res == 16'h0000);
		end
		else if (opcode == XOR)
		begin
			res = opd_1 ^ opd_2;
			z_flag = (res == 16'h0000);
		end
		else if (opcode == NOT)
		begin
			res = ~opd_1;
			z_flag = (res == 16'h0000);
		end
		else if (opcode == SHL)
		begin
			res = opd_1 << 1;
			z_flag = (res == 16'h0000);
		end
		else if (opcode == SHR)
		begin				
			res = opd_1 >> 1;
			z_flag = (res == 16'h0000);
		end
		else
		begin
			res = 16'h0000;
			c_flag = 1'b0;
			z_flag = 1'b0;
		end

	end

endmodule
