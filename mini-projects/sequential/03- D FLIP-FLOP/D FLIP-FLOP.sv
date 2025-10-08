module d_ff (
    input  logic clk,   // Clock
    input  logic rst,   // Asynchronous reset
    input  logic D,     // Data input
    output logic Q      // Output
);

always_ff @(posedge clk or posedge rst) begin
    if (rst)
        Q <= 1'b0;
    else
        Q <= D;         // Follows input
end

endmodule

