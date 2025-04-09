module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    localparam A=0, B=1; 
    reg current_state;

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if(areset)
            current_state <= B;
        else begin
            case(current_state)
                B:
                    if(in == 0)
                        current_state <= A;
                    else
                        current_state <= B;
                A:
                    if(in == 0)
                        current_state <= B;
                    else
                        current_state <= A;
            endcase
        end
    end

    assign out = (current_state == B);
endmodule
