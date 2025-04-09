module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    genvar i;
    generate for (i=0; i<100; i = i+1) begin: full_adder_instances
        full_adder fa(a[i], b[i], i == 0 ?  cin : cout[i-1], sum[i], cout[i]);
    end
    endgenerate
endmodule

module full_adder (input a, input b, input cin, output sum, output cout);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a^b));
endmodule