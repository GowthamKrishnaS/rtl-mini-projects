//===========================================================
// 2-to-4 Decoder Testbench (Self-testing)
//===========================================================
module decoder_2to4_tb;
    logic [1:0] de_in;   // Testbench input signal
    logic [3:0] de_out;  // Testbench output signal

    // Instantiate the DUT (Device Under Test)
    decoder_2to4 dut(.*);

    // Task for checking expected vs actual output
    task automatic check_de(input [1:0] d_in, input [3:0] expected);
        de_in = d_in;       // Apply stimulus
        #10;                // Wait for output to settle
        assert(de_out===expected) begin
            // Pass case
            $display("pass: d_in=%b | expected=%b | out=%b ", d_in, expected, de_out);
        end else begin
            // Fail case
            $error("failed: d_in=%b | expected=%b | out=%b ", d_in, expected, de_out);
        end
    endtask

    // Initial block for running test cases
    initial begin
        $display("**********************");
        $display("     Test starting    ");
        $display("**********************");

        // Apply testcases
        check_de(2'b00,4'b0001);
        check_de(2'b01,4'b0010);
        check_de(2'b10,4'b0100);
        check_de(2'b11,4'b1000);

        $display("*****************************");
        $display("  All  Testcases Finished    ");
        $display("*****************************");
        $finish; // End simulation
    end
endmodule

