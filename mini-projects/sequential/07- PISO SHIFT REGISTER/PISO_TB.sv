`timescale 1ns/1ps

module piso_tb;

    logic clk, rst, en;
    logic [3:0] PI;
    logic SO;

    // Instantiate DUT
    piso dut (
        .clk(clk),
        .rst(rst),
        .en(en),
        .PI(PI),
        .SO(SO)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize
        rst = 1; en = 0; PI = 0;
        @(posedge clk);
        rst = 0;

        // -------- Test 1: PI = 1011 --------
        en = 1; PI = 4'b1011; @(posedge clk);  // load
        en = 0;
        #1;
        // Check each bit with assertion
        $display(" PARALLEL IN =%b",PI);
        assert (SO == 1'b1) $display("Test1, Bit1 PASS bit 1=%b",PI[3]);
        @(posedge clk);#1;
        assert (SO == 1'b0) $display("Test1, Bit2 PASS bit 2=%b",PI[2]);
        @(posedge clk);#1;
        assert (SO == 1'b1) $display("Test1, Bit3 PASS bit 3=%b",PI[1]);
        @(posedge clk);#1;
        assert (SO == 1'b1) $display("Test1, Bit4 PASSbit  4=%b",PI[0]);
          #1;
        $display(" All simple assertions passed!");
        $finish;
    end

endmodule

