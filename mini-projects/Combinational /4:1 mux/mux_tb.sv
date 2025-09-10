module mux_tb;
    // Testbench signals
    logic [31:0] d0, d1, d2, d3;
    logic [1:0]  sel;
    logic [31:0] out;

    // DUT instantiation
    mux41 dut(.*);

    // Task for self-checking
    task automatic check_mux(input [1:0] s, input [31:0] expected);
        sel = s;
        #1; // small delay to allow propagation

        // Assertion
        assert (out === expected)
            $display("PASS: sel=%b ? out=%h (expected=%h)", s, out, expected);
        else
            $error("FAIL: sel=%b ? out=%h (expected=%h)", s, out, expected);
    endtask

    initial begin
        // Initialize inputs
        d0 = 32'hAAAA_AAAA;
        d1 = 32'hBBBB_BBBB;
        d2 = 32'hCCCC_CCCC;
        d3 = 32'hDDDD_DDDD;

        // Run checks
        check_mux(2'b00, d0);
        check_mux(2'b01, d1);
        check_mux(2'b10, d2);
        check_mux(2'b11, d3);

        $display("? All testcases completed.");
        $finish;
    end
endmodule

