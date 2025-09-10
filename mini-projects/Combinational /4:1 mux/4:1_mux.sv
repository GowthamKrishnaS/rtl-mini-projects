//=============================================
// 4-to-1 multiplexer
//=============================================

module mux4to1 #(
    parameter width = 32
)(
    input  logic [width-1:0] d0,
    input  logic [width-1:0] d1,
    input  logic [width-1:0] d2,
    input  logic [width-1:0] d3,
    input  logic [1:0]       sel,
    output logic [width-1:0] out
);

    // Combinational logic for 4-to-1 MUX
    always_comb begin
        case (sel)
            2'b00: out = d0;   // Select d0 when sel=00
            2'b01: out = d1;   // Select d1 when sel=01
            2'b10: out = d2;   // Select d2 when sel=10
            2'b11: out = d3;   // Select d3 when sel=11
            default: out = '0; // Default case (zero)
        endcase
    end

endmodule

