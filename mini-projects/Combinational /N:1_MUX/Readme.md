# 🟢 Parameterized N-to-1 Multiplexer (SystemVerilog)

This repository contains a **parameterized N-to-1 multiplexer** implemented in SystemVerilog along with a **self-checking testbench**.  
The design is generic, supporting arbitrary **data width** and **number of inputs (N)**.

---

## 📌 Features
- **Parameterized data width** (`width`)
- **Parameterized number of inputs** (`N`)
- **Automatic select line width** calculated using `$clog2(N)`
- **Self-checking testbench** with assertions
- Clean, modular, and reusable SystemVerilog code

---

## 📂 Files
- `nto1_mux.sv` → RTL design of N-to-1 multiplexer  
- `nto1_mux_tb.sv` → Self-checking testbench for verification  

---

## 🖥️ RTL Design

```systemverilog
module nto1_mux#(
    parameter width = 32,
    parameter N = 8
)(
    input  logic [width-1:0] d [0:N-1],         // Input data lines
    input  logic [$clog2(N)-1:0] sel,           // Select line
    output logic [width-1:0] m_out              // Output
);

    // Combinational logic: select one input
    always_comb begin
        m_out = d[sel];
    end

endmodule

