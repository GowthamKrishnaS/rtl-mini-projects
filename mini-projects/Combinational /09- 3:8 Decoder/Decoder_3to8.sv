module decoder_3to8(
input logic [2:0] de_in,
output logic [7:0] de_out
);

always_comb begin
case(de_in)
3'b000  : de_out = 8'b00000001;
3'b001  : de_out = 8'b00000010;
3'b010  : de_out = 8'b00000100;
3'b011  : de_out = 8'b00001000;
3'b100  : de_out = 8'b00010000;
3'b101  : de_out = 8'b00100000;
3'b110  : de_out = 8'b01000000;
3'b111  : de_out = 8'b10000000;
default : de_out = 8'b00000000;
endcase
end 
endmodule
