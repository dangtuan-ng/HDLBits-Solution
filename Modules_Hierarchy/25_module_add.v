module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] sum_l, sum_h;
    wire cout_l, cout_h;
    add16 add_l (a[15:0], b[15:0], 0, sum_l, cout_l);
    add16 add_h (a[31:16], b[31:16], cout_l, sum_h, cout_h);
    assign sum = {sum_h, sum_l};
endmodule