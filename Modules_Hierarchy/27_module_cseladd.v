module top_module(
    input [31:0] a,
    input [31:0] b,    
    output [31:0] sum    
);
    wire cout1, cout2, cout3;
    wire [15:0] sumh0, sumh1;
    add16 addl (a[15:0], b[15:0], 0, sum[15:0], cout1);
    add16 addh0 (a[31:16], b[31:16], 0, sumh0, cout2);
    add16 addh1 (a[31:16], b[31:16], 1, sumh1, cout3);
    assign sum[31:16] = cout1 ? sumh1 : sumh0;
endmodule