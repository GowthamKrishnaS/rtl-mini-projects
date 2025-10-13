module tb_sipo();
    logic clk, rst, SI;
    logic [3:0] PO;
    
    sipo dut(.*);
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        rst = 1;
        SI = 1;
        #20 rst = 0;
        
        // Shift in 1011
        SI = 1; #10;  // data = 0001
        SI = 0; #10;  // data = 0010  
        SI = 1; #10;  // data = 0101
        SI = 1; #10;  // data = 1011
        
        $display("Final PO = %4b", PO);  // Should be 1011
        $finish;
    end
endmodule
