`timescale 1ns/1ps

//=====================================================
//  Testbench: PIPO (Parallel-In Parallel-Out)
//  Type: Self-testing with assertions
//=====================================================

module pipo_tb;

    // DUT signals
    logic        clk, rst, load;
    logic [3:0]  PI;
    logic [3:0]  PO;

    // Instantiate DUT
    pipo dut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .PI(PI),
        .PO(PO)
    );

    // Clock generation: 10 ns period
    initial clk = 0;
    always #5 clk = ~clk;

    // Task for one test case
    task automatic check(input [3:0] P_I, input [3:0] P_O_exp);
        begin
            PI = P_I;
            load = 1;
            @(posedge clk);  // wait for one clock edge
            #1;
            assert (PO === P_O_exp)
                $display(" PASS | PI=%b | PO=%b", PI, PO);
            else
                $error(" FAIL | PI=%b | Expected=%b | Got=%b", PI, P_O_exp, PO);
        end
    endtask

    // Test sequence
    initial begin
        // Initialize and reset
        rst = 1;
        load  = 0;
        PI  = 4'b0000;
        #12;
        rst = 0;

        // Run test cases
        check(4'b1011, 4'b1011);
        check(4'b1001, 4'b1001);
        check(4'b0011, 4'b0011);
        check(4'b1010, 4'b1010);
        check(4'b1111, 4'b1111);

        $display(" All testcases completed successfully.");
        $finish;
    end

endmodule

