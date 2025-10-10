// SISO Module
module siso(
    input logic clk, rst,
    input logic si,
    output logic so
);
    logic [3:0] data;

    always_ff @(posedge clk or posedge rst) begin
        if(rst) begin
            data <= 4'b0000;
        end else begin
            data <= {data[2:0], si};  // Left shift
        end
    end 
    assign so = data[3];
endmodule
