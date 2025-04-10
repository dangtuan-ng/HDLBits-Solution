module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    localparam [2:0] above_s3 = 3'd0, // water level : above s3
                     s3_s2_nom = 3'd1, // s3 ~ s2 and the previous level is lower
                     s3_s2_sup = 3'd2, // s3 ~ s2 and the previous level is higher
                     s2_s1_nom = 3'd3, // s2 ~ s1 and the previous level is lower
                     s2_s1_sup = 3'd4, // s2 ~ s1 and the previous level is higher
                     below_s1 = 3'd5; // below s1
    reg [2:0] state;

    always @(posedge clk) begin
        if(reset) state <= below_s1;
        else begin
            case(state)
                above_s3: state <= s[3] ? above_s3 : s3_s2_sup;
                s3_s2_nom: state <= s[3] ? above_s3 : (s[2] ? s3_s2_nom : s2_s1_sup);
                s3_s2_sup: state <= s[3] ? above_s3 : (s[2] ? s3_s2_sup : s2_s1_sup);
                s2_s1_nom: state <= s[2] ? s3_s2_nom : (s[1] ? s2_s1_nom : below_s1);
                s2_s1_sup: state <= s[2] ? s3_s2_nom : (s[1] ? s2_s1_sup : below_s1);
                below_s1: state <= s[1] ? s2_s1_nom : below_s1;
            endcase
        end
    end

    assign {fr3, fr2, fr1, dfr} = 
        (state == above_s3) ? 4'b0000 :
        (state == s3_s2_nom) ? 4'b0010 :
        (state == s3_s2_sup) ? 4'b0011 :
        (state == s2_s1_nom) ? 4'b0110 :
        (state == s2_s1_sup) ? 4'b0111 :
        (state == below_s1) ? 4'b1111 : 4'bxxxx;

endmodule
