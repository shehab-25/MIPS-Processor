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

### 🧪 Testing
- All instructions are verified using a testbench (`MIPS_tb.v`)
- Memory and register values are observed to confirm correct execution.


## Pipelined MIPS Processor
- it will be added soon  
