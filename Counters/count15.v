// Build a 4-bit binary counter that counts from 0 through 15, inclusive, with a period of 16. The reset input is synchronous, and should reset the counter to 0.

module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);

    always @(posedge clk) begin
        if(reset) q <= 4'b0;
        else begin
            if(q == 4'd15) q <= 4'd0;
            else q <= q + 1'b1;
        end
    end


endmodule
