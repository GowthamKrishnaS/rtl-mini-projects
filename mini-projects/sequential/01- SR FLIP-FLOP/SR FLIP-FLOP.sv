module sr_flip_flop(
    input  logic S,
    input  logic R,
    input  logic clk,
    input  logic rst_n, // active-low asynchronous reset
    output logic Q
);

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            Q <= 1'b0;  // reset
        end else begin
            case ({S, R})
                2'b10: Q <= 1'b1;   // Set
                2'b01: Q <= 1'b0;   // Reset
                2'b00: Q <= Q;      // Hold
                2'b11: Q <= 1'bx;   // Invalid
                default: Q <= 1'b0; // Safety
            endcase
        end
    end

endmodule
