module top_module (
    input [7:0] in,
    output parity
);
// even parity, XOR of all 8 data bits
    assign parity = ^ in;
endmodule