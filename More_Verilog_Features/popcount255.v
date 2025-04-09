module top_module (
    input [254:0] in,
    output reg [7:0] out
);
    always @(*) begin
        out = 8'd0;
        for (int i = 0; i <$bits(in); i++) begin
            if(in[i] == 1'b1) begin
                out++;
            end
        end
    end
endmodule
