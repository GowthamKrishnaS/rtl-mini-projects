module mux4to1 #(
parameter width=32
)(
    input logic [(width)-1:0] d0,
    input logic [(width)-1:0] d1,
    input logic [(width)-1:0] d2,
    input logic [(width)-1:0] d3,
    input logic [1:0] sel,
    output logic [(width)-1:0] out
);

    always_comb begin
        case(sel)
            2'b00:out=d0;
            2'b01:out=d1;
            2'b10:out=d2;
            2'b11:out=d3;
            default:out=32'b0;
    endcase
    end
 endmodule
