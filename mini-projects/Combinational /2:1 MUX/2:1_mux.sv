//=============================================
// 2-to-1 mutiplexer
//=============================================

module mux_2to1#(
parameter width= 32)
(
    input  logic [width-1:0] a,
    input  logic [width-1:0] b,
    input  logic             sel,
    output logic [width-1:0] m_out
);

    // Combinational logic for 2-to-1 MUX
    always_comb begin
         m_out = (sel) ? a : b;
    end

endmodule

