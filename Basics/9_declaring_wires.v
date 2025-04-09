`default_nettype none

module top_module(
    input a, b, c, d,
    output out, out_n);

    wire w1, w2;
    assign w1 = a & b;
    assign w2 = c & d;
    assign out = w3;
    assign out_n = ~w3;

endmodule