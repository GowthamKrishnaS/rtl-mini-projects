# 4-to-2 Encoder (One-Hot) - Verilog/SystemVerilog

## Overview
This project contains a **4-to-2 encoder** module and a **self-checking testbench** written in SystemVerilog.  
The encoder converts a **4-bit one-hot input** into a **2-bit binary code output**. The testbench automatically verifies the module functionality using assertions.

---

## Module: `encoder_4to2`

### Ports
| Port Name | Direction | Width | Description |
|-----------|----------|-------|-------------|
| `en_in`  | input    | 4-bit | One-hot input vector (only one bit should be high) |
| `en_out` | output   | 2-bit | Encoded binary output corresponding to the active input |

### Behavior
- If `en_in` = `0001` → `en_out` = `00`
- If `en_in` = `0010` → `en_out` = `01`
- If `en_in` = `0100` → `en_out` = `10`
- If `en_in` = `1000` → `en_out` = `11`
- Default behavior is not explicitly defined, assumes only one-hot inputs.

---

## Testbench: `encoder_4to2_tb`

### Features
- **Self-checking**: Uses a SystemVerilog `task` with `assert` to verify the DUT output automatically.
- Covers all valid one-hot inputs.
- Prints **PASS** or **FAIL** for each test case.
- Uses a small delay (`#1`) to allow combinational logic to settle.

### Test Cases
| Test Input (`en_in`) | Expected Output (`en_out`) |
|--------------------|---------------------------|
| `0001`             | `00`                      |
| `0010`             | `01`                      |
| `0100`             | `10`                      |
| `1000`             | `11`                      |

### Usage
1. Compile the module and testbench in your simulator.
2. Run the simulation.
3. Observe the console output:
   - `pass:` indicates the DUT produced correct output.
   - `failed:` indicates mismatch between DUT output and expected value.
4. Simulation finishes automatically after all test cases.

---

## Notes
- Ensure `en_in` is **one-hot**; the behavior is undefined if multiple bits are high.
- The testbench uses SystemVerilog features (`logic`, `automatic task`, `assert`) and requires a SV-compatible simulator (e.g., Questa, VCS, ModelSim).

---

## Example Output
