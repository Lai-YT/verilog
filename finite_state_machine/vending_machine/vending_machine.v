
/*
@input
	clk
		state is checked every clk change
	money
		0, 3: no money paid
		1:    20 dollars
		2:    50 dollars
	select:
		0, 3: no selection
		1:    20 dollars item
		2:    50 dollars item
@output
	item
		0: 20 dollars item
		1: 50 dollars item
	change
		0: no change
		1: 10 dollars back
		2: 30 dollars back
		3: 40 dollars back
*/
module vending_machine(clk, money, select, item, change);
	input wire clk;
	input wire[1:0] money, select;
	output reg[1:0] item, change;
	
	// money kinds
	localparam[1:0]
		ten = 2'b01, 
		fifty = 2'b10;
		
	// select kinds
	localparam[1:0]
		no_selection = 2'b00,
		get_twenty = 2'b01,
		get_fifty = 2'b10;
	
	// item kinds
	localparam[1:0]
		no_item = 2'b00,
		item_twenty = 2'b01, 
		item_fifty = 2'b10;
		
	// change kinds
	localparam[1:0]
		no_change = 2'b00,
		ten_back = 2'b01,
		thirty_back = 2'b10,
		forty_back = 2'b11;
	
	// states
	localparam[1:0] 
		start = 2'b00, 
		not_enough = 2'b01, 
		buy_twenty = 2'b10, 
		buy_all = 2'b11;
		
	reg[1:0]
		state = start, 
		next_state = start;
	
	reg[1:0]
		// this is flag, 1'b0 means not from start
		// needed to decide change
		come_from_start;

	always @(clk)
	begin
		if (state == start)
			come_from_start <= 1'b1;
		else
			come_from_start <= 1'b0;
		state <= next_state;
	end
		
	always @(state, money, select)
	begin
		next_state = state;
		item = no_item;
		change = no_change;
		// if the requirements aren't met, state still like a cycle
		
		case (state)
			start:
				if (money == ten)
					next_state = not_enough;
				else if (money == fifty)
					next_state = buy_all;
			
			not_enough:
				if (money == ten)
					next_state = buy_twenty;
				else if (money == fifty)
					next_state = buy_all;
		
			buy_twenty:
			begin
				item = item_twenty;
				next_state = start;
			end
			
			buy_all:
			// Special part is that if the buy_all state comes from start,
			// change should be 50 - select;
			// if from not_enough,
			// change should be 60 - select.
			begin
				next_state = start;
				if (select == get_twenty)
				begin
					item = item_twenty;
					if (come_from_start)
						change = thirty_back;
					else
						change = forty_back;
				end
				else
				begin
					item = item_fifty;
					if (~come_from_start)
						change = ten_back;
				end
			end
			
		endcase
	
	end
	

endmodule
