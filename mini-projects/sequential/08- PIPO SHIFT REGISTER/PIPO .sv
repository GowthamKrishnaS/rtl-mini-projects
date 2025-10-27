// Parallel-In Parallel-Out (PIPO) Register
// Description: 4-bit register with asynchronous reset and parallel load capability
// Inputs:
//   clk  - Clock signal (positive edge triggered)
//   rst  - Asynchronous reset (active high)
//   load - Load enable signal (active high)
//   PI   - Parallel input data [3:0]
// Outputs:
//   PO   - Parallel output data [3:0]

module pipo (
    input  logic       clk, rst, load,
    input  logic [3:0] PI,
    output logic [3:0] PO
);
    
    // Sequential logic block triggered on clock positive edge or reset
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            // Asynchronous reset: clear all output bits
            PO <= 4'b0;
        end
        else if (load) begin
            // Load new data from parallel input when load is enabled
            PO <= PI;
        end
        // Note: If load=0, PO retains its current value (register behavior)
    end
    
endmodule
