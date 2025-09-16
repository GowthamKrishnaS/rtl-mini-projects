//====================================================
// 4-to-2 Priority Encoder
// - Input  : 4-bit en_in
// - Output : 2-bit en_out (index of highest priority '1')
// - Priority: MSB (en_in[3]) has highest priority
//====================================================
module _priority_encoder(
     input  logic [3:0] en_in,   // encoder input lines
     output logic [1:0] en_out   // encoded output
);

    // Combinational always block for priority logic
    always_comb begin
        // Use casez so '?' works as don't-care
        casez(en_in)
            4'b1??? : en_out = 2'b11; // If bit[3]=1 ? highest priority ? "11"
            4'b01?? : en_out = 2'b10; // Else if bit[2]=1 ? output "10"
            4'b001? : en_out = 2'b01; // Else if bit[1]=1 ? output "01"
            4'b0001 : en_out = 2'b00; // Else if bit[0]=1 ? lowest priority ? "00"
            default : en_out = '0;    // No input active ? default to "00"
        endcase
    end 

endmodule

