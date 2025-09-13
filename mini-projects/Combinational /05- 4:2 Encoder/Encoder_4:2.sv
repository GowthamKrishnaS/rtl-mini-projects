//=============================================
// 4-to-2 Encoder
//=============================================
// Function:
//   - Converts one-hot 4-bit input into a 2-bit binary output
//   - Example: 
//        en_in = 0001 ? en_out = 00
//        en_in = 0010 ? en_out = 01
//        en_in = 0100 ? en_out = 10
//        en_in = 1000 ? en_out = 11
//   - Default case handles invalid inputs (multiple 1s or no 1s)
//=============================================

module encoder_4to2(
    input  logic [3:0] en_in,   // 4-bit one-hot input
    output logic [1:0] en_out   // 2-bit binary output
);

    // Combinational logic block
    always_comb begin
        case(en_in)
            4'b0001 : en_out = 2'b00; // D0 active
            4'b0010 : en_out = 2'b01; // D1 active
            4'b0100 : en_out = 2'b10; // D2 active
            4'b1000 : en_out = 2'b11; // D3 active
            default : en_out = '0;    // Invalid input ? output all zeros
        endcase 
    end 

endmodule

