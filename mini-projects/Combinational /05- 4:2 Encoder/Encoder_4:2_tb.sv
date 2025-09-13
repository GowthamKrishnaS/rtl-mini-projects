//=============================================
// 4-to-2 Encoder Testbench (Self-Checking)
//=============================================
module encoder_4to2_tb;

    // Testbench signals
    logic [3:0] en_in;   // 4-bit encoder input (one-hot)
    logic [1:0] en_out;  // 2-bit encoder output (binary code)

    // Instantiate Device Under Test (DUT)
    // Using .* shorthand to automatically connect signals with the same name
    encoder_4to2 dut(.*);

    //===============================================================
    // Task: check_encoder
    // Purpose: Apply input, wait for DUT response, and compare output
    //===============================================================
    task automatic check_encoder(input [3:0] en, input [1:0] expected);
        en_in = en;     // Apply input to DUT
        #1;             // Small delay for combinational logic to settle

        // Assertion: check if DUT output matches expected value
        assert(en_out === expected)
            $display("pass: en_out=%b | en_in=%b | expected=%b",
                     en_out, en_in, expected);   // If correct, print pass
        else
            $error("failed: en_out=%b | en_in=%b | expected=%b",
                   en_out, en_in, expected);     // If wrong, print error
    endtask

    //===============================================================
    // Initial block: apply test cases
    //===============================================================
    initial begin
        // Valid one-hot test cases
        check_encoder(4'b0001, 2'b00);  // D0 active ? output 00
        check_encoder(4'b0010, 2'b01);  // D1 active ? output 01
        check_encoder(4'b0100, 2'b10);  // D2 active ? output 10
        check_encoder(4'b1000, 2'b11);  // D3 active ? output 11

        // End of test
        $display("All test cases finished ");
        $finish;  // Stop simulation
    end

endmodule

