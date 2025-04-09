module top_module (
    input [2:0] sel,
    input [3:0] data0, data1, data2, data3, data4, data5,
    output reg [3:0] out
);
    always@(*) begin
        case(sel)
            3'b000: out = data0;
            3'b001: out = data1;
            3'b010: out = data2;
            3'b011: out = data3;
            3'b100: out = data4;
            3'b101: out = data5;
            3'b110: out = 4'b0000;
            3'b111: out = 4'b0000;
            default: out = 4'b0000;
        endcase
    end
endmodule