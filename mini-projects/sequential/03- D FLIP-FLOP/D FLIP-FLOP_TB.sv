`timescale 1ns/1ps

module tb_d_ff;

    // Testbench signals
    logic clk;
    logic rst;
    logic D;
    logic Q;

    // DUT instantiation
    d_ff dut (
        .clk(clk),
        .rst(rst),
        .D(D),
        .Q(Q)
    );

    // Clock generation: 10ns period
    initial clk = 0;
    always #5 clk = ~clk;

    // === Task to apply D and check expected Q ===
    task automatic apply_and_check(input logic D_in, input logic expected_Q);
        begin
            D = D_in;
            @(posedge clk);  // wait for next clock edge
            #1;              // small delay to let Q update
            if (Q !== expected_Q) begin
                $error("FAIL: D=%0b Expected Q=%0b, Got Q=%0b at time %0t",
                        D_in, expected_Q, Q, $time);
            end else begin
                $display("PASS: D=%0b Q=%0b at time %0t", D_in, Q, $time);
            end
        end
    endtask

    // === Stimulus process ===
    initial begin
        // Initialize
        rst = 1;
        D   = 0;
        @(posedge clk);    // wait for first clock edge
        rst = 0;

        // Start applying test cases
        apply_and_check(0, 0);  // D=0, expect Q=0
        apply_and_check(1, 1);  // D=1, expect Q=1
        apply_and_check(0, 0);  // D=0, expect Q=0
        apply_and_check(1, 1);  // D=1, expect Q=1
        apply_and_check(1, 1);  // D=1, hold, expect Q=1
        apply_and_check(0, 0);  // D=0, expect Q=0

        // Test asynchronous reset in middle
        rst = 1;
        #2;                    // pulse reset for 2ns
        rst = 0;
        @(posedge clk);         // wait for clock edge
        if (Q !== 0) $error("FAIL: Async reset did not set Q=0");
        else $display("PASS: Async reset worked, Q=0");

        $display("All test cases completed ?");
        $finish;
    end

endmodule

