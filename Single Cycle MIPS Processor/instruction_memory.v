////////////////////////////////////////////////
// By: Shehab Eldeen Khaled Mabrouk
// Block name : Instruction memory 
///////////////////////////////////////////////

module instruction_memory (pc,instruction);
    parameter MEM_WIDTH = 32;
    parameter MEM_DEPTH = 1024;

    input [MEM_WIDTH-1:0] pc;
    output [MEM_WIDTH-1:0] instruction;

    reg [MEM_WIDTH-1:0] inst_mem [MEM_DEPTH-1:0];

    initial begin
        $readmemh("instructions.dat",inst_mem);
    end

    assign instruction = inst_mem[pc>>2]; // converted from byte address to word index
endmodule