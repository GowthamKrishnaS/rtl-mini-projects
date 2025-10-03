`timescale 1ns/1ps

module tb_jk_ff;

    // Testbench signals
    logic clk;
    logic rst;
    logic J, K;
    logic Q;

    // DUT instantiation
    jk_ff dut (
        .clk(clk),
        .rst(rst),
        .J(J),
        .K(K),
        .Q(Q)
    );

    // Clock generation: 10ns period
    initial clk = 0;
    always #5 clk = ~clk;

    // === Task to apply stimulus and check expected output ===
    task automatic apply_and_check(input logic j_in, k_in, input logic expected_q);
        begin
            J = j_in;
            K = k_in;
            @(posedge clk); // wait for clock edge
            #1; // small delay to allow update
            if (Q !== expected_q) begin
                $error("FAIL: J=%0b K=%0b Expected Q=%0b, Got Q=%0b at time %0t",
                        j_in, k_in, expected_q, Q, $time);
            end else begin
                $display("PASS: J=%0b K=%0b Q=%0b at time %0t",
                         j_in, k_in, Q, $time);
            end
        end
    endtask

    // === Stimulus process ===
    initial begin
        // Initialize
        rst = 1;
        J   = 0;
        K   = 0;
        @(posedge clk);
        rst = 0;

        // Start applying test cases
        // Reset state: Q=0
        apply_and_check(0, 0, 0);  // Hold, expect still 0
        apply_and_check(1, 0, 1);  // Set, expect 1
        apply_and_check(0, 0, 1);  // Hold, expect 1
        apply_and_check(0, 1, 0);  // Reset, expect 0
        apply_and_check(1, 1, 1);  // Toggle, expect 1 (since prev=0 ? toggle=1)
        apply_and_check(1, 1, 0);  // Toggle, expect 0 (prev=1 ? toggle=0)
        apply_and_check(0, 0, 0);  // Hold, expect 0

        $display("All test cases completed ?");
        $finish;
    end

endmodule

