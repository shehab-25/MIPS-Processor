# MIPS Processor Projects

This repository contains two MIPS processor implementations in Verilog HDL:
- **Single Cycle MIPS Processor**
- **Pipelined MIPS Processor**

Each design is built using basic building blocks and thoroughly tested using testbenches.

## Single Cycle MIPS Processor

### Overview
This is a Verilog implementation of a **Single Cycle MIPS Processor** that executes each instruction in **one clock cycle**. The design supports a simplified subset of the MIPS instruction set, and demonstrates how all datapath components work together in a non-pipelined environment.

### Modules Included
- `adder.v`: Performs PC + 4 or branch target calculation.
- `ALU.v`: Arithmetic Logic Unit for executing ALU operations (add, sub, and, or, slt).
- `control_unit.v`: Decodes instructions and generates control signals.
- `data_memory.v`: Simulates read/write access to memory.
- `instruction_memory.v`: Stores the instruction set for simulation.
- `MIPS.v`: Top-level module that integrates all the datapath components.
- `mux.v`: Multiplexers used in various datapath decision points.
- `PC.v`: Program Counter to track instruction addresses.
- `MIPS_tb.v`: Testbench to verify the functionality of the single cycle processor.
- `register_file.v`: Implements 32 general-purpose registers with read/write functionality.
- `shift_left_2.v`: Shifts input by 2 bits (used in branch offset computation).
- `shift_left_jump.v`: Shifts the jump target address.
- `sign_extend.v`: Sign extends 16-bit immediate to 32 bits.
- `instructions.dat` : Contains machine code instructions that will be executed.
- `assembly instrcutions.asm` : Contains assembly instructions that will be executed.
- `run_mips.do` : Do file to automate the simulation on Questasim.
- `Constraints_basys3.xdc`: to implement the processor on FPGA (xc7a35ticpg236-1L).

### Supported Instructions
- R-type: `add`, `sub`, `and`, `or`, `slt`
- I-type: `lw`, `sw`, `beq`, `addi`
- J-type: `j`

### Testing
- All instructions are verified using a testbench (`MIPS_tb.v`)
- Memory and register values are observed to confirm correct execution.


## Pipelined MIPS Processor

### Overview
This is a Verilog implementation of a **5-stage pipelined MIPS Processor**. It splits instruction execution into multiple pipeline stages to improve instruction throughput:
1. **IF** – Instruction Fetch
2. **ID** – Instruction Decode
3. **EX** – Execute
4. **MEM** – Memory Access
5. **WB** – Write Back

### Pipelined Processor Features
- Instruction-level parallelism using pipeline registers between stages
- Data hazard handling via forwarding unit and hazard detection
- Control hazard handling using branch decision in ID/EX stage

### Features

- **Five Pipeline Stages**:
  - **IF** – Instruction Fetch  
  - **ID** – Instruction Decode & Register Read  
  - **EX** – ALU Execution  
  - **MEM** – Data Memory Access  
  - **WB** – Write Back to Register File

- **Supported Instructions**:
  - Arithmetic: `add`, `sub`, `addi`
  - Logical: `or`, `and`
  - Comparison: `slt`
  - Memory: `lw`, `sw`
  - Control Flow: `beq`, `j`

- **Hazard Management**:
  - **Data hazards** handled via a forwarding unit
  - **Load-use hazards** detected and resolved with stalling
  - **Control hazards** handled with branch and jump flushing

- **Jump Instruction (`j`)**:
  - Fully supported with proper flushing of Decode and Execute stages to avoid incorrect execution

### Modules Included
| Module                  | Description |
|-------------------------|-------------|
| `MIPS.v`                | Top-level design integrating all stages |
| `MIPS_tb.v`             | Comprehensive testbench to simulate the processor |
| `fetch_decode.v`        | IF/ID pipeline register |
| `decode_execute.v`      | ID/EX pipeline register |
| `Execute_Mem.v`         | EX/MEM pipeline register |
| `Mem_WB.v`              | MEM/WB pipeline register |
| `control_unit.v`        | Generates control signals based on opcode |
| `hazard_unit.v`         | Detects and handles data/control hazards |
| `forwarding_unit.v`     | Handles forwarding logic to prevent stalls |
| `instruction_memory.v`  | ROM for instruction fetch |
| `data_memory.v`         | RAM for data read/write |
| `register_file.v`       | 32x32-bit register file with 2-read 1-write ports |
| `ALU.v`, `adder.v`      | Arithmetic and logic units |
| `mux.v`, `mux3_1.v`     | Multiplexers used in pipeline control |
| `PC.v`                  | Program Counter logic |
| `shift_left_2.v`, `shift_left_jump.v` | Logic for jump/branch addressing |
| `sign_extend.v`         | 16-to-32-bit immediate extender |
| `assembly_instructions.asm` | Assembly source program |
| `instructions.dat`      | Machine code version of `assembly_instructions.asm` |
| `run_mips.do`           | ModelSim simulation script |
| `Constraints_basys3.xdc`| FPGA pin constraints for Basys 3 |

### Simulation

1. Open ModelSim
2. Run the provided script:
   ```tcl
   do run_mips.do
---

### Notes
- The single-cycle version is simpler and good for understanding basic datapath.
- The pipelined version is optimized for performance and closer to real CPU behavior.
