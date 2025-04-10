module top_module(
    input clk,
    input in,
    input areset,
    output out
);

    parameter A = 0, B = 1, C = 2, D = 3;
    reg [1:0] state;

    always @(posedge clk or posedge areset) begin
        if(areset) state <= A;
        else begin
            case(state)
                A:
                    if(in==0) state <= A;
                    else state <= B;
                B:
                    if(in==0) state <= C;
                    else state <= B;
                C:
                    if(in==0) state <= A;
                    else state <= D;
                D:
                    if(in==0) state <= C;
                    else state <= B;
            endcase
        end
    end

    assign out = (state == D);

endmodule