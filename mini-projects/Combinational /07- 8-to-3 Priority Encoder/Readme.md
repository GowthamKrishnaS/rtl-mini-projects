
# 8-to-3 Priority Encoder - Verilog/SystemVerilog

## Overview
This project contains an **8-to-3 priority encoder** module along with a **self-checking testbench** in SystemVerilog.  

- **Priority Encoder:** When multiple inputs are high simultaneously, the encoder outputs the binary code of the **highest-priority active input**.  
- Input `en_in[7]` has the **highest priority**, `en_in[0]` has the **lowest priority**.

---

## Module: `priority_encoder_8to3`

### Ports
| Port Name | Direction | Width | Description |
|-----------|----------|-------|-------------|
| `en_in`  | input    | 8-bit | Input vector; multiple bits may be high at the same time |
| `en_out` | output   | 3-bit | Encoded binary output corresponding to the highest-priority input |

### Behavior
| Input (`en_in`) | Highest-Priority Bit | Output (`en_out`) |
|----------------|-------------------|-----------------|
| `10000000`     | Bit 7             | `111`           |
| `01000000`     | Bit 6             | `110`           |
| `00100000`     | Bit 5             | `101`           |
| `00010000`     | Bit 4             | `100`           |
| `00001000`     | Bit 3             | `011`           |
| `00000100`     | Bit 2             | `010`           |
| `00000010`     | Bit 1             | `001`           |
| `00000001`     | Bit 0             | `000`           |
| `10010000`     | Bit 7             | `111`           |
| `00001001`     | Bit 3             | `011`           |
| `00100100`     | Bit 5             | `101`           |
| `01000010`     | Bit 6             | `110`           |
| `00011001`     | Bit 4             | `100`           |

> Note: In all cases with multiple bits set, the **highest-priority bit** determines the output.

---

## Testbench: `encoder_priority_8to3_tb`

### Features
- **Self-checking:** Uses a SystemVerilog `task` with `assert` to automatically verify DUT output.
- **Priority behavior verification:** Checks both single-bit and multiple-bit inputs.
- Displays **pass/fail messages** for each test case.
- Uses `#10` delay for combinational settling.

### Test Cases
- **Single-bit inputs:** 8 test cases covering all 8 input lines individually.  
- **Multiple-bit inputs:** 5 test cases to verify that the highest-priority input is encoded correctly.

### Usage
1. Compile the priority encoder module and testbench in a SystemVerilog-compatible simulator (Questa, ModelSim, VCS, etc.).
2. Run the simulation.
3. Observe console output:
   - `pass:` indicates DUT produced the correct output.
   - `failed:` indicates mismatch between DUT output and expected value.
4. Simulation finishes automatically after all test cases.

---

