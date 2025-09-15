//====================================================
// Testbench for 4-to-2 Priority Encoder
//====================================================
module encoder_priority_tb;
logic [3:0] en_in;    // input stimulus to DUT
logic [1:0] en_out;   // output from DUT

// Instantiate the DUT (priority encoder)
_priority_encoder dut(.*);

//----------------------------------------------------
// Task : check_en
// Description : applies input, waits, then compares
//               DUT output with expected value
//----------------------------------------------------
task automatic check_en(input [3:0] in, input [1:0] expected);
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
    check_en(4'b1000,2'b11);
    check_en(4'b0100,2'b10);
    check_en(4'b0010,2'b01);
    check_en(4'b0001,2'b00);

    // Multiple bits set ? highest priority taken
    check_en(4'b1010,2'b11);
    check_en(4'b0011,2'b01);
    check_en(4'b0001,2'b00);
    check_en(4'b0100,2'b10);
    check_en(4'b1111,2'b11);

    // End of simulation
    $display("All testcases completed ");
    $finish;
end
endmodule

