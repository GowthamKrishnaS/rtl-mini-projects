`timescale 1ns/1ps
module nto1_mux_tb;
parameter width = 32 ;
parameter N= 8;
logic  [width-1:0] d[0:N-1];
logic [$clog2(N)-1:0]sel;
logic [width-1:0] m_out;
nto1_mux #(.width(width), .N(N)) dut (.*);
task automatic check_mux(input [$clog2(N)-1:0]s,input [width-1:0] expected);
sel=s;
#1
assert(m_out === expected)
$display("pass: sel=%b | m_out=%h | expected=%h|",s,m_out,expected);
else
$error("failed: sel=%b | m_out=%h | expected=%h|",s,m_out,expected);

endtask 
initial begin
        d[0] = 32'hAAAA_AAAA; 
        d[1]= 32'hBBBB_BBBB;
        d[2] = 32'hCCCC_CCCC;
        d[3] = 32'hDDDD_DDDD;
        d[4] = 32'hEEEE_EEEE;
        d[5] = 32'hFFFF_FFFF;
        d[6] = 32'h1111_1111;
        d[7] = 32'h2222_2222;

for(int i=0;i<N;i++)begin
        check_mux(i,d[i]);
     end
$display("All testcases completed");
$finish;
end 
endmodule

