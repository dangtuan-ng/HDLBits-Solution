module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] suml, sumh;
    wire cout1, cout2;
    add16 addl (a[15:0], b[15:0], 0, suml, cout1);
    add16 addh (a[31:16], b[31:16], cout1, sumh, cout2);
    assign sum = {sumh, suml};
endmodule



module add1 (input a, input b, input cin, output sum, output cout);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a^b));
endmodule

// Suy nghĩ theo logic phép cộng:

// Sum: Kết quả bit của phép cộng là 1 khi có số lẻ bit 1 trong ba bit (a, b, cin)

// Điều này đúng với phép XOR 3 biến: a ^ b ^ cin

// Cout: Mang 1 sang bit kế tiếp khi phép cộng vượt quá 1

// Điều này xảy ra khi có ít nhất 2 bit trong 3 bit là 1
// Hoặc nói cách khác, cout = 1 khi:

// Cả a và b đều là 1 (a & b)
// Hoặc khi cin = 1 và một trong hai bit a hoặc b là 1 (cin & (a ^ b))


// Phương pháp thực tế:

// Chia phép cộng thành hai bước: cộng a và b, sau đó cộng kết quả với cin
// Bit tổng của a+b là a^b
// Carry của a+b là a&b
// Thêm cin vào tổng: (a^b)^cin = a^b^cin
// Carry mới phát sinh khi cin=1 và a^b=1: cin&(a^b)
// Tổng hợp carry: (a&b) | (cin&(a^b))