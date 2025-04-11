// Make a decade counter that counts 1 through 10, inclusive. The reset input is synchronous, and should reset the counter to 1.

module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);

    always @(posedge clk) begin
        if(reset || q == 4'd0 || q > 4'd10) q <= 4'd1;
        else begin
            if (q == 4'd10) q <= 4'd1;
            else q <= q + 1'd1;
        end
    end
    
endmodule
