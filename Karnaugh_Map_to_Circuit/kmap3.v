module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
	//SOP
	assign out = a | (~a & b & c);
	
	//POS
	// assign out = (a | c) & (a | b | ~c);
endmodule
