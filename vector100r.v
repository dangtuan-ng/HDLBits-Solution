module top_module( 
    input [99:0] in,
    output [99:0] out
);
    // genvar i;
    // generate
    //     for (i=0; i<100; i=i+1) begin : reverse_bits
    //         assign out[i] = in[99-i];
    //     end
    // endgenerate

    always @(*) begin
        for (int i=0;i<$bits(out);i++)
            out[i] = in[$bit(out)-i-1];
    end

endmodule
