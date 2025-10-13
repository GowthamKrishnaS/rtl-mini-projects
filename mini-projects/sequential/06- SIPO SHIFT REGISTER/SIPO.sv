module sipo(
input logic clk,rst,
input logic SI,
output logic [3:0] PO	
);
logic [3:0] data;
always_ff @(posedge clk or posedge rst) begin
if(rst)begin
data <=  4'b0000;
end else begin
data<= {data[2:0],SI};

end
end
assign PO = data ;
endmodule