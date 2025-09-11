//=============================================
// Parameterized N-to-1 Multiplexer testbench
//=============================================

`timescale 1ns/1ps
module nto1_mux_tb;

    // Parameters
    parameter width = 32 ;
    parameter N= 8;

    // Testbench signals
    logic  [width-1:0] d[0:N-1];               // Input data array
    logic [$clog2(N)-1:0]sel;                  // Select line
    logic [width-1:0] m_out;                   // DUT output

    // DUT instantiation
    nto1_mux #(.width(width), .N(N)) dut (.*);

    // ---------------------------------------------------
    // Self-checking task: compares DUT output vs expected
    // ---------------------------------------------------
    task automatic check_mux(input [$clog2(N)-1:0]s,input [width-1:0] expected);
        sel=s;
        #1 // small delay for propagation

        // Assertion check
        assert(m_out === expected)
            $display("pass: sel=%b | m_out=%h | expected=%h|",s,m_out,expected);
        else
             $error("failed: sel=%b | m_out=%h | expected=%h|",s,m_out,expected);

    endtask 

    // ---------------------------------------------------
    // Test stimulus
    // ---------------------------------------------------
    initial begin
        // Initialize test input values
        d[0] = 32'hAAAA_AAAA; 
        d[1] = 32'hBBBB_BBBB;
        d[2] = 32'hCCCC_CCCC;
        d[3] = 32'hDDDD_DDDD;
        d[4] = 32'hEEEE_EEEE;
        d[5] = 32'hFFFF_FFFF;
        d[6] = 32'h1111_1111;
        d[7] = 32'h2222_2222;

        // Loop through all inputs and check mux output
        for(int i=0;i<N;i++)begin
            check_mux(i,d[i]);
        end

        $display("All testcases completed");
        $finish;
    end 
endmodule
