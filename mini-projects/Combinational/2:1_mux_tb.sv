module mux_2to1_tb;
    logic [31:0] a;
    logic [31:0] b;
    logic sel;
    logic [31:0] m_out;

    mux_2to1 dut(.*);

    initial begin
        // Set inputs
        a = 32'hAAAA_AAAA;
        b = 32'hBBBB_BBBB;

        // Test 1: sel=1
        sel = 1; #10;
        assert (m_out === a) else
            $fatal("Assertion failed: sel=1, out=%h, expected=%h", m_out, a);
        $display("Test passed: sel=1, out=%h", m_out);   // Display message if assertion passed

        // Test 2: sel=0
        sel = 0; #10;
        assert (m_out === b) else
            $fatal("Assertion failed: sel=0, out=%h, expected=%h", m_out, b);
        $display("Test passed: sel=0, out=%h", m_out);   // Display message if assertion passed

        $display("All tests passed!");
        $finish;
    end
endmodule

