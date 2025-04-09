// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations

    parameter A = 0, B = 1;

    reg state;

    always @(posedge clk) begin
        if (reset) begin  
            state <= B;
        end 
        else begin
            case (state)
                B:
                    if(in) state <= B;
                    else state <= A;
                A:
                    if(in) state <= A;
                    else state <= B;
            endcase
        end
    end

    assign out = (state == B);

endmodule
