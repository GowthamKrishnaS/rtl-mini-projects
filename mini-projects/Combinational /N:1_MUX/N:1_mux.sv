//=============================================
// Parameterized N-to-1 Multiplexer
//=============================================
module nto1_mux #(
    parameter width= 32,   // Bit-width of each input
    parameter N     = 8     // Number of inputs
)(
    input  logic [width-1:0] d [0:N-1],        // Array of N inputs
    input  logic [$clog2(N)-1:0] sel,          // Select signal
    output logic [width-1:0] m_out             // Output
);

    // Combinational selection
    always_comb begin
        m_out = d[sel];
    end

endmodule

