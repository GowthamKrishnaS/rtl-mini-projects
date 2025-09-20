//===============================
// 3-to-8 Decoder Testbench
//===============================
module decoder_3to8_tb;

    // Input to the decoder
    logic [2:0] de_in;
    // Output from the decoder
    logic [7:0] de_out;

    // Instantiate the decoder module using port shorthand
    decoder_3to8 dut(.*);

    //-------------------------------
    // Task to check output for a given input
    //-------------------------------
    task automatic check_de(input [2:0] d_in, input [7:0] expected);
        begin
            de_in = d_in;   // Apply input to the decoder
            #10;            // Wait for combinational logic to settle

            // Check if the output matches expected value
            assert(de_out === expected) begin
                $display("PASS: in = %b | out = %b | expected = %b", d_in, de_out, expected);
            end else begin
                $error("FAIL: in = %b | out = %b | expected = %b", d_in, de_out, expected);
            end
        end
    endtask

    //-------------------------------
    // Initial block to run all testcases
    //-------------------------------
    initial begin
        $display("**********************");
        $display("     Test starting    ");
        $display("**********************");

        // Check all possible input combinations
        check_de(3'b000, 8'b00000001);
        check_de(3'b001, 8'b00000010);
        check_de(3'b010, 8'b00000100);
        check_de(3'b011, 8'b00001000);
        check_de(3'b100, 8'b00010000);
        check_de(3'b101, 8'b00100000);
        check_de(3'b110, 8'b01000000);
        check_de(3'b111, 8'b10000000);

        $display("*****************************");
        $display("  All Testcases Finished     ");
        $display("*****************************");

        $finish; // End simulation
    end

endmodule
