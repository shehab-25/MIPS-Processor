////////////////////////////////////////////////
// By: Shehab Eldeen Khaled Mabrouk
// Block name : ALU 
///////////////////////////////////////////////

module ALU (srcA,srcB,alu_control,alu_result);
    parameter DATA_WIDTH = 32;
    input [DATA_WIDTH-1:0] srcA , srcB;
    input [2:0] alu_control;
    output reg [DATA_WIDTH-1:0] alu_result;

    always @(*) begin
        case (alu_control)
            3'b000 : alu_result = srcA & srcB;  // AND
            3'b001 : alu_result = srcA | srcB;  // OR
            3'b010 : alu_result = srcA + srcB;  // Add
            3'b110 : alu_result = srcA - srcB;  // Subtract
            3'b111 : alu_result = (srcA < srcB)? 1:0;  // Slt
            default: alu_result = 0;
        endcase
    end
endmodule