 module t_ff(
    input logic clk,
    input logic rst,   // asynchronous active-high reset
    input logic T,     // toggle input
    output logic Q
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            Q <= 1'b0;      // async reset
        else if (T)
            Q <= ~Q;        // toggle
    end

endmodule


