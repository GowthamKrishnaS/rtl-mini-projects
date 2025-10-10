module siso_tb;
    logic clk = 0;
    logic rst, si, so;
    
    // Instantiate DUT
    siso dut (.*);
    
    // Clock generation (10ns period)
    always #5 clk = ~clk;
    
    // Single automatic task for applying shifts
    task automatic apply_shift(input bit bit_in, input string step_name);
        si = bit_in;
        @(posedge clk);
        #1;  // Small delay after clock edge
        $display("[%s] data = %4b, so = %b", step_name, dut.data, so);
    endtask
    
    // Main test sequence
    initial begin
        // Initialize waveform dumping
        $dumpfile("siso_tb.vcd");
        $dumpvars(0, siso_tb);
        
        $display("=== SISO Shift Register Test ===");
        
        // Reset sequence
        rst = 1;
        si = 0;
        #15;
        rst = 0;
        $display("After reset: data = %4b", dut.data);
        
        // Apply shift sequence using the single task
        apply_shift(1, "Shift 1");
        apply_shift(0, "Shift 2");
        apply_shift(1, "Shift 3");
        apply_shift(1, "Shift 4");
        @(posedge clk);
        $display("\nTest complete.");
        $finish;
    end
endmodule

