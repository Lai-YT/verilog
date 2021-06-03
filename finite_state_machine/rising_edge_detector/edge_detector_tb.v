
module edge_detector_tb;
	reg clk, reset, level;
	wire tick;
	
	mealy_detector me_detect(
							.clk(clk),
							.reset(reset),
							.level(level),
							.tick(tick)
						);
	moore_detector	mo_detect(
							.clk(clk),
							.reset(reset),
							.level(level),
							.tick(tick)
						);
						
						
	initial
	begin
		clk = 1'b0;
		reset = 1'b0;
		level = 1'b0;
	end
	
	
	always
		#1
		clk = ~clk;
		
	always
		#100
		reset = ~reset;
		
	always
		#10
		level = ~level;


endmodule
