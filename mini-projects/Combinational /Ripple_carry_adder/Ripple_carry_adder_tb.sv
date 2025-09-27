module tb_rca;

    parameter N = 4;
    logic [N-1:0] a, b;
    logic cin;
    logic [N-1:0] sum;
    logic cout;

    // DUT
    ripple_carry_adder #(N) dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // Task to check and print in binary
    task automatic check(input [N-1:0] ta, tb, input tcin);
        logic [N:0] expected;
        expected = ta + tb + tcin;
        // Print each part in binary individually
        if ({cout, sum} !== expected)
            $display("ERROR: a=%b b=%b cin=%b -> sum=%b cout=%b | expected=%b",
                     ta, tb, tcin, sum, cout, expected);
        else
            $display("PASS : a=%b b=%b cin=%b -> sum=%b cout=%b",
                     ta, tb, tcin, sum, cout);
    endtask

    initial begin
        $display("Starting Ripple Carry Adder Test (Binary)...");
        $display("a     b     cin | sum   cout"); // Header

        // Test all possible inputs
        for (int i = 0; i < (1 << N); i++) begin
            for (int j = 0; j < (1 << N); j++) begin
                for (int c = 0; c < 2; c++) begin
                    a = i; b = j; cin = c;
                    #1;
                    check(a, b, cin);
                end
            end
        end

        $display("All tests completed.");
        $finish;
    end

endmodule

