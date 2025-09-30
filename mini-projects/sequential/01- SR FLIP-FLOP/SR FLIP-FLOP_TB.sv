`timescale 1ns/1ps

module tb_sr_flip_flop;

    // DUT signals
    logic clk;
    logic rst_n;
    logic S;
    logic R;
    logic Q;

    // Instantiate DUT
    sr_flip_flop dut (
        .clk(clk),
        .rst_n(rst_n),
        .S(S),
        .R(R),
        .Q(Q)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // -------------------------
    // Tasks
    // -------------------------
    task automatic test_case(input logic S_in, input logic R_in, input logic expected, string desc);
        integer passed_local;
        integer total_local;
        begin
            S = S_in;
            R = R_in;
            #10;
            if (Q === expected)
                $display("PASS: %s at time %0t, Q=%b", desc, $time, Q);
            else
                $display("FAIL: %s at time %0t, Q=%b, expected=%b", desc, $time, Q, expected);
        end
    endtask

    task automatic async_reset();
        begin
            rst_n = 0; #7;
            rst_n = 1; #10;
        end
    endtask

    // -------------------------
    // Test sequence
    // -------------------------
    initial begin
        // Initialize inputs
        S = 0; R = 0; rst_n = 1;
        #2;

        // Async reset
        async_reset();

        // Test all SR cases
        test_case(0, 0, Q, "Hold");
        test_case(1, 0, 1'b1, "Set");
        test_case(0, 0, 1'b1, "Hold after Set");
        test_case(0, 1, 1'b0, "Reset");
        test_case(1, 1, 1'bx, "Invalid");

        $display("Self-Test Completed. Check console for PASS/FAIL");
        $finish;
    end

endmodule

