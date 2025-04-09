module top_module(
	input clk,
	input reset,
	input j,
	input k,
	output out);
	
	parameter OFF = 0, ON = 1;
	reg state;

	always @(posedge clk) begin
		if(reset) state <= OFF;
		else begin
			case(state)
				OFF:
					if(j==0) state <= OFF;
					else state <= ON;
				ON:
					if(k==0) state <= ON;
					else state <= OFF;
			endcase
		end
	end

	assign out = (state == ON);

endmodule