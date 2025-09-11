//========================================
//          8-to-1 Multiplexer
//========================================

module mux_8to1 #(
    parameter width = 32
)(
    input  logic [width-1:0] d0, d1, d2, d3, d4, d5, d6, d7,
    input  logic [2:0]       sel,
    output logic [width-1:0] m_out
);

    // Combinational logic for 8-to-1 MUX
    always_comb begin
        case (sel)
            3'b000: m_out = d0;  // Select d0
            3'b001: m_out = d1;  // Select d1
            3'b010: m_out = d2;  // Select d2
            3'b011: m_out = d3;  // Select d3
            3'b100: m_out = d4;  // Select d4
            3'b101: m_out = d5;  // Select d5
            3'b110: m_out = d6;  // Select d6
            3'b111: m_out = d7;  // Select d7
            default: m_out = '0; // Default case
        endcase
    end

endmodule

