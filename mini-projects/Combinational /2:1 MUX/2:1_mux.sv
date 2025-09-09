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
        if (sel) begin
            m_out = a;               // Select a when sel=1
        end else begin
            m_out = b;               // Select b when sel=0
        end
    end

endmodule

