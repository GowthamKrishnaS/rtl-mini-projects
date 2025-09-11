#  Parameterized N-to-1 Multiplexer (SystemVerilog)

This repository contains a **parameterized N-to-1 multiplexer** implemented in SystemVerilog along with a **self-checking testbench**.  
The design is generic, supporting arbitrary **data width** and **number of inputs (N)**.

---

##  Features
- **Parameterized data width** (`width`)
- **Parameterized number of inputs** (`N`)
- **Automatic select line width** calculated using `$clog2(N)`
- **Self-checking testbench** with assertions
- Clean, modular, and reusable SystemVerilog code

---

##  Files
- `nto1_mux.sv` → RTL design of N-to-1 multiplexer  
- `nto1_mux_tb.sv` → Self-checking testbench for verification  


