module Turnstile_Example (
	input i_Reset,
	input i_Clk,
	input i_Coin,
	input i_Push,
	output o_Locked);
	
	localparam LOCKED = 1'b0;
	localparam UNLOCKED = 1'b1;
	reg r_Current_State, r_Next_State;
	
	// Current state register
	always @(posedge i_Clk or posedge i_Reset) begin
		if (i_Reset)
			r_Current_State <= LOCKED;
		else
			r_Current_State <= r_Next_State;
	end
		
	// Next state determination
	always @(r_Current_State or i_Coin or i_Push) begin
		r_Next_State <= r_Current_State;
		case (r_Current_State)
			LOCKED:
				if (i_Coin) r_Next_State <= UNLOCKED;
			UNLOCKED:
				if (i_Push) r_Next_State <= LOCKED;
		endcase
	end
	
	assign o_Locked = (r_Current_State == LOCKED);
endmodule