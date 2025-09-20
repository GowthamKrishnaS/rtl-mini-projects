# 2-to-4 Decoder - Verilog/SystemVerilog

## Overview
This project contains a **2-to-4 decoder** module along with a **self-testing testbench** in SystemVerilog.  

- **Decoder:** Converts a 2-bit binary input into a 4-bit **one-hot output**.  
- The testbench automatically verifies the module using assertions and prints **pass/fail** messages.

---

## Module: `decoder_2to4`

### Ports
| Port Name | Direction | Width | Description |
|-----------|----------|-------|-------------|
| `de_in`  | input    | 2-bit | Binary input vector |
| `de_out` | output   | 4-bit | One-hot output corresponding to input |

### Behavior
| Input (`de_in`) | Output (`de_out`) |
|----------------|-----------------|
| `00`           | `0001`          |
| `01`           | `0010`          |
| `10`           | `0100`          |
| `11`           | `1000`          |

> Only one output bit is high corresponding to the binary input value.

---

## Testbench: `decoder_2to4_tb`

### Features
- **Self-testing:** Uses a SystemVerilog `task` (`check_de`) with `assert` to automatically check DUT output.
- Covers all 4 possible 2-bit input combinations.
- Displays **pass** if output matches expected, **failed** otherwise.
- Uses `#10` delay to allow combinational logic to settle.

### Test Cases
| Test Input (`de_in`) | Expected Output (`de_out`) |
|--------------------|---------------------------|
| `00`               | `0001`                    |
| `01`               | `0010`                    |
| `10`               | `0100`                    |
| `11`               | `1000`                    |

### Usage
1. Compile the `decoder_2to4` module and `decoder_2to4_tb` testbench in a SystemVerilog-compatible simulator.  
2. Run the simulation.  
3. Observe console output:  
   - `pass:` indicates DUT output is correct.  
   - `failed:` indicates DUT output does not match the expected value.  
4. Simulation finishes automatically after all test cases.

---


