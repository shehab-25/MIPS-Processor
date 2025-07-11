////////////////////////////////////////////////
// By: Shehab Eldeen Khaled Mabrouk
// Block name : ALU 
///////////////////////////////////////////////

module ALU (srcA,srcB,alu_control,alu_result,zero);
    parameter DATA_WIDTH = 32;
    input [DATA_WIDTH-1:0] srcA , srcB;
    input [2:0] alu_control;
    output reg [DATA_WIDTH-1:0] alu_result;
    output zero;

    always @(*) begin
        case (alu_control)
            3'b000 : alu_result = srcA & srcB;
            3'b001 : alu_result = srcA | srcB;
            3'b010 : alu_result = srcA + srcB;
            3'b110 : alu_result = srcA - srcB;
            3'b111 : alu_result = (srcA < srcB)? 1:0;
            default: alu_result = 0;
        endcase
    end

    assign zero = (alu_result==0)? 1:0;
endmodule