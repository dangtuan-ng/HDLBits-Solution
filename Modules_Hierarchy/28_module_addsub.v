// mạch adder-subtractor
// thực hiện phép cộng a+b+0 hoặc a+ ~b +1 tuỳ theo tín hiệu điều khiển

module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire coutl;
    wire [31:0] b_xor;
    // XOR toàn bộ b với tín hiệu sub
    // Khi sub = 0: b_xor = b (giữ nguyên)
    // Khi sub = 1: b_xor = ~b (đảo bit)
    assign b_xor = b ^ {32{sub}};


    add16 addl (a[15:0], b_xor[15:0], sub, sum[15:0], coutl);
    add16 addh (a[31:16], b_xor[31:16], coutl, sum[31:16]);
endmodule