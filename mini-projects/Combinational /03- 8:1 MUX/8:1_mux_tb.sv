//========================================
//     8-to-1 Multiplexer test bench
//========================================


module mux_8to_1_tb;
    parameter width = 32;

    logic [width-1:0] d0, d1, d2, d3, d4, d5, d6, d7;
    logic [2:0] sel;
    logic [width-1:0] m_out;
    mux_8to1 #(.width(width)) dut(.*);

    task automatic check_mux(input [2:0]s,input [width-1:0] expected);
        sel=s;
        #1
        assert(m_out === expected)
            $display("pass: sel=%b | m_out=%h | expected=%h ",s,m_out,expected);
        else
            $error("fail: sel=%b | m_out=%h | expected=%h ",s,m_out,expected);

    endtask

    initial begin

        d0 = 32'hAAAA_AAAA; 
        d1 = 32'hBBBB_BBBB;
        d2 = 32'hCCCC_CCCC;
        d3 = 32'hDDDD_DDDD;
        d4 = 32'hEEEE_EEEE;
        d5 = 32'hFFFF_FFFF;
        d6 = 32'h1111_1111;
        d7 = 32'h2222_2222;

        check_mux(3'b000,d0);
        check_mux(3'b001,d1);
        check_mux(3'b010,d2);
        check_mux(3'b011,d3);
        check_mux(3'b100,d4);
        check_mux(3'b101,d5);
        check_mux(3'b110,d6);
        check_mux(3'b111,d7);
        
         $display("All testcases completed.");
         $finish;
    end
endmodule

