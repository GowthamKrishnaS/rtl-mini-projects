

## Module: 2-to-1 Multiplexer (MUX)

**Files:**  
- `mux_2to1.sv` → Parameterized 2-to-1 MUX  
- `mux_2to1_tb.sv` → Self-checking testbench  

**Description:**  
- Parameterized width (default 32-bit).  
- Selects between inputs `a` and `b` using `sel`.  
- Combinational logic implemented with `always_comb`.  
- Testbench uses **assertions** to automatically verify output correctness:  
  - Stops simulation if output is incorrect.  
  - Displays “Test passed” messages for each test case.  

**Usage Example:**  
```systemverilog
// Combinational selection
m_out = (sel) ? a : b;
