
module full_adder_tb;
logic a,b,cin;
logic sum,cout;
full_adder dut(
.a(a),
.b(b),
.cin(cin),
.sum(sum),
.cout(cout)
);

initial begin
for(int i=0;i<8;i++)begin
{a,b,cin}=i;
#1;
$display("Time=%0t | a=%b b=%b cin=%b | sum=%b cout=%b",
              $time, a, b, cin, sum, cout);
end
$finish;
end
endmodule