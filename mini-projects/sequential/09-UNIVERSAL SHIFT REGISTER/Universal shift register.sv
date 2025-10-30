module universal_shift_reg #(
 parameter WIDTH = 8
)(
 input  logic rst, clk, load,
 input  logic Right_shift,
 input  logic Left_shift,
 input  logic Serial_in_right,
 input  logic Serial_in_left,
 input  logic [WIDTH-1:0] Parallel_in,  // Changed to vector
 output logic [WIDTH-1:0] Parallel_out, // Changed to vector
 output logic Serial_out_left,          // Added comma
 output logic Serial_out_right          // Fixed typo
);

logic [WIDTH-1:0] shift_reg;  // Corrected width

always_ff @(posedge clk or posedge rst) begin
 if(rst) begin
  shift_reg <= '0;
 end else begin
  case({load, Left_shift, Right_shift})
   3'b100: begin  // Load parallel data
    shift_reg <= Parallel_in;
   end
   3'b010: begin  // Left shift
    shift_reg <= {shift_reg[WIDTH-2:0], Serial_in_right};  // Fixed indices
   end
   3'b001: begin  // Right shift  
    shift_reg <= {Serial_in_left, shift_reg[WIDTH-1:1]};   // Fixed indices
   end
   3'b000: begin  // Hold
    shift_reg <= shift_reg;
   end
   default: begin  // Hold for other cases
    shift_reg <= shift_reg;
   end
  endcase
 end
end

assign Parallel_out = shift_reg;
assign Serial_out_left = shift_reg[WIDTH-1];   // Fixed signal name
assign Serial_out_right = shift_reg[0];        // Fixed signal name

endmodule
