# 4-to-1 Multiplexer (32-bit) – SystemVerilog

## Overview
This repository contains the RTL code for a **4-to-1 multiplexer** (`mux41`) and a **self-checking testbench** (`mux_4to1_tb`).  
The multiplexer selects one of four 32-bit inputs based on a 2-bit select signal.

---

## Module: `mux41`

### Description
The `mux41` module implements a 4-to-1 multiplexer.

**Inputs**:
- `d0`, `d1`, `d2`, `d3` — 32-bit data inputs  
- `sel` — 2-bit select signal  

**Output**:
- `out` — 32-bit output, equal to the input selected by `sel`

**Truth Table**:

| sel  | out  |
|------|------|
| 00   | d0   |
| 01   | d1   |
| 10   | d2   |
| 11   | d3   |

---

## Testbench: `mux_4to1_tb`

### Description
The testbench performs **self-checking verification**:

- Initializes input signals (`d0` to `d3`) with test values.  
- Applies all possible values of the select signal (`sel`).  
- Compares the module output with the expected value.  
- Prints `PASS` or `FAIL` for each test case.

### Features
- Uses an **automatic task** `check_mux` for concise testing.  
- 32-bit wide data support.  
- Simple propagation delay of `#1` for output stabilization.  
- Clear console messages for verification results.

---

## How to Run

**Simulation Tools**: ModelSim, QuestaSim, VCS, Icarus Verilog, or any SystemVerilog simulator.

**Compile and Run Example (Questa/ModelSim)**:

```bash
vlog mux41.sv mux_4to1_tb.sv
vsim mux_4to1_tb
run -all

