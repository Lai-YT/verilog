
module vending_machine_tb;
	
	reg clk;
	reg[1:0] money, select;
	wire[1:0] item, change;
	
	vending_machine 
		vendor(
			.clk(clk),
			.money(money),
			.select(select),
			.item(item),
			.change(change)
		);
	
	initial
	begin
		clk = 1'b0;
		money = 2'b00;
		select = 2'b00;
	end
	
	// there are 5 path to go:
	// 	1. start(money = 10)->not_enough(money = 10)->buy_twenty->start
	//		2. start(money = 10)->not_enough(money = 50)->buy_all(select = 20)->start
	//		3. start(money = 10)->not_enough(money = 50)->buy_all(select = 50)->start
	//		4. start(money = 50)->buy_all(select = 20)->start
	//		5. start(money = 50)->buy_all(select = 50)->start
	
	always
		#1
		clk = ~clk;
		
	always
	begin
	// path 1
		// start(10)
		#3
		money = 2'b01;
		#1
		money = 2'b00;
		// not_enough(10)
		#3
		money = 2'b01;
		#1
		money = 2'b00;
		// buy_twenty
		
	// path 2
		// start(10)
		#3
		money = 2'b01;
		#1
		money = 2'b00;
		// not_enough(50)
		#3
		money = 2'b10;
		#1
		money = 2'b00;
		// buy_all(20)
		#3
		select = 2'b01;
		#1
		select = 2'b00;
		
	// path 3
		// start(10)
		#3
		money = 2'b01;
		#1
		money = 2'b00;
		// no_enough(50)
		#3
		money = 2'b10;
		#1
		money = 2'b00;
		// buy_all(50)
		#3
		select = 2'b10;
		#1
		select = 2'b00;
		
	// path 4
		//start(50)
		#3
		money = 2'b10;
		#1
		money = 2'b00;
		// buy_all(20)
		#3
		select = 2'b01;
		#1
		select = 2'b00;
		
	// path 5
		// start(50)
		#3
		money = 2'b10;
		#1
		money = 2'b00;
		// buy_all(50)
		#3
		select = 2'b10;
		#1
		select = 2'b00;
		
		#5
		$finish;
		
	end
	
	
endmodule
