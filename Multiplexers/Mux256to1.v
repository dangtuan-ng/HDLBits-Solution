module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );
    genvar i;
	generate
		for(i = 0; i < 256; i++) begin: mux
            assign out = in[sel]
			8'di: out = in[i];
		
        end
    endgenerate
endmodule
