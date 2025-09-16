//====================================================
// 8-to-3 Priority Encoder
// - Input  : en_in[7:0]
// - Output : en_out[2:0] (index of highest priority '1')
// - Priority: en_in[7] highest, en_in[0] lowest
//====================================================
module priority_encoder_8to3(
    input  logic [7:0] en_in,
    output logic [2:0] en_out
);
    always_comb begin
        casez(en_in)
            8'b1???????: en_out = 3'b111; // en_in[7]
            8'b?1??????: en_out = 3'b110; // en_in[6]
            8'b??1?????: en_out = 3'b101; // en_in[5]
            8'b???1????: en_out = 3'b100; // en_in[4]
            8'b????1???: en_out = 3'b011; // en_in[3]
            8'b?????1??: en_out = 3'b010; // en_in[2]
            8'b??????1?: en_out = 3'b001; // en_in[1]
            8'b???????1: en_out = 3'b000; // en_in[0]
            default    : en_out = 3'b000; // no input active
        endcase
    end
endmodule
