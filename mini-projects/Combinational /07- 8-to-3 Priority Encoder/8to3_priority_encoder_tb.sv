//====================================================
// Testbench for 8-to-3  Priority Encoder
//====================================================
module encoder_priority_8to3_tb;
logic [7:0] en_in;    // input stimulus to DUT
logic [2:0] en_out;   // output from DUT

// Instantiate the DUT (priority encoder)
priority_encoder_8to3 dut(.*);

//----------------------------------------------------
// Task : check_en
// Description : applies input, waits, then compares
//               DUT output with expected value
//----------------------------------------------------
task automatic check_en(input [7:0] in, input [2:0] expected);
    en_in = in;       // drive DUT input
    #10;              // wait for combinational settle
    // Assertion: compares expected vs. actual

    assert(expected === en_out)
        $display("pass: en_in = %b | en_out =%b | expected = %b",in,en_out,expected);
    else
        $error("failed: en_in = %b | en_out =%b | expected = %b",in,en_out,expected);
endtask

//----------------------------------------------------
// Initial block: runs a set of testcases
//----------------------------------------------------
initial begin
    // Single bit tests
    check_en(8'b10000000,3'b111);
    check_en(8'b01000000,3'b110);
    check_en(8'b00100000,3'b101);
    check_en(8'b00010000,3'b100);
    check_en(8'b00001000,3'b011);
    check_en(8'b00000100,3'b010);
    check_en(8'b00000010,3'b001);
    check_en(8'b00000001,3'b000);
    // Multiple bits set ? highest priority taken

    check_en(8'b10010000,3'b111);
    check_en(8'b00001001,3'b011);
    check_en(8'b00100100,3'b101);
    check_en(8'b01000010,3'b110);
    check_en(8'b00011001,3'b100);
    // End of simulation
    $display("All testcases completed ");
    $finish;
end
endmodule


