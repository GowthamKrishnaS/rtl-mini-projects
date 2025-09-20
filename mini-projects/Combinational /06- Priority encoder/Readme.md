
# 4-to-2 Priority Encoder - Verilog/SystemVerilog

## Overview
This project contains a **4-to-2 priority encoder** module along with a **self-checking testbench** in SystemVerilog.  

- **Priority Encoder:** If multiple inputs are high, the output corresponds to the **highest-priority active input**.  
- Input `en_in[3]` has the **highest priority**, `en_in[0]` has the **lowest priority**.

---

## Module: `_priority_encoder`

### Ports
| Port Name | Direction | Width | Description |
|-----------|----------|-------|-------------|
| `en_in`  | input    | 4-bit | Input vector; multiple bits may be high simultaneously |
| `en_out` | output   | 2-bit | Encoded binary output corresponding to the highest-priority input |

### Behavior
| Input (`en_in`) | Highest-Priority Bit | Output (`en_out`) |
|----------------|-------------------|-----------------|
| `1000`         | Bit 3             | `11`            |
| `0100`         | Bit 2             | `10`            |
| `0010`         | Bit 1             | `01`            |
| `0001`         | Bit 0             | `00`            |
| `1010`         | Bit 3 (priority) | `11`            |
| `1111`         | Bit 3 (priority) | `11`            |

---

## Testbench: `encoder_priority_tb`

### Features
- **Self-checking:** Uses a SystemVerilog `task` with `assert` to verify DUT output automatically.
- **Priority behavior verification:** Checks both single-bit and multiple-bit input cases.
- **Displays pass/fail** messages for each test case.
- Includes `#10` delay for combinational settling.

### Test Cases
| Test Input (`en_in`) | Expected Output (`en_out`) | Description |
|--------------------|---------------------------|-------------|
| `1000`             | `11`                      | Single highest bit active |
| `0100`             | `10`                      | Single bit 2 active |
| `0010`             | `01`                      | Single bit 1 active |
| `0001`             | `00`                      | Single lowest bit active |
| `1010`             | `11`                      | Multiple bits active, highest priority (bit 3) chosen |
| `0011`             | `01`                      | Multiple bits active, bit 1 has higher priority than bit 0 |
| `1111`             | `11`                      | All bits active, highest priority bit (3) chosen |

### Usage
1. Compile the priority encoder module and testbench in a SystemVerilog-compatible simulator.
2. Run the simulation.
3. Observe console output:
   - `pass:` indicates the DUT produced the correct output.
   - `failed:` indicates a mismatch between DUT output and expected value.
4. Simulation finishes automatically after all test cases.

---

