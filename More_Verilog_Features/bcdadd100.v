module top_module(
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum
); 
    genvar i;
    wire [99:0] carry; //wire to store carry bits.

    generate
        for (i = 0; i < 100; i = i + 1) begin: bcd_fadd_instances
            bcd_fadd fa(
                a[4*i +: 4], 
                b[4*i +: 4], 
                i == 0 ? cin : carry[i-1], 
                carry[i], 
                sum[4*i +: 4]);
        end
    endgenerate
    assign cout = carry[99];
endmodule