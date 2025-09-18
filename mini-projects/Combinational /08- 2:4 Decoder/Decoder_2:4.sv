//===========================================================
// 2-to-4 Decoder Module
//===========================================================
module decoder_2to4(
    input  logic [1:0] de_in,   // 2-bit input to decoder
    output logic [3:0] de_out   // 4-bit one-hot output
);

    // Combinational logic for decoding
    always_comb begin
        case(de_in)
            2'b00  : de_out = 4'b0001;  // If input = 00 -> output = 0001
            2'b01  : de_out = 4'b0010;  // If input = 01 -> output = 0010
            2'b10  : de_out = 4'b0100;  // If input = 10 -> output = 0100
            2'b11  : de_out = 4'b1000;  // If input = 11 -> output = 1000
            default: de_out = 4'b0000;  // Default case (safety)
        endcase
    end
endmodule

