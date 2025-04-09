// 8 bit 2's complement numbers adder

module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
);
 
    assign s = a + b;
    assign overflow = (~(a[7]^b[7]))&(a[7]^s[7]);
	// a signed overflow occurs when adding 2 positive numbers produces a negative result or vice versa
	// a, b has the same sign and opposite to the sign of sum
	// overflow can be detected by comparing the signs of the input and output numbers
	
endmodule
