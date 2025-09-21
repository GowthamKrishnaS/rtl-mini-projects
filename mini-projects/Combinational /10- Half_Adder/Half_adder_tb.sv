`timescale 1ns/1ps

module half_adder_tb;

    // Testbench signals
    logic A, B;
    logic Sum, Cout;

    // Instantiate the DUT (Device Under Test)
    half_adder dut (
        .A(A),
        .B(B),
        .Sum(Sum),
        .Cout(Cout)
    );

    // Test all possible input combinations
    initial begin
        // Header
        $display("Time\tA B | Sum Cout");
        $display("---------------------");

        // Test case 1: A=0, B=0
        A = 0; B = 0; #10;
        $display("%0t\t%b %b |  %b   %b", $time, A, B, Sum, Cout);

        // Test case 2: A=0, B=1
        A = 0; B = 1; #10;
        $display("%0t\t%b %b |  %b   %b", $time, A, B, Sum, Cout);

        // Test case 3: A=1, B=0
        A = 1; B = 0; #10;
        $display("%0t\t%b %b |  %b   %b", $time, A, B, Sum, Cout);

        // Test case 4: A=1, B=1
        A = 1; B = 1; #10;
        $display("%0t\t%b %b |  %b   %b", $time, A, B, Sum, Cout);

        // Finish simulation
        $finish;
    end

endmodule
