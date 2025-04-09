module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
	// SOP
	// assign out = (~a & ~c & ~d) | (~a & ~b & ~c & d) | (a & ~b & ~c) | (a & c & d) | (~a & b & c) | (~a & ~b & c & ~d);
	
	// POS
	assign out = (~a | ~b | c) & (a | ~b | c | ~d) & (a | b | ~c | ~d) & (~a | ~c | d);
endmodule
