// Build a 100bit left/right rotator, with synchronous load and left/right enable. A rotator shifts-in the shifted-out bit from the other end of the register, unlike a shifter that discards the shifted-out bit and shifts in a zero. If enabled, a rotator rotates the bits around and does not modify/discard them.

// load: Loads shift register with data[99:0] instead of rotating.
// ena[1:0]: Chooses whether and which direction to rotate.
// 2b01tates right by one bit
// 210otates left by one bit
// 20b11 do not rotate.
// q: The contents of the rotator.

module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q); 

    always @(posedge clk)
    begin
        if(load) q <= data; // load shift register with data and not rotating
        else if(ena == 2'b01) q <= {q[0], q[99:1]}; // rotate right 1 bit
        else if(ena == 2'b10) q <= {q[98:0], q[99]}; // rotate left 1 bit
    end

endmodule
