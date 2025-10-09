`timescale 1ns/1ps

module t_ff_tb;

    // Signals
    logic clk;
    logic rst;
    logic T;
    logic Q;

    // Instantiate the T flip-flop
    t_ff uut (
        .clk(clk),
        .rst(rst),
        .T(T),
        .Q(Q)
    );

    // Clock generation (10 ns period)
    initial clk = 0;
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        $display("Starting T Flip-Flop Self-Test...");

        // Initialize signals
        rst = 1; T = 0;
        #12;        // Apply reset for some time
        rst = 0;

        // Step 1: T=0, output should not change
        T = 0;
        repeat (3) @(posedge clk);
        if (Q !== 1'b0) $display("FAIL: Q changed when T=0");
        else $display("PASS: Q stable when T=0");

        // Step 2: T=1, output should toggle
        T = 1;
        repeat (4) @(posedge clk);
        // Expected toggle pattern: Q should flip each clock
        $display("Q after toggling: %b", Q);

        // Step 3: Apply asynchronous reset
        rst = 1;
        #3;          // Reset applied asynchronously
        if (Q !== 1'b0) $display("FAIL: Async reset failed");
        else $display("PASS: Async reset works");

        rst = 0;
        T = 1;
        repeat (3) @(posedge clk);
        $display("Final Q: %b", Q);

        $display("T Flip-Flop Self-Test Completed.");
        $stop;
    end

endmodule

